import { Injectable } from '@nestjs/common';
import { CreateNotaDto } from './dto/create-nota.dto';
import { UpdateNotaDto } from './dto/update-nota.dto';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class NotaService {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: CreateNotaDto) {
    return await this.prisma.nota.create({
      data: {
        ...data,
      },
    });
  }

  async findAll() {
    return await this.prisma.nota.findMany();
  }

  async findOne(id: number) {
    return await this.prisma.nota.findUnique({
      where: {
        idNota: id,
      },
    });
  }

  async update(id: number, data: UpdateNotaDto) {
    return await this.prisma.nota.update({
      where: { idNota: id },
      data,
    });
  }

  async remove(id: number) {
    await this.prisma.nota.delete({
      where: { idNota: id },
    });
    return `Nota ${id} removido`;
  }
}
