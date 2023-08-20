class Cargo {
  int id;
  double salario;

  Cargo({
    required this.id,
    required this.salario,
  });

  @override
  String toString() => 'Cargo(id: $id, salario: $salario)';
}
