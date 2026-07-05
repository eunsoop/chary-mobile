import 'package:chary/ui/components/headers.dart';
import 'package:chary/ui/components/interactables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconoir_flutter/regular/multi_bubble.dart';
import 'package:iconoir_flutter/solid/multi_bubble.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultHeader(title: 
          Row(
            spacing: 8,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: Image.network("https://avatars.githubusercontent.com/u/193854505?v=4"),
                ),
              ),
              Text("Chary Inc", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600))
            ]
          ), 
          toggleButtons: [
            ToggleButton(
              title: "Threads",
              description: "1 unread",
              iconBuilder: (context, isEnabled) => isEnabled ? MultiBubbleSolid() : MultiBubble(),
              onPressed: () {}
            ),
            ToggleButton(
              title: "Threads",
              description: "1 unread",
              iconBuilder: (context, isEnabled) => isEnabled ? MultiBubbleSolid() : MultiBubble(),
              onPressed: () {}
            )
          ],
        )
      ],
    );
  }

}