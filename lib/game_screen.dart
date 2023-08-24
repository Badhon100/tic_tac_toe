import 'package:flutter/material.dart';
import 'package:tic_tac_toe/const.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
            child: const Text(" time"),
          ),
        ],
      ),
    );
  }

  _tapped(index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
      } else {
        displayXO[index] = 'X';
      }
      oTurn = !oTurn;
    });
  }
}
