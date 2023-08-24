import 'dart:core';

import 'models/aluno.dart';
import 'models/console_utils.dart';
import 'exception/nome_invalido_exception.dart';

void main() {
  print("Bem vindo ao sistema de notas!");
  String inserirNomeAluno =
      ConsoleUtils.lerStringComTexto("Informe nome do aluno: ");
  try {
    if (inserirNomeAluno.trim() == "") {
      throw NomeInvalidoException();
    }
  } catch (NomeInvalidoException) {
    print(NomeInvalidoException);
  }

  var aluno = Aluno(inserirNomeAluno);
  lerNotasAluno(aluno);
}

lerNotasAluno(Aluno aluno) {
  double? nota;
  do {
    nota = ConsoleUtils.lerDoubleComSaida("Digite nota ou S para sair: ", "S");
    if (nota != null) {
      aluno.addNotas(nota);
    }
  } while (nota != null);
  print(aluno.getNotas());
  print("A Média do aluno ${aluno.getNome()} foi: ${aluno.retornaMedia()}");
  if (aluno.aprovado(7)) {
    print("${aluno.getNome()} você foi APROVADO!");
  } else {
    print("${aluno.getNome()} você foi REPROVADO!");
  }
}
