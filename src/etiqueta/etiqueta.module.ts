import { Module } from '@nestjs/common';
import { EtiquetaService } from './etiqueta.service';
import { EtiquetaController } from './etiqueta.controller';
import { PrismaService } from 'src/prisma.service';

@Module({
  controllers: [EtiquetaController],
  providers: [EtiquetaService, PrismaService],
})
export class EtiquetaModule {}
