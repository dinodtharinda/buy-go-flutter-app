import 'package:flutter/material.dart';

void navigateToRoute(BuildContext context, Widget route) {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return route;
    }));
}

void navigateToRouteReplace(BuildContext context, Widget route) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return route;
    },) );
}