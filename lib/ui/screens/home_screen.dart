import 'package:chary/ui/components/headers.dart';
import 'package:chary/ui/components/interactables.dart';
import 'package:flutter/material.dart' hide Text;
import 'package:flutter/widgets.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' hide Text;

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
          headerButtons: [
            HeaderButton(
              active: true,
              title: "Threads",
              description: "1 unread",
              icon: MultiBubbleSolid(),
              onPressed: () {}
            ),
            HeaderButton(
              active: false,
              title: "Saved",
              description: "0 saved",
              icon: Bookmark(),
              onPressed: () {}
            ),
            HeaderButton(
              active: false,
              title: "Scheduled",
              description: "0 scheduled",
              icon: Alarm(),
              onPressed: () {}
            )
          ],
        )
      ],
    );
  }

}