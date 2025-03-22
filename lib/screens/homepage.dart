import 'package:defrappy/screens/emoti_screen.dart';
import 'package:defrappy/screens/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/tab_button.dart';
import 'profile_screen.dart';

class TileEntity {
  final String title;
  final IconData icon;

  const TileEntity({required this.title, required this.icon});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TileEntity> tiles = [
    const TileEntity(title: "Compart", icon: Icons.share),
    const TileEntity(title: "Crisis Queue", icon: Icons.emergency),
    const TileEntity(title: "EmotiDebt", icon: Icons.psychology),
    const TileEntity(title: "Guilt Eraser", icon: Icons.cleaning_services),
    const TileEntity(title: "Library", icon: Icons.library_books),
    const TileEntity(title: "NopePad", icon: Icons.note_alt),
    const TileEntity(
      title: "Self-care Automations",
      icon: Icons.self_improvement,
    ),
    const TileEntity(title: "Toxic Immunity", icon: Icons.shield),
    const TileEntity(title: "Trauma Rewind", icon: Icons.psychology_alt),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Deferrapy",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.deepPurple, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TabButton(
                    isActive: false,
                    label: "Favorited",
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavoriteScreen(),
                          ),
                        ),
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
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
              ),
              itemCount: tiles.length,
              itemBuilder: (context, index) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.6,
                          height: constraints.maxWidth * 0.6,
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
                                tiles[index].title == "EmotiDebt"
                                    ? Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: SvgPicture.asset(
                                        'assets/emoti-icon.svg',
                                        width: constraints.maxWidth * 0.25,
                                        height: constraints.maxWidth * 0.25,
                                      ),
                                    )
                                    : Icon(
                                      tiles[index].icon,
                                      size: constraints.maxWidth * 0.25,
                                      color: Colors.black87,
                                    ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: Text(
                                tiles[index].title,
                                style: Theme.of(
                                  context,
                                ).textTheme.titleMedium!.copyWith(fontSize: 12),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          // Text Section below Grid
        ],
      ),
    );
  }
}
