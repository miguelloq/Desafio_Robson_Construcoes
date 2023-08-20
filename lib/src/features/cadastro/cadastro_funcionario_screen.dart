import 'package:desafio_robson_construcoes/src/core/models/lista_cargos_funcionarios.dart';
import 'package:desafio_robson_construcoes/src/features/cadastro/components/snackbar_feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CadastroFuncionarioScreen extends StatefulWidget {
  const CadastroFuncionarioScreen({super.key});

  @override
  State<CadastroFuncionarioScreen> createState() =>
      _CadastroFuncionarioScreenState();
}

class _CadastroFuncionarioScreenState extends State<CadastroFuncionarioScreen> {
  late final ListaCargosFuncionarios listaPrincipal;
  late final TextEditingController controllerNome;
  late final TextEditingController controllerId;

  int posicaoCargoEscolhido = 0;

  _cadastrarFuncionario(
      {required String nome, required int id, required int idCargo}) {
    try {
      listaPrincipal.adicionaFuncionario(
          nomeFuncionario: nome, idFuncionario: id, idCargo: idCargo);
      showSnackbarFeedback(
          context: context,
          mensagem: 'Sucesso em adicionar novo funcionário.',
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
    controllerNome = TextEditingController();
    controllerId = TextEditingController();
    super.initState();
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
                  'Cadastre um funcionário!',
                  style: Theme.of(context).textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                child: TextField(
                  controller: controllerNome,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: controllerId,
                  decoration: const InputDecoration(
                    labelText: 'Codigo Funcionário',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              DropdownButton<int>(
                borderRadius: BorderRadius.circular(20),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * .8,
                  child: ElevatedButton(
                    onPressed: () {
                      _cadastrarFuncionario(
                          nome: controllerNome.text,
                          id: int.parse(controllerId.text),
                          idCargo: posicaoCargoEscolhido);
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
