import 'package:flutter/material.dart';
import 'package:flutterapp/helper/data.dart';
import 'package:flutterapp/models/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      categoryName: categories[index].categoryName,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            width: 120,
            height: 60,
          ),
        ],
      ),
    );
  }
}
