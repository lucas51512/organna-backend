import { Module } from '@nestjs/common';
import { PrioridadeService } from './prioridade.service';
import { PrioridadeController } from './prioridade.controller';
import { PrismaService } from 'src/prisma.service';

@Module({
  controllers: [PrioridadeController],
  providers: [PrioridadeService, PrismaService],
})
export class PrioridadeModule {}
