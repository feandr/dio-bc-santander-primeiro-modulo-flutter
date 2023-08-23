import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:math';

void main() {
  print("Informe nome do aluno:");
  var inputAluno = stdin.readLineSync(encoding: utf8);
  var nomeAluno = inputAluno;

  printNotasFinais(nomeAluno);
}

void notasFinais(prova1, prova2, nomeAluno) {
  var media = (prova1! + prova2!) / 2;
  print(nomeAluno.toString() + " sua média final é: " + media.toString());
  aprovacaoMediaFinal(media);
}

void printNotasFinais(nomeAluno) {
  print("Informe a primeira nota:");
  var line = stdin.readLineSync(encoding: utf8);
  var prova1 = double.tryParse(line?.replaceAll(",", ".") ?? "0");

  print("Informe a segunda nota: ");
  line = stdin.readLineSync(encoding: utf8);
  var prova2 = double.tryParse(line?.replaceAll(",", ".") ?? "0");
  notasFinais(prova1, prova2, nomeAluno);
}

void aprovacaoMediaFinal(media) {
  List<String> listaDeTarefas = [
    "PrimeiraTarefa",
    "SegungaTarefa",
    "TerceiraTarefa",
    "QuartaTarefa",
    "QuintaTarefa"
  ];
  List<String> listaDocsTarefas = [
    "DocUm",
    "DocDois",
    "DocTres",
    "DocQuarto",
    "DocCinco"
  ];
  if (media >= 6.5)
    print("Você Passou");
  else if (media <= 6)
    print(
        "Não foi dessa vez, mais pode se dedicar mais para o proximo semestre!");
  else
    print(
        "Sua media ficou na repescagem e a atividade adicional será necessaria!");
  print("Sua tarefa será: " + gerarTarefaAleatoria(listaDeTarefas));
  //Nota: A documentação tambem esta em Random apenas para titulo
  // de apendizagem, o correto seria pegar o indice exibido na
  // lista de tarefas e fazer link com o documento correto.
  print("Link para consultar documentação da tarefa em: " + gerarTarefaAleatoria(listaDocsTarefas) );
}


String gerarTarefaAleatoria(List<String> lista) {
  Random random = Random();
  int indiceAleatorio = random.nextInt(lista.length);
  return lista[indiceAleatorio];
}
