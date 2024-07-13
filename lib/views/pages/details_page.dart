import 'package:flutter/material.dart';

import 'package:easy_shopper/model/t_product.dart';

class ProductDetailsPage extends StatefulWidget {
  final List<Items> products;
  final int productIndex;

  const ProductDetailsPage({
    super.key,
    required this.products,
    required this.productIndex,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  double _scrollPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
    
          SliverAppBar(
            pinned: true, 
            expandedHeight: 250.0, 
            flexibleSpace: Stack(
              children: [
               
                Hero(
                  tag: widget.products[widget.productIndex].id, 
                  child: Image.network(
                     widget.products[widget.productIndex].imageUrl!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
               
                Opacity(
                  opacity: 1.0 -
                      (_scrollPosition /
                          100), 
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent.withOpacity(0.0),
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                ),
                // Appbar content with back button and cart icon
                AppBar(
                  backgroundColor: Colors.transparent, // Transparent background
                  elevation: 0.0, // Remove appbar shadow
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      color: Colors.white,
                      onPressed: () =>
                          print('Add to cart'), 
                    ),
                  ],
                ),
              
                Positioned(
                  bottom: 16.0, 
                  left: 16.0, 
                  child: Opacity(
                    opacity:
                        _scrollPosition / 100, 
                    child: Text(
                      widget.products[widget.productIndex].name!,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
         
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => 
                  Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text( widget.products[widget.productIndex].description!),
              ),
              childCount: 1, 
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _scrollPosition = Scrollable.of(context).position.pixels;
      });
    });
  }
}
