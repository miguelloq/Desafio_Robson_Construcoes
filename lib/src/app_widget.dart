import 'package:desafio_robson_construcoes/src/features/cadastro/cadastro_cargo_screen.dart';
import 'package:desafio_robson_construcoes/src/features/cadastro/cadastro_funcionario_screen.dart';
import 'package:desafio_robson_construcoes/src/features/home/home_screen.dart';
import 'package:desafio_robson_construcoes/src/features/relatorio/relatorio_screen.dart';
import 'package:desafio_robson_construcoes/src/features/salario_total/salario_total_screen.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Robson Construções",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
          ),
        ),
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/cadastro/cargo': (context) => const CadastroCargoScreen(),
        '/cadastro/funcionario': (context) => const CadastroFuncionarioScreen(),
        '/relatorio': (context) => const RelatorioScreen(),
        '/salario_total': (context) => const SalarioTotalScreen(),
      },
      initialRoute: '/',
    );
  }
}
