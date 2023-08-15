import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/components/foodtile.dart';
import 'package:sushi_app/models/food.dart';

import 'food_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List foodMenu = [
    Food(
      name: 'Original Sushi',
      price: 'S\$3.80',
      imagePath: 'lib/images/original_sushi.png',
      rating: '4.9',
      ingredients: [
        {'name': 'Rice', 'imagePath': 'lib/images/rice.png'},
        {'name': 'Tuna', 'imagePath': 'lib/images/tuna.png'},
        {'name': 'Sauce', 'imagePath': 'lib/images/sauce.png'},
      ],
    ),
    Food(
      name: 'Shrimp Sushi',
      price: 'S\$4.00',
      imagePath: 'lib/images/shrimp_sushi.png',
      rating: '4.7',
      ingredients: [
        {'name': 'Rice', 'imagePath': 'lib/images/rice.png'},
        {'name': 'Shrimp', 'imagePath': 'lib/images/shrimp.png'},
        {'name': 'Sauce', 'imagePath': 'lib/images/sauce.png'},
      ],
    ),
  ];

  void navigateToFoodDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetails(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 8.0),
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 23),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const Icon(
              Icons.menu,
              size: 30,
              color: Colors.black,
            ),
            title: const Wrap(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 28,
                  color: Color(0xFFB1454A),
                ),
                SizedBox(width: 3),
                Spacer(),
                Text(
                  "Singapore",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: const Color(0xFFB1454A), width: 1.75)),
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('lib/images/avatar.png'),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
                color: const Color(0xFFB1454A),
                borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get 32% Promo!',
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: ButtonPromo(text: 'Take It ', onTap: () {}),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -50,
                  bottom: -37,
                  child: Center(
                    child: Image.asset(
                      'lib/images/shrimp.png',
                      width: 220,
                      height: 220,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 65,
            padding: const EdgeInsets.only(top: 2),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search here..',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 155,
                    height: 45,
                    padding: const EdgeInsets.all(0),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'lib/images/tofu_sushi.png',
                              height: 55,
                              width: 35,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Sushi',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFB1454A)),
                            )
                          ]),
                    ),
                  ),
                  Container(
                    width: 155,
                    height: 45,
                    padding: const EdgeInsets.all(0),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'lib/images/ramen.png',
                              height: 55,
                              width: 31,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'Ramen',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w300),
                            )
                          ]),
                    ),
                  ),
                  Container(
                    width: 155,
                    height: 45,
                    padding: const EdgeInsets.all(0),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'lib/images/dango.png',
                            height: 55,
                            width: 31,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Dango',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
                food: foodMenu[index],
                onTap: () => navigateToFoodDetails(index),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Popular Food',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Image.asset(
                  'lib/images/salmon_eggs.png',
                  height: 105,
                  width: 105,
                ),
                Column(
                  children: [
                    Text(
                      'Salmon Eggs',
                      style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Text(
                          'S\$ 5.45',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 203, 59),
                        ),
                        Text(
                          '5.0',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  width: 120,
                ),
                const Icon(Icons.favorite)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
