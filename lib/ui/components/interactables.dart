import 'package:chary/ui/components/theme.dart';
import 'package:flutter/widgets.dart';

class HeaderButton extends StatelessWidget {

  final bool active;

  final String title;
  final String description;

  final Widget icon;
  final VoidCallback onPressed;

  const HeaderButton({super.key, required this.active, required this.title, required this.description, required this.icon, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsetsGeometry.symmetric(
            vertical: 15,
            horizontal: 15
          ),
          decoration: BoxDecoration(
            color: active ? Theme.of(context).primaryContainer : Theme.of(context).secondaryContainer,
            border: BoxBorder.all(
              color: Color.fromARGB(active ? 255 : 102, 255, 255, 255)
            ),
            borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: icon,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: Theme.of(context).sectionTitle,
              ),
              Text(
                description,
                style: Theme.of(context).descriptive,
              )
            ],
          ),
        ),
      )
    );
  }
  
}