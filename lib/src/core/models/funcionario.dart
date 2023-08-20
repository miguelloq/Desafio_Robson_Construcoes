class Funcionario {
  int id;
  String nome;
  int idCargo;
  Funcionario({
    required this.id,
    required this.nome,
    required this.idCargo,
  });

  @override
  String toString() => 'Funcionario(id: $id, nome: $nome, codigoCargo: $id)';
}
