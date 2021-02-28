import 'package:ImcApp/alerta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'imc_resultado.dart';

class ImcForm extends StatefulWidget {
  @override
  _ImcFormState createState() => _ImcFormState();
}

class _ImcFormState extends State<ImcForm> {
  String _nome;
  double _peso;
  double _altura;

  bool _dadosSaoValidos() {
    return _nome != null && _nome.isNotEmpty && _peso > 0 && _altura > 0;
  }

  void _calcular() {
    if (!_dadosSaoValidos()) {
      showDialog(context: context, child: new Alerta());
      return;
    }

    var imc = _peso / (_altura * _altura);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImcResultado(
                  nome: _nome,
                  peso: _peso,
                  altura: _altura,
                  imc: imc,
                )));
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
              key: Key('nome'),
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                labelText: 'Nome',
                helperText: 'Informe seu nome',
                enabledBorder: UnderlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _nome = value;
                });
              },
            ),
            TextFormField(
              key: Key('altura'),
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                labelText: 'Altura',
                helperText: 'Informe sua altura em metros (m)',
                enabledBorder: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _altura = double.parse(value);
                });
              },
            ),
            TextFormField(
              key: Key('peso'),
              cursorColor: Theme.of(context).cursorColor,
              decoration: InputDecoration(
                labelText: 'Peso',
                helperText: 'Informe seu peso em kilogramas (kg)',
                enabledBorder: UnderlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _peso = double.parse(value);
                });
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: _calcular,
                child: Text('Calcular'),
                key: Key('calculo_button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
