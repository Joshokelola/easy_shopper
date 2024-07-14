import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/t_product.dart';

enum ProductDetailsState { Initial, AddedToCart }

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
  ProductDetailsState _state = ProductDetailsState.Initial;

  @override
  Widget build(BuildContext context) {
    final product = widget.products[widget.productIndex];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: _buildContent(product),
      bottomNavigationBar: _buildBottomBar(product),
    );
  }

  Widget _buildContent(Items product) {
    switch (_state) {
      case ProductDetailsState.Initial:
        return Container(
         // margin: const EdgeInsets.only(left: 40,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 430,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                            'https://api.timbu.cloud/images/${widget.products[widget.productIndex].imageUrl}'))),
              ),
              const SizedBox(
                height: 63,
              ),
              Container(
                margin: const EdgeInsets.only(left: 40,right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.products[widget.productIndex].uniqueId!,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff6E6E6E),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    ),
                    const Text(
                      'In Stock',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff408C2B),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                   margin: const EdgeInsets.only(left: 40,right: 40),
                child: Text(
                  widget.products[widget.productIndex].name!,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Color(0xff0A0B0A),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins'),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                   margin: const EdgeInsets.only(left: 40,right: 40),
                child: Text(
                  widget.products[widget.productIndex].description!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff5A5A5A),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        );
      case ProductDetailsState.AddedToCart:
        return const Center(
          child: Text(
            'Added to Cart!',
            style: TextStyle(fontSize: 20),
          ),
        );
    }
  }

  Widget _buildBottomBar(Items product) {
    return Container(
      height: 80,
      
      //width: double.maxFinite,
      padding: const EdgeInsets.only(left: 40, right: 40),
      color: const Color(0xff408C2B),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            NumberFormat.currency(locale: 'en_NG', symbol: '₦')
                .format(double.parse(product.currentPrice!)),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          InkWell(
            onTap: () {
              setState(() {
                _state = ProductDetailsState.AddedToCart;
              });
            },
            child: Container(
              width: 66,
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.366),
                border: Border.all(
                  color: const Color(0xffFFFFFF),
                ),
              ),
              child: const Center(
                child: Text(
                  'Add to cart',
                  style: TextStyle(fontSize: 10, fontFamily: 'Poppins'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
