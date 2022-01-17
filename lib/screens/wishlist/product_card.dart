import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/models/restaurant_model.dart';

class ProductCard extends StatelessWidget {
  final Restaurant product;
  final double withFactor;
  final double leftPosition;
  final bool isWishlist;
  ProductCard(
      {this.leftPosition = 5,
      this.withFactor = 2.5,
      required this.product,
      this.isWishlist = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
        // Navigator.of(context).pushNamed(
        //   '/product',
        //   arguments: product,
        // );
      },
      child: Stack(
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width / 2.5,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 60,
              left: leftPosition,
              child: Container(
                height: 80,
                width:
                    MediaQuery.of(context).size.width / 2.5 - 10 - leftPosition,
                decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
              )),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
                height: 70,
                width:
                    MediaQuery.of(context).size.width / 2.5 - 20 - leftPosition,
                decoration: BoxDecoration(color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${product.priceCategory}',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      isWishlist
                          ? Expanded(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete, color: Colors.red)),
                            )
                          : SizedBox(),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
