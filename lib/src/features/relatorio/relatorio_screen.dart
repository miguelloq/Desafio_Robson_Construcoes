import 'package:desafio_robson_construcoes/src/core/models/funcionario.dart';
import 'package:desafio_robson_construcoes/src/core/models/lista_cargos_funcionarios.dart';
import 'package:desafio_robson_construcoes/src/features/relatorio/components/bloco_de_fundo.dart';
import 'package:desafio_robson_construcoes/src/features/relatorio/components/tile_funcionario.dart';
import 'package:flutter/material.dart';

class RelatorioScreen extends StatefulWidget {
  const RelatorioScreen({super.key});

  @override
  State<RelatorioScreen> createState() => _RelatorioScreenState();
}

class _RelatorioScreenState extends State<RelatorioScreen> {
  late final ListaCargosFuncionarios listaPrincipal;

  @override
  void initState() {
    listaPrincipal = ListaCargosFuncionarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocoDeFundo(
            child: ListView.builder(
              itemCount: listaPrincipal.listaFuncionarios.length,
              itemBuilder: (context, index) {
                Funcionario funcionarioEscolhido =
                    listaPrincipal.listaFuncionarios[index];
                return TileFuncionario(
                  posicaoVetorFuncionario: index,
                  nomeFuncionario: funcionarioEscolhido.nome,
                  idFuncionario: funcionarioEscolhido.id,
                  idCargoFuncionario: funcionarioEscolhido.idCargo,
                  salarioCargo: listaPrincipal
                      .listaCargos[funcionarioEscolhido.idCargo].salario,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
