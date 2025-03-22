import 'package:defrappy/screens/emoti_screen.dart';
import 'package:defrappy/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/tab_button.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deferrapy"),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),

      body: Column(
        children: [
          // Tab-like buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.deepPurple, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(
                    isActive: true,
                    label: "Favorited",
                    onPressed: () {},
                  ),
                  TabButton(
                    isActive: false,
                    label: "Tools",
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ToolsScreen(),
                          ),
                        ),
                  ),
                  TabButton(
                    isActive: false,
                    label: "Profile",
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ToolsScreen()),
                      ),
                  child: CustomCard(
                    titile: "EmotiDebt",
                    hours: 23,
                    usageCount: 834,
                    icon: Icons.psychology,
                  ),
                ),
                CustomCard(
                  titile: "How to Trick Clients into Inner Peace",
                  hours: 10.0,
                  usageCount: 234,
                  icon: Icons.book,
                ),

                CustomCard(
                  titile: "Reframing or Gaslighting? A Therapist's Guide",
                  hours: 14.0,
                  usageCount: 554,
                  icon: Icons.psychology_alt_outlined,
                ),
              ],
            ),
          ),
          // Text Section below Grid
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.titile,
    required this.hours,
    required this.usageCount,
    required this.icon,
  });

  final String titile;
  final double hours;
  final int usageCount;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        width: constraints.maxWidth * 0.4,
                        height: constraints.maxWidth * 0.4,
                        margin: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey[400]!,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child:
                              titile == "EmotiDebt"
                                  ? Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: SvgPicture.asset(
                                      'assets/emoti-icon.svg',
                                      width: constraints.maxWidth * 0.25,
                                      height: constraints.maxWidth * 0.25,
                                    ),
                                  )
                                  : Icon(
                                    icon,
                                    size: constraints.maxWidth * 0.25,
                                    color: Colors.black87,
                                  ),
                        ),
                      );
                    },
                  ),
                  Text(
                    titile,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  text: "Used ",
                  children: [
                    TextSpan(
                      text: "$usageCount",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: "\ntimes"),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  text: "Used ",
                  children: [
                    TextSpan(
                      text: "${hours.toInt()}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: "\nhours ago"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
