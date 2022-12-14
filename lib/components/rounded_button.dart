import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String textBtn;
  final Color colBtn;
  final Function onPressed;

  RoundedButton(
      {required this.textBtn, required this.colBtn, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colBtn,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            //Go to login screen.
            onPressed();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            textBtn,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
