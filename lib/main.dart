import 'package:api_parsing/pages/create_page.dart';
import 'package:api_parsing/pages/delete_page.dart';
import 'package:api_parsing/pages/detail_page.dart';
import 'package:api_parsing/pages/home_page.dart';
import 'package:api_parsing/pages/update_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  int id;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        HomePage.id:(context) => HomePage(),
        DetailPage.id:(context) => DetailPage(id),
        CreatePage.id:(context) => CreatePage(),
        UpdatePage.id:(context) => UpdatePage(),
        DeletePage.id:(context) => DeletePage(),
      },
    );
  }
}
