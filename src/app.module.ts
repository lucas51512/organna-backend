import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsuarioModule } from './usuario/usuario.module';
import { PomodoroModule } from './pomodoro/pomodoro.module';
import { TarefaModule } from './tarefa/tarefa.module';
import { PrioridadeModule } from './prioridade/prioridade.module';
import { NotaModule } from './nota/nota.module';
import { EtiquetaModule } from './etiqueta/etiqueta.module';

@Module({
  imports: [UsuarioModule, PomodoroModule, TarefaModule, PrioridadeModule, NotaModule, EtiquetaModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
