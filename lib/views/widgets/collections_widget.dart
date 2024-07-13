import 'package:easy_shopper/views/widgets/product_widget.dart';
import 'package:flutter/material.dart';

class CollectionsWidget extends StatelessWidget {
  const CollectionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> collectionImagePaths = [
      '/assets/category_dress_shoe.jpg',
      '/assets/category_loafers.jpg',
      '/assets/category_loafer.jpg',
      '/assets/category_sneaker.jpg',
    ];
    List<String> collectionNames = [
      'Dress Shoes',
      'Loafers',
      'Slides and Sandals',
      'Sneakers'
    ];
    return GridView.builder(
        itemCount: collectionImagePaths.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 160,
                height: 176,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    collectionImagePaths[index],
                  ),
                )),
              ),
              Text(collectionNames[index])
            ],
          );
        });
  }
}
