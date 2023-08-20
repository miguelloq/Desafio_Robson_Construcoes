import 'cargo.dart';
import 'funcionario.dart';

class ListaCargosFuncionarios {
  final List<Cargo> listaCargos;
  final List<Funcionario> listaFuncionarios;

  ListaCargosFuncionarios._construtorPrivado()
      : listaCargos = [
          Cargo(id: 0, salario: 2500),
          Cargo(id: 1, salario: 1500),
          Cargo(id: 2, salario: 10000),
          Cargo(id: 3, salario: 1200),
          Cargo(id: 4, salario: 800),
        ],
        listaFuncionarios = [
          Funcionario(id: 15, nome: 'João da Silva', idCargo: 1),
          Funcionario(id: 1, nome: 'Pedro Santos', idCargo: 2),
          Funcionario(id: 26, nome: 'Maria Oliveira', idCargo: 3),
          Funcionario(id: 12, nome: 'Rita Alcântra', idCargo: 4),
          Funcionario(id: 8, nome: 'Ligia Mantos', idCargo: 2),
        ];

  static final ListaCargosFuncionarios _instance =
      ListaCargosFuncionarios._construtorPrivado();

  factory ListaCargosFuncionarios() {
    return _instance;
  }

  bool _contemIdCargo({required int idCargo}) {
    return idCargo < listaCargos.length;
  }

  bool _contemIdFuncionario({required int id}) {
    for (var funcionario in listaFuncionarios) {
      if (funcionario.id == id) {
        return true;
      }
    }
    return false;
  }

  int _quatFuncionariosComCargo({required int idCargo}) {
    int quantFuncionariosComCargo = 0;
    for (var funcionario in listaFuncionarios) {
      if (funcionario.idCargo == idCargo) {
        quantFuncionariosComCargo++;
      }
    }
    return quantFuncionariosComCargo;
  }

  void adicionaFuncionario({
    required String nomeFuncionario,
    required int idFuncionario,
    required int idCargo,
  }) {
    Funcionario novoFuncionario =
        Funcionario(id: idFuncionario, nome: nomeFuncionario, idCargo: idCargo);
    if (_contemIdFuncionario(id: novoFuncionario.id)) {
      throw Exception(
          'Id de funcionário já existe em outro funcionário cadastrado.');
    }
    if (!(_contemIdCargo(idCargo: novoFuncionario.idCargo))) {
      throw Exception('Não existe cargo com esse id!');
    }
    listaFuncionarios.add(novoFuncionario);
  }

  void adicionaCargo({required double salarioDoCargo}) {
    if (salarioDoCargo < 0) {
      throw Exception('O salário deve ser maior que 0.');
    }
    listaCargos.add(Cargo(id: listaCargos.length, salario: salarioDoCargo));
  }

  double retornaTotalSalarioBaseadoEmCargo({required int idCargo}) {
    if (!(_contemIdCargo(idCargo: idCargo))) {
      throw Exception('Não existe cargo com esse id!');
    }
    return _quatFuncionariosComCargo(idCargo: idCargo) *
        listaCargos[idCargo].salario;
  }

  @override
  String toString() =>
      'ListCargosFuncionarios(\n listaCargos: $listaCargos, \n listaFuncionarios: $listaFuncionarios)';
}
