// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:second_project/customs/custom_app.dart';


class Product extends StatelessWidget {
  final Map data;
  const Product({required this.data});

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.85;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          custom_app(size, Colors.orange, Icons.arrow_back, data['title'], () {
            Navigator.pop(context);
          }, 20),
          SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 217, 217, 217),
              child: Image.asset('assets/${data['img']}')),

          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Text(
                  data['title'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['des'],
                  style: TextStyle(
                      color: const Color.fromARGB(255, 212, 210, 210)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['price'],
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
