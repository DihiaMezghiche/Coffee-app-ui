// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:coffeeappui/Util/coffee_tile.dart';
import 'package:coffeeappui/Util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage ({ Key? key }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    //['coffee type',isSelected]
    ['Cappucion',true],
    ['Latte',false],
    ['Black',false],
    ['Tea',false],
  ];

  void coffeeTypeSelected(int index)
  {
    setState(() {
      for (int i=0; i<coffeeType.length;i++)
      {
        coffeeType[i][1]= false;
      }
      coffeeType[index][1]=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [ 
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.person)
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: ''
          ),
        BottomNavigationBarItem(
          icon:Icon(Icons.favorite),
          label: ''
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: ''
        ),
          
      ]),
      body: Column(children: [
        //Find the best coffee for you
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Find the best coffee for you",
            style: GoogleFonts.bebasNeue(
              fontSize: 56,
            ),
          ),
        ),
        SizedBox(height: 10),
        //Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Find your coffee ...',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600)
              ),
            ),
          ),
        ),
        SizedBox(height: 10),

        //Horizontal listview of coffee types
        Container(
          height: 37,
          
          child: ListView.builder( 
            scrollDirection: Axis.horizontal,
            itemCount: coffeeType.length , 
            itemBuilder: (context, index) {
            return CoffeeType(
              coffeeType: coffeeType[index][0], 
              isSelected: coffeeType[index][1], 
              onTap:(){
                coffeeTypeSelected(index);
              },
            );
          })
        ),
       
        //Horizontal listview of coffee tiles
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePath: 'lib/images/latte.jpg',
                coffeeName: 'Latte',
                coffeePrice: '4.00',
              ),
              CoffeeTile(
                coffeeImagePath: 'lib/images/capucino.jpg',
                coffeeName: 'Cappucino',
                coffeePrice: '12.00',
              ),
              CoffeeTile(
                coffeeImagePath: 'lib/images/coffee.jpg',
                coffeeName: 'Black',
                coffeePrice: '9.00',
              ),]
          ),
          ),
        ]),
    );
  }
}