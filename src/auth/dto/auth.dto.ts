import { IsEmail, IsNotEmpty, IsString } from 'class-validator';

export class AuthDto {
  nomeUsuario?: string;

  dataNascimento?: string;

  numeroCelular?: string;

  @IsEmail()
  @IsNotEmpty()
  emailUsuario: string;

  @IsString()
  @IsNotEmpty()
  senha: string;
}
