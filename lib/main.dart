import 'package:flutter/material.dart';
import 'package:list_of_planet/Details_Page.dart';
import 'package:list_of_planet/Home_Page.dart';

void main(){
  runApp(MaterialApp(
debugShowCheckedModeBanner: false,
    routes: {
  "/" : (context) => Home_Page(),
      "detailpage": (context) => const DetailPage(),
    },
  ),
  );
}