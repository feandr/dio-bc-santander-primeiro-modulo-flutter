class NomeInvalidoException implements Exception {
  String error() => "Nome Inválido";
  @override
  String toString() {
    return "NomeInvalidoException: ${error()}\n";
  }
}