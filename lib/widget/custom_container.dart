import 'package:flutter/material.dart';
import 'package:tic_tac_toe/const.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Icon(
        Icons.restart_alt,
        size: MediaQuery.of(context).size.height * 0.05,
        color: Const.primaryColor,
      ),
    );
  }
}
