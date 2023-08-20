import 'package:flutter/material.dart';

class TileFuncionario extends StatelessWidget {
  final int posicaoVetorFuncionario;
  final String nomeFuncionario;
  final int idFuncionario;
  final int idCargoFuncionario;
  final double salarioCargo;
  const TileFuncionario(
      {super.key,
      required this.posicaoVetorFuncionario,
      required this.nomeFuncionario,
      required this.idFuncionario,
      required this.idCargoFuncionario,
      required this.salarioCargo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: false,
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Text(
          posicaoVetorFuncionario.toString(),
        ),
      ),
      trailing: const Icon(Icons.person_outline_rounded),
      title: Text(
        'Funcionário $idFuncionario: $nomeFuncionario',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        'Cargo $idCargoFuncionario com salário de R\$${salarioCargo.toStringAsFixed(2)}',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
