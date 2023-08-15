import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';

import '../models/food.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  bool isFavorite = false;

  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      quantityCount--;
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: Container(
          margin: const EdgeInsets.only(left: 15),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
            ), // Ikon panah kembali
            onPressed: () {
              Navigator.of(context).pop(); // Kembali ke layar sebelumnya
            },
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 22),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: const Icon(
                  Icons.favorite_border,
                  size: 35,
                )),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 25,
                    left: 25,
                  ),
                  child: Stack(
                    children: [
                      Transform.rotate(
                        angle: -0.17,
                        child: const Opacity(
                          opacity: 0.125,
                          child: Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              'プレミアム',
                              style: TextStyle(
                                  fontSize: 45, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        widget.food.imagePath,
                        height: 255,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Text(
                          "美\n味\nし\nい", // Teks bahasa Jepang (sushi)
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 58,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        margin: const EdgeInsets.only(top: 235),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 255, 217, 0),
                                  size: 25,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  widget.food.rating,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Text(
                              widget.food.name,
                              style: GoogleFonts.dmSerifDisplay(fontSize: 35),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'Ingredients',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.food.ingredients.length,
                      itemBuilder: (BuildContext context, int index) {
                        var ingredient = widget.food.ingredients[index];
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                30,
                              ),
                              color: const Color.fromARGB(255, 230, 230, 230)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ingredient['imagePath']!,
                                height: 35,
                                width: 35,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                ingredient['name']!,
                                style: const TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'Descriptions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25, top: 15),
                  child: const Text(
                    'Indulge in the artistry of authentic sushi, where fresh ingredients become exquisite masterpieces that redefine your culinary experience. Elevate your palate to new heights with our original sushi collection.',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w200),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 180,
            color: const Color(0xFFB1454A),
            // decoration: BoxDecoration(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        widget.food.price,
                        style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 197, 112, 116),
                              shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: decrementQuantity,
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          quantityCount.toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 25),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 197, 112, 116),
                              shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  height: 60,
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  child: ButtonBuy(
                    text: 'Buy Now!',
                    onTap: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
