import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:stayzen/login.dart';
import 'package:stayzen/profil.dart';


import 'Home.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Stayzen",
      home: LoginPage(),
    )
  );
}
