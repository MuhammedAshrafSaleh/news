import 'package:flutter/material.dart';
import 'package:news_app/category_details/news_widget.dart';
import 'package:news_app/category_details/tab_item_widget.dart';

import '../models/source_model.dart';

// ignore: must_be_immutable
class TabWidget extends StatefulWidget {
  List<Source> sources;
  TabWidget({super.key, required this.sources});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              tabs: widget.sources
                  .map(
                    (e) => TabItem(
                      isSelected:
                          //   e.name == widget.sources[selectedIndex].name or
                          selectedIndex == widget.sources.indexOf(e)
                              ? true
                              : false,
                      name: e.name,
                    ),
                  )
                  .toList(),
            ),
            Expanded(child: NewsWidget(source: widget.sources[selectedIndex])),
          ],
        ));
  }
}
