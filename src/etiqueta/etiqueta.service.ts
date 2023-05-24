import { Injectable } from '@nestjs/common';
import { CreateEtiquetaDto } from './dto/create-etiqueta.dto';
import { UpdateEtiquetaDto } from './dto/update-etiqueta.dto';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class EtiquetaService {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: CreateEtiquetaDto) {
    return await this.prisma.etiqueta.create({
      data: {
        ...data,
      },
    });
  }

  async findAll() {
    return await this.prisma.etiqueta.findMany();
  }

  async findOne(id: number) {
    return await this.prisma.etiqueta.findUnique({
      where: {
        idEtiqueta: id,
      },
    });
  }

  async update(id: number, data: UpdateEtiquetaDto) {
    return await this.prisma.etiqueta.update({
      where: { idEtiqueta: id },
      data,
    });
  }

  async remove(id: number) {
    await this.prisma.etiqueta.delete({
      where: { idEtiqueta: id },
    });
    return `Etiqueta ${id} removida`;
  }
}
