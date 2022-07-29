import 'dart:math';

import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var _notificacao = 'Escolha CPU: ';
  var _mensagem = 'Faça sua escolha:';
  var _imageDefault = const AssetImage('image/emoji.png');
  var _imageApp = const AssetImage('image/padrao.png');
  final _imageLose = const AssetImage('image/triste.png');
  final _imageTied = const AssetImage('image/hum.png');
  final _imageWin = const AssetImage('image/love.png');
  final String _titulo = 'We gonna play game?';
  var _placarCpu = 0;
  var _placarPlayer = 0;

  void _opcaoSelect(String escolhaUser) {
    var opcoes = ['Papel', 'Pedra', 'Tesoura'];
    var numero = Random().nextInt(3);
    var _escolhaCpu = opcoes[numero];

    //print('CPU:' + _escolhaCpu);
    //print('PLAYER:' + escolhaUser);

    // Exibindo imagem escolhida pela CPU
    switch (_escolhaCpu) {
      case 'Papel':
        setState(() {
          _imageApp = const AssetImage('image/papel.png');
          //_notificacao = _notificacao + _escolhaCpu;
        });
        break;
      case 'Pedra':
        setState(() {
          _imageApp = const AssetImage('image/pedra.png');
          //
        });
        break;

      case 'Tesoura':
        setState(() {
          _imageApp = const AssetImage('image/tesoura.png');
          //_notificacao = _notificacao + _escolhaCpu;
        });
        break;
    }

    if ((escolhaUser == 'Papel' && _escolhaCpu == 'Pedra') ||
        (escolhaUser == 'Pedra' && _escolhaCpu == 'Tesoura') ||
        (escolhaUser == 'Tesoura' && _escolhaCpu == 'Papel')) {
      setState(() {
        _mensagem = 'Escolheu: ' + escolhaUser + '... Ganhou! ';
        _imageDefault = _imageWin;
        _notificacao = 'CPU: ' + _escolhaCpu;
        _placarPlayer++;
      });
    } else if ((_escolhaCpu == 'Papel' && escolhaUser == 'Pedra') ||
        (_escolhaCpu == 'Pedra' && escolhaUser == 'Tesoura') ||
        (_escolhaCpu == 'Tesoura' && escolhaUser == 'Papel')) {
      setState(() {
        _mensagem = 'Escolheu: ' + escolhaUser + '... Perdeu! ';
        _imageDefault = _imageLose;
        _notificacao = 'CPU: ' + _escolhaCpu;
        _placarCpu++;
      });
    } else if (_escolhaCpu == escolhaUser) {
      setState(() {
        _mensagem = 'Escolheu: ' + escolhaUser + '... Empatou! ';
        _imageDefault = _imageTied;
        _notificacao = 'CPU: ' + _escolhaCpu;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star,
            ),
            iconSize: 30,
          )
        ],
        title: Center(
          child: Text(_titulo),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _notificacao,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: _imageApp,
            width: 120,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _mensagem,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image(
                  image: _imageDefault,
                  width: 50,
                  height: 50,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelect('Papel'),
                child: Image.asset(
                  'image/papel.png',
                  width: 120,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelect('Pedra'),
                child: Image.asset(
                  'image/pedra.png',
                  width: 120,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelect('Tesoura'),
                child: Image.asset(
                  'image/tesoura.png',
                  width: 120,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Lívia',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$_placarPlayer',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'CPU',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$_placarCpu',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
