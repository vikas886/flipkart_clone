import 'package:flipkart_clone/models/product.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  List<Product> categories = [];
  CategoryWidget(this.categories);
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Wrap(
      children: categories != null && categories.length > 0
          ? categories
              .map((category) => InkWell(
                    onTap: () {},
                    child: Container(
                      width: deviceSize.width / 3,
                      height: deviceSize.height / 8,
                      child: Image.network(
                        category.imagePath,
                      ),
                    ),
                  ))
              .toList()
          : [],
    );
  }
}
