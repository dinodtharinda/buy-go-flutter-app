import 'package:flutter/material.dart';

void showCustomSnackbar(String? msg,BuildContext context){
  final snackBar = SnackBar(
              content:  Text(msg?? "Something Wrong!"),
              backgroundColor: Colors.blueAccent,
              duration: const Duration(seconds: 3),
              action: SnackBarAction(
                label: 'Close',
                onPressed: () {
                  // Some action to be performed when the user presses the action button
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
}