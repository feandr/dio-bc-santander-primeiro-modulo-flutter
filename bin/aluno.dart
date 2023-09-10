class Aluno {
  String nome;
  double prova1;
  double prova2;

  Aluno(this.nome, this.prova1, this.prova2);

  double calcularMedia() {
    return (prova1 + prova2) / 2;
  }
}