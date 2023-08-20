import 'package:desafio_robson_construcoes/src/core/models/lista_cargos_funcionarios.dart';
import 'package:flutter/material.dart';

class SalarioTotalScreen extends StatefulWidget {
  const SalarioTotalScreen({super.key});

  @override
  State<SalarioTotalScreen> createState() => _SalarioTotalScreenState();
}

class _SalarioTotalScreenState extends State<SalarioTotalScreen> {
  late final ListaCargosFuncionarios listaPrincipal;
  late final TextEditingController controllerCodigoCargo;
  late int posicaoCargoEscolhido;

  @override
  void initState() {
    listaPrincipal = ListaCargosFuncionarios();
    controllerCodigoCargo = TextEditingController();
    posicaoCargoEscolhido = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Escolha um cargo!',
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<int>(
                borderRadius: BorderRadius.circular(10),
                underline: const SizedBox(),
                value: posicaoCargoEscolhido,
                hint: const Text('Cargo'),
                items: listaPrincipal.listaCargos
                    .map((e) => DropdownMenuItem(
                          value: e.id,
                          child: Text(
                              'Cargo ${e.id} com ${e.salario.toStringAsFixed(2)} de salário.'),
                        ))
                    .toList(),
                onChanged: (int? valorEscolhido) {
                  if (valorEscolhido != null) {
                    setState(() {
                      posicaoCargoEscolhido = valorEscolhido;
                    });
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Salário somado de todos os funcionários no cargo $posicaoCargoEscolhido: R\$${listaPrincipal.retornaTotalSalarioBaseadoEmCargo(idCargo: posicaoCargoEscolhido.toInt()).toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
