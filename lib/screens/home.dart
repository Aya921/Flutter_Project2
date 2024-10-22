// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:second_project/customs/custom_app.dart';
import 'package:second_project/model/products.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;
  List displayproducts = [];
 
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.80;
    displayproducts = products[i]['items'];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              custom_app(size, const Color.fromARGB(255, 208, 207, 207),
                  Icons.search, 'Search', () {}, 0),
              SizedBox(
                height: 25,
              ),
              Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 150,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cats.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        for (int i = 0; i < cats.length; i++) {
                          cats[i]['active'] = false;
                        }
                        cats[index]['active'] = true;
                        setState(() {
                          i = index;
                          displayproducts = products[i]['items'];


                        });
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: cats[index]['active']
                                  ? Colors.orange
                                  : Colors.grey,
                              child: Icon(cats[index]['icon']),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(cats[index]['txt'])
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Best Selling',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
                SizedBox(
                height: 50,
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 40,
                   crossAxisSpacing: 15,
                  childAspectRatio:0.7,
                ),
                itemCount: displayproducts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/products',
                          arguments: displayproducts[index]);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          color: Colors.grey,
                          child: Image.asset(
                            'assets/${displayproducts[index]['img']}',
                            height: 100,
                            // Fit the image properly in the container
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                displayproducts[index]['title'],
                               
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                  height:
                                      5), // Add spacing between elements
                              Text(
                                displayproducts[index]['des'],
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '\$${displayproducts[index]['price']}',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
