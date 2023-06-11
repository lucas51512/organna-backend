import { Module } from '@nestjs/common';
import { NotaService } from './nota.service';
import { NotaController } from './nota.controller';
import { PrismaService } from 'src/prisma.service';

@Module({
  controllers: [NotaController],
  providers: [NotaService, PrismaService],
})
export class NotaModule {}
