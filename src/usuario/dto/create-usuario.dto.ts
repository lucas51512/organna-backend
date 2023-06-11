export class CreateUsuarioDto {
  idUsuario?: number;
  nomeUsuario: string;
  dataNascimento: string;
  numeroCelular: string;
  emailUsuario: string;
  hash: string;
  pessoaIdFk?: number | null;
}
