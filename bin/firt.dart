import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'aluno.dart';

void main() {
  print("Informe nome do aluno:");
  var inputAluno = stdin.readLineSync(encoding: utf8);
  var nomeAluno = inputAluno;

  var aluno = lerNotasAluno(nomeAluno ?? "");
  imprimirNotasFinais(aluno);
}

Aluno lerNotasAluno(String nome) {
  print("Informe a primeira nota:");
  var line = stdin.readLineSync(encoding: utf8);
  var prova1 = double.tryParse(line?.replaceAll(",", ".") ?? "0");

  print("Informe a segunda nota: ");
  line = stdin.readLineSync(encoding: utf8);
  var prova2 = double.tryParse(line?.replaceAll(",", ".") ?? "0");

  return Aluno(nome, prova1!, prova2!);
}

void imprimirNotasFinais(Aluno aluno) {
  var media = aluno.calcularMedia();
  print("${aluno.nome} sua média final é: ${media.toStringAsFixed(2)}");
  verificarAprovacao(media);
}

void verificarAprovacao(double media) {
  if (media <= 6) {
    print(
        "Não foi dessa vez, mas pode se dedicar mais para o próximo semestre!");
  } else if (media >= 6.5) {
    print("Você Passou");
  } else {
    print(
        "Sua média ficou na repescagem e atividade adicional será necessária!");
    print("Sua tarefa será: " + gerarTarefaAleatoria(listaDeTarefas()));

    /*Nota: A documentação tambem esta em Random apenas para titulo
   de aprendizagem, o correto seria pegar o indice exibido na
   lista de tarefas e fazer link com o documento correto. */
    print("Link para consultar documentação da tarefa em: " +
        gerarTarefaAleatoria(listaDocsTarefas()));
  }
}

String gerarTarefaAleatoria(List<String> lista) {
  Random random = Random();
  int indiceAleatorio = random.nextInt(lista.length);
  return lista[indiceAleatorio];
}

List<String> listaDeTarefas() {
  List<String> lista = [
    "PrimeiraTarefa",
    "SegungaTarefa",
    "TerceiraTarefa",
    "QuartaTarefa",
    "QuintaTarefa"
  ];
  return lista;
}

List<String> listaDocsTarefas() {
  List<String> listaDeTarefas = [
    "DocUm",
    "DocDois",
    "DocTres",
    "DocQuarto",
    "DocCinco"
  ];
  return listaDeTarefas;
}
