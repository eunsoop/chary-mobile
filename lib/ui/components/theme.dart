import 'package:flutter/widgets.dart';

class ThemeData {
  final Color background;

  final Color primaryContainer;
  final Color secondaryContainer;

  final TextStyle title;
  final TextStyle sectionTitle;
  final TextStyle body;
  final TextStyle descriptive;

  const ThemeData({
    required this.background,

    required this.primaryContainer,
    required this.secondaryContainer,

    required this.title,
    required this.sectionTitle,
    required this.body,
    required this.descriptive
  });

  factory ThemeData.light() => const ThemeData(
      background: Color(0xFFF0F0F0),

      primaryContainer: Color(0x99FFFFFF),
      secondaryContainer: Color(0x33FFFFFF),

      title: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF000000)),
      sectionTitle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF333333)),
      body: TextStyle(fontSize: 14, color: Color(0xFF333333)),
      descriptive: TextStyle(fontSize: 12, color: Color(0xFF777777)),
    );
}

class Theme extends InheritedWidget {
  final ThemeData data;

  const Theme({
    super.key,
    required this.data,
    required super.child,
  });

  static ThemeData of(BuildContext context) {
    final Theme? result = context.dependOnInheritedWidgetOfExactType<Theme>();
    assert(result != null, 'No AppTheme found in context');
    return result!.data;
  }

  @override
  bool updateShouldNotify(Theme oldWidget) => data != oldWidget.data;
}