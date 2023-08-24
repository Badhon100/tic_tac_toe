import 'package:flutter/material.dart';
import 'package:tic_tac_toe/const.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String playerDeclaration = '';
  bool oTurn = true;
  List<String> displayXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.primaryColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: const Text("Score board"),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Const.secondaryColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 5,
                          color: Const.primaryColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          displayXO[index],
                          style: TextStyle(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: Const.primaryColor),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              playerDeclaration,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  _tapped(index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  _checkWinner() {
    //1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[1] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[0]} Wins";
      });
    }
    //2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[4] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[3]} Wins";
      });
    }

    //3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[7] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[6]} Wins";
      });
    }

    //1st Column
    if (displayXO[0] == displayXO[3] &&
        displayXO[3] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[0]} Wins";
      });
    }

    //2nd Column
    if (displayXO[1] == displayXO[4] &&
        displayXO[4] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[0]} Wins";
      });
    }

    //3rd Column
    if (displayXO[2] == displayXO[5] &&
        displayXO[5] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[2]} Wins";
      });
    }

    //1st creoss
    if (displayXO[0] == displayXO[4] &&
        displayXO[4] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[0]} Wins";
      });
    }

    //2nd cross
    if (displayXO[2] == displayXO[4] &&
        displayXO[4] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[2]} Wins";
      });
    }
  }
}
