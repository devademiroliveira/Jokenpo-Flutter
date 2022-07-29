import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final String _title = 'Home1';

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(_title),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                onSubmitted: (String texto) {
                  // print('Escrito foi: ' + texto);
                },
                controller: _textEditingController,
                // usado para recuperar em tempo real o que é digitado
                // onChanged: (String text) {
                //   print('valor digitado: ' + text);
                // },
                obscureText: false, // deixa texto oculto, ideal para senhas
                keyboardType: TextInputType.name,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.purple,
                ),
                maxLength: 8,

                //maxLengthEnforcement: MaxLengthEnforcement.enforced, INUTIL
                decoration: const InputDecoration(
                  labelStyle: TextStyle(inherit: true),
                  icon: Icon(Icons.drive_file_rename_outline),
                  labelText: 'Qual é o seu nome?',
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(
                  //       Radius.circular(50.0)), // Borda do TextField
                  // )
                )),
            ElevatedButton(
              onPressed: () {
                // print('Enviado foi: ' + _textEditingController.text);
              },
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
