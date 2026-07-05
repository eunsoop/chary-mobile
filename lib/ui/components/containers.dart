import 'package:chary/ui/components/theme.dart';
import 'package:flutter/widgets.dart';



class ContentListView<T> extends StatefulWidget {
  final List<T> Function() contentLoader;
  final NullableIndexedWidgetBuilder itemBuilder;


  const ContentListView({super.key, required this.contentLoader, required this.itemBuilder});

  @override
  State<ContentListView> createState() => _ContentListViewState<T>();
}

class _ContentListViewState<T> extends State<ContentListView> {
  final List<T> items = List.empty();
  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        load();
      }
    });
  }

  Future load() async {
    List<dynamic> toAdd = widget.contentLoader();

    setState(() {
      items.addAll(toAdd as Iterable<T>);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(48),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryContainer,
            borderRadius: BorderRadius.circular(48),
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryContainerBorder
            )
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 5
            ),
            itemBuilder: widget.itemBuilder,
          ),
        ),
      )
    );
  }
}