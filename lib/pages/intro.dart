import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/pages/home.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB1454A),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 45),
            Text(
              "寿司 SUSHI",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 45,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: 145,
                  top: 5,
                  bottom: 0,
                  child: Transform.rotate(
                    angle: 0,
                    child: Text(
                      "日本の味!",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.15),
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontFamily: GoogleFonts.dmSerifDisplay().fontFamily),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 20,
                  bottom: 20,
                  child: RotatedBox(
                    quarterTurns: 0, // Mengatur rotasi teks secara vertikal
                    child: Text(
                      "特\n製\n寿\n司", // Teks bahasa Jepang (sushi)
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 65, top: 25),
                  padding: const EdgeInsets.only(bottom: 85),
                  child: Center(
                    child: Transform.scale(
                      scale: 2.3,
                      child: Image.asset(
                        'lib/images/sushi.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "THE TASTE OF JAPANESE FOOD",
              style:
                  GoogleFonts.dmSerifDisplay(color: Colors.white, fontSize: 50),
            ),
            const SizedBox(height: 13),
            Text(
              "Feel the taste of most popular Japanese foods from anywhere and anytime",
              style: GoogleFonts.dmSans(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 45,
            ),
            Button(
              text: "Get Started ",
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Home()));
              },
            )
          ],
        ),
      ),
    );
  }
}
