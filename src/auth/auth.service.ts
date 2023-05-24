import { ForbiddenException, Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { AuthDto } from './dto';
import * as argon from 'argon2';
import { Prisma } from '@prisma/client';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config'

@Injectable()
export class AuthService {
  constructor(private prisma: PrismaService,
     private jwt: JwtService,
     private config: ConfigService){}

  async signup(dto: AuthDto){

    try {
      const hash = await argon.hash(dto.senha);
      const user = await this.prisma.usuario.create({
        data: {
          nomeUsuario:dto.nomeUsuario,
          emailUsuario: dto.emailUsuario,
          dataNascimento: dto.dataNascimento,
          numeroCelular: dto.numeroCelular,
          hash,
        },
      });
      return user;
      
    } catch (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if(error.code === 'P2002')
        throw new ForbiddenException('Credenciais já cadastradas',);
        
      }
      throw error;
    }
  }

  async signin(dto: AuthDto){
    // Find user by email
    const user = await this.prisma.usuario.findUnique({
      where: {
        emailUsuario: dto.emailUsuario,
      },
    });

  // if user does not exist throw exception
  if(!user)
  throw new ForbiddenException('Credenciais incorretas',);
  const pwMatches = await argon.verify(user.hash, dto.senha,);

  //if password incorrect throw exception
  if(!pwMatches)
  throw new ForbiddenException('Credenciais incorretas',);
  //send back the user
  return this.signToken(user.idUsuario, user.emailUsuario);
  }

  async signToken(userId: number, email: string): Promise<{acess_token: string}>{
  const data = {
    sub: userId,
    email
  };
  const secret = this.config.get('JWT_SECRET')

  const token = await this.jwt.signAsync(data, {
    expiresIn: '15m',
    secret: secret,
  },);
  
  return {
    acess_token: token,
  };
 }
}
