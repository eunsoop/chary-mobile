import 'package:animations/animations.dart';
import 'package:chary/ui/components/theme.dart' as theme;
import 'package:chary/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CharyApp());
}

class CharyApp extends StatelessWidget {
  const CharyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Colors.white,

      builder: (context, child) => theme.Theme(
        data: theme.ThemeData.light(),
        child: child!,
      ),
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, animation2) => ColoredBox(
            color: theme.Theme.of(context).background,
            child: SafeArea(
              left: false,
              right: false,
              child: const HomeScreen()
            ),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
        );
      },
    );
  }
}
