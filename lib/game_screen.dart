import 'package:flutter/material.dart';
import 'package:tic_tac_toe/const.dart';
import 'package:tic_tac_toe/widget/custom_container.dart';

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
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  bool winnerFound = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Player 0",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        oScore.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        "Player X",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        xScore.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                            style: const TextStyle(
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
              child: Column(
                children: [
                  Text(
                    playerDeclaration,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        displayXO = ['', '', '', '', '', '', '', '', ''];
                        playerDeclaration = '';
                      });
                    },
                    child: const CustomContainer(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _tapped(index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes++;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        filledBoxes++;
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
        _updateScore(displayXO[0]);
      });
    }
    //2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[4] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[3]} Wins";
        _updateScore(displayXO[3]);
      });
    }

    //3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[7] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[6]} Wins";
        _updateScore(displayXO[6]);
      });
    }

    //1st Column
    if (displayXO[0] == displayXO[3] &&
        displayXO[3] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[0]} Wins";
        _updateScore(displayXO[0]);
      });
    }

    //2nd Column
    if (displayXO[1] == displayXO[4] &&
        displayXO[4] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[1]} Wins";
        _updateScore(displayXO[1]);
      });
    }

    //3rd Column
    if (displayXO[2] == displayXO[5] &&
        displayXO[5] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[2]} Wins";
        _updateScore(displayXO[2]);
      });
    }

    //1st cross
    if (displayXO[0] == displayXO[4] &&
        displayXO[4] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[0]} Wins";
        _updateScore(displayXO[0]);
      });
    }

    //2nd cross
    if (displayXO[2] == displayXO[4] &&
        displayXO[4] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        playerDeclaration = "Player ${displayXO[2]} Wins";
        _updateScore(displayXO[2]);
      });
    }
    if (!winnerFound && filledBoxes == 9) {
      setState(() {
        playerDeclaration = "Match Draw";
      });
    }
  }

  _updateScore(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
    winnerFound = true;
  }
}


