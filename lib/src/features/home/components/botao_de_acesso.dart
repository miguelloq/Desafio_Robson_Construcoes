import 'package:flutter/material.dart';

class BotaoDeAcesso extends StatelessWidget {
  final double padding;
  final double height;
  final double width;
  final String nomeDaRotaDoBotao;
  final String textoBotao;
  final IconData dataIconeBotao;

  const BotaoDeAcesso(
      {super.key,
      required this.padding,
      required this.nomeDaRotaDoBotao,
      required this.textoBotao,
      required this.dataIconeBotao,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, nomeDaRotaDoBotao);
        },
        child: Ink(
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                dataIconeBotao,
                size: height * 0.50,
              ),
              Text(
                textoBotao,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
