import 'package:chary/ui/components/interactables.dart';
import 'package:chary/ui/components/users.dart';
import 'package:flutter/widgets.dart';

class DefaultHeader extends StatelessWidget {
  final Widget title;
  final List<HeaderButton> headerButtons;
  const DefaultHeader({super.key, required this.title, required this.headerButtons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        spacing: 20,
        children: [
          CompactHeader(title: title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children: headerButtons,
          )
        ],
      ),
    );
  }

}

class CompactHeader extends StatelessWidget {
  final Widget title;

  const CompactHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        title,
        UserStatusWidget()
      ],
    );
  }

}