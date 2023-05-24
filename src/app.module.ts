import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsuarioModule } from './usuario/usuario.module';
import { PomodoroModule } from './pomodoro/pomodoro.module';
import { TarefaModule } from './tarefa/tarefa.module';
import { PrioridadeModule } from './prioridade/prioridade.module';
import { NotaModule } from './nota/nota.module';
import { EtiquetaModule } from './etiqueta/etiqueta.module';
import { PessoaModule } from './pessoa/pessoa.module';
import { AuthModule } from './auth/auth.module';

@Module({
  imports: [UsuarioModule, PomodoroModule, TarefaModule, PrioridadeModule, NotaModule, EtiquetaModule, PessoaModule, AuthModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
