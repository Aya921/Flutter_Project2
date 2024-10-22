 // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

 import 'package:flutter/material.dart';

Row custom_app(double size,Color color,IconData icon,String txt,void Function()? ontap,double numb) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
            //const Color.fromARGB(255, 208, 207, 207)    
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: color,
                  ),
                  width: size,
                  height: 50,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: ontap,
                          child: Icon(
                           icon,
                            size: 25,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          txt,
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: numb),
                  child: Icon(
                   Icons.menu,
                    size: 25,
                  ),
                )
              ],
            );
  }

