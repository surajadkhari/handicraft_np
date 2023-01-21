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
              child: Column(
                children: [
                  const CaytegoryCard(),
                  Row(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenW * 0.03),
              child: const Text(
                'Top-ranking',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenH * 0.019,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...CategoryModel.productList.map(
                (e) => CustomCard(
                  image: e.productImage,
                  name: e.productname,
                  screenH: screenH,
                  screenW: screenW,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CaytegoryCard extends StatelessWidget {
  const CaytegoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height: screenH * 0.019,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(
              top: screenH * 0.02,
            ),
            child: Row(
              children: const [
                ScrollCard(
                  title: 'All categories',
                  color: Colors.red,
                  icon: Icons.grid_view_outlined,
                ),
                ScrollCard(
                  title: 'Post buying request',
                  color: Colors.blue,
                  icon: Icons.local_mall_outlined,
                ),
                ScrollCard(
                  title: 'Logistics services',
                  color: Colors.purple,
                  icon: Icons.sailing_outlined,
                ),
                ScrollCard(
                  title: 'Ready to ship',
                  color: Colors.orange,
                  icon: Icons.local_shipping_outlined,
                ),
                ScrollCard(
                  title: 'Worldwide\nselection',
                  color: Colors.green,
                  icon: Icons.travel_explore_outlined,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: screenH * 0.015,
        ),
      ],
    );
  }
}

class ScrollCard extends StatelessWidget {
  const ScrollCard({
    Key? key,
    required this.title,
    required this.color,
    required this.icon,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  final String title;
  final Color color;
  final IconData icon;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenW * 0.005),
      // padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: screenW < 499 ? screenH * 0.08 : screenH * 0.2,
        width: screenW < 499 ? screenW * 0.39 : screenW * 0.25,
        margin: EdgeInsets.symmetric(horizontal: screenH * 0.01),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: screenW < 499
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenW * 0.2,
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      title,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      icon,
                      size: screenH * 0.055,
                      // size: 42,
                      color: Colors.white54,
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      icon,
                      size: screenH * 0.069,
                      // size: 42,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.screenH,
    required this.screenW,
    required this.image,
    required this.name,
  }) : super(key: key);
  final double screenH;
  final double screenW;

  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Row(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  // horizontal: 15,
                  horizontal: screenW * 0.01693,
                  vertical: screenH * 0.002,
                  //  horizontal: screenW * 0.01693,
                  // vertical: screenH * 0.002,
                ),
                child: Container(
                  height: screenW < 500 ? screenH * 0.23 : screenH * 0.35,
                  width: screenW < 500 ? screenW * 0.39 : screenH * 0.39,
                  // height: screenH * 0.35,
                  // width: screenW * 0.39,
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  // horizontal: 28,
                  horizontal: screenW < 500 ? screenW * 0.063 : screenH * 0.06,
                  vertical: screenW < 500 ? screenH * 0.027 : screenH * 0.035,
                  //  horizontal: screenW * 0.063,
                  // vertical: screenH * 0.035,
                ),
                height: screenW < 500 ? screenH * 0.15 : screenH * 0.25,
                width: screenW < 500 ? screenW * 0.30 : screenH * 0.30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenW * 0.159,
                  vertical: screenW < 500 ? screenH * 0.192 : screenH * 0.3,
                ),
                child: Center(
                  child: Text(
                    name,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
