import { Module } from '@nestjs/common';
import { TarefaService } from './tarefa.service';
import { TarefaController } from './tarefa.controller';
import { PrismaService } from 'src/prisma.service';

@Module({
  controllers: [TarefaController],
  providers: [TarefaService, PrismaService],
})
export class TarefaModule {}
