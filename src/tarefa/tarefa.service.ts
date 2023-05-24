import { Injectable } from '@nestjs/common';
import { CreateTarefaDto } from './dto/create-tarefa.dto';
import { UpdateTarefaDto } from './dto/update-tarefa.dto';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class TarefaService {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: CreateTarefaDto) {
    return await this.prisma.tarefa.create({
      data: {
        ...data,
      },
    });
  }

  async findAll() {
    return await this.prisma.tarefa.findMany();
  }

  async findOne(id: number) {
    return await this.prisma.tarefa.findUnique({
      where: {
        idTarefa: id,
      },
    });
  }

  async update(id: number, data: UpdateTarefaDto) {
    return await this.prisma.tarefa.update({
      where: { idTarefa: id },
      data,
    });
  }

  async remove(id: number) {
    await this.prisma.tarefa.delete({
      where: { idTarefa: id },
    });
    return `Tarefa ${id} removido`;
  }
}
