import 'package:chary/ui/components/theme.dart';
import 'package:flutter/widgets.dart';

typedef IconBuilder = Widget Function(BuildContext context, bool toggle);

class ToggleButton extends StatefulWidget {
  final bool initalState;

  final String title;
  final String description;

  final IconBuilder iconBuilder;
  final VoidCallback onPressed;

  const ToggleButton({super.key, this.initalState = false, required this.title, required this.description, required this.iconBuilder, required this.onPressed});

  @override
  State<StatefulWidget> createState() => _ToggleButton();

}

class _ToggleButton extends State<ToggleButton> {

  late bool current = widget.initalState;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            current = !current;
          });
          widget.onPressed();
        },
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: Container(
            color: current ? Theme.of(context).primaryContainer : Theme.of(context).secondaryContainer,
            padding: EdgeInsetsGeometry.symmetric(
              vertical: 15,
              horizontal: 15
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: widget.iconBuilder(context, current),
                ),
                SizedBox(height: 10),
                Text(
                  widget.title,
                  style: Theme.of(context).title,
                ),
                Text(
                  widget.description,
                  style: Theme.of(context).descriptive,
                )
              ],
            ),
          ),
        ),
      )
    );
  }
  
}