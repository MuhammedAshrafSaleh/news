import 'package:flutter/material.dart';
import 'package:news_app/theme/mytheme.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  String? name;
  TabItem({super.key, required this.name, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          color: isSelected ? MyTheme.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: MyTheme.primaryColor,
            width: 2,
          )),
      child: Text(
        name ?? '',
        style:
            TextStyle(color: isSelected ? Colors.white : MyTheme.primaryColor),
      ),
    );
  }
}
