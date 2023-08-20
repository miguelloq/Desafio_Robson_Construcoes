import 'package:desafio_robson_construcoes/src/core/models/lista_cargos_funcionarios.dart';
import 'package:desafio_robson_construcoes/src/features/home/components/botao_de_acesso.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: const Text('Bem vindo!'),
      ),
      body: Center(
        child: Wrap(
          children: [
            BotaoDeAcesso(
              padding: 8,
              width: MediaQuery.sizeOf(context).width * 0.4,
              height: MediaQuery.sizeOf(context).height * 0.25,
              nomeDaRotaDoBotao: '/cadastro/funcionario',
              textoBotao: 'Adicionar Funcionário.',
              dataIconeBotao: Icons.person_2,
            ),
            BotaoDeAcesso(
              padding: 8,
              width: MediaQuery.sizeOf(context).width * 0.4,
              height: MediaQuery.sizeOf(context).height * 0.25,
              nomeDaRotaDoBotao: '/cadastro/cargo',
              textoBotao: 'Adicionar Cargo.',
              dataIconeBotao: Icons.account_balance_rounded,
            ),
            BotaoDeAcesso(
              padding: 8,
              width: MediaQuery.sizeOf(context).width * 0.4,
              height: MediaQuery.sizeOf(context).height * 0.25,
              nomeDaRotaDoBotao: '/relatorio',
              textoBotao: 'Visualizar relatório.',
              dataIconeBotao: Icons.task,
            ),
            BotaoDeAcesso(
              padding: 8,
              width: MediaQuery.sizeOf(context).width * 0.4,
              height: MediaQuery.sizeOf(context).height * 0.25,
              nomeDaRotaDoBotao: '/salario_total',
              textoBotao: 'Mostrar total de salário por cargo.',
              dataIconeBotao: Icons.money,
            ),
          ],
        ),
      ),
    );
  }
}
