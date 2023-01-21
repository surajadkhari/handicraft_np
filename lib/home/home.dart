import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handicraft_product/const/app_const.dart';
import 'package:handicraft_product/home/presentation/product_detail_screen.dart';

import 'data/product_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            // onTap: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const CartPage(),
            //   ),
            // ),
            child: Container(
              margin: const EdgeInsets.only(right: 8, top: 2),
              child: Stack(
                children: [
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const CartPage(),
                      //   ),
                      // );
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 28,
                    ),
                  ),
                  // if (_cartList.isNotEmpty)
                  const Positioned(
                    right: 8,
                    bottom: 35,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.white,
                      child: Text(
                        '0',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        elevation: 0,
        title: const Text("Nepal Handicraft"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...CategoryModel.productList.map((e) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) =>
                                      ProductDetailScreen(e: e)));
                        },
                        child: Container(
                            width: 200,
                            height: screenHeight * 0.34,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                color: Appcontant.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                  // color: Colors.white,
                                  ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    e.productname,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.02,
                                  ),
                                  Image.network(
                                    e.productImage,
                                    height: 100,
                                  ),
                                  Text(
                                    e.price.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
