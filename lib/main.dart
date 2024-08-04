import 'package:flutter/material.dart';
import 'package:news_app/category_details/categegory_details_screen.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/upload_image/upload_image_screen.dart';

import 'theme/mytheme.dart';

// TODO:
// If you change any thing in the androidmainfest or theme file your rester your app hot restert
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: UploadImageScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        UploadImageScreen.routeName: (context) =>  UploadImageScreen(),
        CategoryDetailsScreen.routeName: (context) =>
            const CategoryDetailsScreen(),
      },
      theme: MyTheme.lightTheme,
    );
  }
}
