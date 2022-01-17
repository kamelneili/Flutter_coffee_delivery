import 'package:flutter/material.dart';
import 'package:kamelfoodapp/models/restaurant_model.dart';
import 'package:kamelfoodapp/screens/widgets/restaurant_tags.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/details_restaurant',
                arguments: restaurant);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                  width: 124,
                  height: 124,
                  child: Image.network(
                    //image_location,
                    // "assets/images/p1.jpg",
                    restaurant.imageUrl,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                width: 18,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      restaurant.name,
                      style: Theme.of(context).textTheme.headline4!,
                    )),
                    // Text(widget.category.id),
                    InkWell(

                        // backgroundColor:Colors.white,
                        // heroTag: Text("btn1"),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30, // 30 px padding
                            vertical: 5, // 5 px padding
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'see more...',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              Icon(Icons.arrow_right),
                            ],
                          ),
                        ),

                        // color: Colors.red,

                        onTap: () {}
                        // color: Colors.red,
                        )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
