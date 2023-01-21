import 'package:flutter/material.dart';
import 'package:handicraft_product/const/app_const.dart';

import '../data/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key, required this.e});
  CategoryModel e;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          e.productname,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              Image.network(
                e.productImage,
                height: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(e.productDetail),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(screenWidth, 45),
                      backgroundColor: Appcontant.primaryColor),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(milliseconds: 800),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        content: Text('Product is added')));
                  },
                  child: const Text("Add to Cart"))
            ],
          ),
        ),
      ),
    );
  }
}
