class Aluno {
  String _nome = "";
  final List<double> _notas = [];

  Aluno(String nome) {
    _nome = nome;
  }

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  void addNotas(double nota) {
    _notas.add(nota);
  }

  List<double> getNotas() {
    return _notas;
  }

  double retornaMedia() {
    var media =
        _notas.reduce((value, element) => value + element) / _notas.length;
    return media.isNaN ? 0 : media;
  }

  bool aprovado(notaCorte) {
    return retornaMedia() >= notaCorte;
  }
}
