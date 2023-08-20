import 'package:desafio_robson_construcoes/src/core/models/lista_cargos_funcionarios.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/snackbar_feedback.dart';

class CadastroCargoScreen extends StatefulWidget {
  const CadastroCargoScreen({super.key});

  @override
  State<CadastroCargoScreen> createState() => _CadastroCargoScreenState();
}

class _CadastroCargoScreenState extends State<CadastroCargoScreen> {
  late final ListaCargosFuncionarios listaPrincipal;
  late final TextEditingController controllerSalario;

  int posicaoCargoEscolhido = 0;

  _cadastrarCargo({required double salario}) {
    try {
      listaPrincipal.adicionaCargo(salarioDoCargo: salario);
      showSnackbarFeedback(
          context: context,
          mensagem: 'Sucesso em adicionar novo cargo.',
          isError: false);
      Navigator.pop(context);
    } catch (e) {
      showSnackbarFeedback(
          context: context, mensagem: e.toString(), isError: true);
    }
  }

  @override
  void initState() {
    listaPrincipal = ListaCargosFuncionarios();
    controllerSalario = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerSalario.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: Text(
                  'Cadastre um cargo!',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                child: TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  controller: controllerSalario,
                  decoration: const InputDecoration(
                    labelText: 'Salário do novo cargo',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * .8,
                  child: ElevatedButton(
                    onPressed: () {
                      _cadastrarCargo(
                          salario: double.parse(controllerSalario.text));
                    },
                    child: const Text('Cadastrar'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
