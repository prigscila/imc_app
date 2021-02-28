import 'package:flutter/material.dart';

class ImcResultado extends StatelessWidget {
  ImcResultado({Key key, this.nome, this.peso, this.altura, this.imc})
      : super(key: key);
  final String nome;
  final double peso;
  final double altura;
  final double imc;

  String _imcFormatado() {
    return imc.toStringAsFixed(2);
  }

  String _interpretacaoImc() {
    if (imc < 18.5) return 'Abaixo do peso';
    if (imc < 24.9) return 'Peso ideal';
    if (imc < 29.9) return 'Levemente acima do peso';
    if (imc < 34.9) return 'Obesidade grau I';
    if (imc < 39.9) return 'Obesidade grau II (severa)';
    return 'Obesidade grau III (mórbida)';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculador IMC'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                labelText: 'Nome',
                enabledBorder: UnderlineInputBorder(),
              ),
              initialValue: nome,
              readOnly: true,
            ),
            TextFormField(
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                labelText: 'Altura',
                enabledBorder: UnderlineInputBorder(),
              ),
              initialValue: altura.toString(),
              readOnly: true,
            ),
            TextFormField(
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                labelText: 'Peso',
                enabledBorder: UnderlineInputBorder(),
              ),
              initialValue: peso.toString(),
              readOnly: true,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Text(
                    'IMC ${_imcFormatado()}',
                    style: Theme.of(context).textTheme.headline3,
                    key: Key('imc_resultado'),
                  ),
                  Text(
                    '${_interpretacaoImc()}',
                    style: Theme.of(context).textTheme.headline4,
                    key: Key('imc_resultado_interpretado'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
