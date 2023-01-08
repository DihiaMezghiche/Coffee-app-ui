// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;

  CoffeeTile(
    {
      required this.coffeeImagePath,
      required this.coffeeName,
      required this.coffeePrice

    }
  )  ;

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black45,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                    //Coffee Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child:  Image.asset(
                        coffeeImagePath,
                         height: 150,
                         width: 200,
                         fit: BoxFit.fitWidth,
                         alignment: Alignment.center,
                        )
                    ),

                    //Coffee Name
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                          coffeeName,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "With almond milk",
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                          ],
                          
                      ),
                    ),

                    //price tag 
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:12.0, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$'+ coffeePrice),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(208, 255, 153, 0),
                              borderRadius: BorderRadius.circular(8)),
                            child: Icon(Icons.add))
                        ],
                      ),
                    )
                  ]),
                ),
              );
              }
}