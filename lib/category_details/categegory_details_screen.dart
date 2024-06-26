import 'package:flutter/material.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/category_details/tab_widget.dart';
import 'package:news_app/models/source_model.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({super.key});
  static const String routeName = "Category-Details-Screen";

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'News Apps',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: FutureBuilder<SourceResponse?>(
        future: ApiManager.getResources(),
        builder: (context, snapshot) {
          // Case 1: Loading Status
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber),
            );
          }
          // Case 2: From my code error Or user error (Network error)
          else if (snapshot.hasError) {
            return Column(
              children: [
                const Text('Something Went Wrong!'),
                ElevatedButton(
                    onPressed: () {
                     setState(() {
                        ApiManager.getResources();
                     });
                    },
                    child: const Text('Try Again!'))
              ],
            );
          } else {
            if (snapshot.data?.status! != 'ok') {
              // Case 3: Server Error Status
              return Column(children: [
                Text(snapshot.data?.message ??
                    "Server Error, Please try later."),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ApiManager.getResources();
                     });
                    }, child: const Text('Try Again!'))
              ]);
            } else {
              // Case 4: Server Success Status
              var sources = snapshot.data?.sources ?? [];
              return TabWidget(sources: sources);
              // return ListView.builder(
              //   itemCount: sources.length,
              //   itemBuilder: (context, index) {
              //     return Text(sources[index].name!);
              //   },
              // );
            }
          }
        },
      ),
    );
  }
}
