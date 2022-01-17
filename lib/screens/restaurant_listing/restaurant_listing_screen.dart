import 'package:flutter/material.dart';
import 'package:kamelfoodapp/models/restaurant_model.dart';
import 'package:kamelfoodapp/screens/widgets/restaurant_card.dart';

class RestaurantListingScreen extends StatelessWidget {
  final List<Restaurant> restaurants;
  const RestaurantListingScreen({
    Key? key,
    required this.restaurants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[50],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          // leading: IconButton(
          //icon: Icon(Icons.back, color: Colors.orange),
          //  onPressed: () {},
          //  ),
        ),
        body: ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            return SizedBox(
                height: 210,
                child: RestaurantCard(restaurant: restaurants[index]));
          },
        ));
  }
}

//
