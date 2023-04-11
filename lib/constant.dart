import 'package:flutter/material.dart';
class Constants{
  static String appId='AIzaSyCeOWuNaet4phtTiJwBolYLagch1zh-ko4';
  static String apiKey='1:52557901159:web:588df3615ba19963c993c2';
  static String messagingSenderId='52557901159';
  static String projectId ='chatappflutter-202a5';
  final primaryColor = Colors.blue;
}
void nextScreen(context,page){
  Navigator.push(context, MaterialPageRoute(builder: (context) => page,));
}

void nextScreenReplace(context,page){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page,));
}

void showSnackbar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 14),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}