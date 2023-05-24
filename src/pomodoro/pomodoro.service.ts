import { Injectable } from '@nestjs/common';
import { CreatePomodoroDto } from './dto/create-pomodoro.dto';
import { UpdatePomodoroDto } from './dto/update-pomodoro.dto';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class PomodoroService {
  constructor(private readonly prisma: PrismaService) {}

  async create(data: CreatePomodoroDto) {
    return await this.prisma.pomodoro.create({
      data: {
        ...data,
      },
    });
  }

  async findAll() {
    return await this.prisma.pomodoro.findMany();
  }

  async findOne(id: number) {
    return await this.prisma.pomodoro.findUnique({
      where: {
        idPomodoro: id,
      },
    });
  }

  async update(id: number, data: UpdatePomodoroDto) {
    return await this.prisma.pomodoro.update({
      where: { idPomodoro: id },
      data,
    });
  }

  async remove(id: number) {
    await this.prisma.pomodoro.delete({
      where: { idPomodoro: id },
    });
    return `Pomodoro ${id} removido`;
  }
}
