import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/blocs/basket/basket_bloc.dart';
import 'package:kamelfoodapp/models/category_model.dart';
import 'package:kamelfoodapp/models/promo_model.dart';
import 'package:kamelfoodapp/models/restaurant_model.dart';
import 'package:kamelfoodapp/screens/widgets/category_box.dart';
import 'package:kamelfoodapp/screens/widgets/custom_navbar.dart';
import 'package:kamelfoodapp/screens/widgets/food_search_box.dart';
import 'package:kamelfoodapp/screens/widgets/promo_box.dart';
import 'package:kamelfoodapp/screens/widgets/restaurant_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[50],
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
          child: Column(
        //   mainAxisSize: MainAxisSize.min,
        children: [
          FoodSearchBox(),
          Column(
            children: [
              Container(
                height: 130,
                width: 160,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.grey),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 125,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Promo.promos.length,
                  itemBuilder: (context, index) {
                    return PromoBox(promo: Promo.promos[index]);
                  },
                )),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Top Rated',
                  style: Theme.of(context).textTheme.headline4,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: Category.categories.length,
                itemBuilder: (context, index) {
                  return CategoryBox(category: Category.categories[index]);
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.orange),
        onPressed: () {},
      ),
      title: Center(
        child: Text(
          'SERBINI',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.orange),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/wishlist');
              // Navigator.of(context).pushNamed(
              //   '/product',
              //   arguments: product,
              // );
            },
            icon: Icon(Icons.favorite, color: Colors.orange)),
        Stack(
          children: [
            Positioned(
              top: 2.0,
              right: 15,
              child: Container(
                child: Center(
                  child: BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                    if (state is BasketLoading)
                      return Center(child: CircularProgressIndicator());
                    else if (state is BasketLoaded) {
                      return state.basket.items.length == 0
                          ? Text(
                              "0",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            )
                          : Text(
                              state.basket.items.length.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.white),
                            );
                    }
                    return Text("something went wrong");
                  }),
                  //*
                ),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                width: 18,
                height: 14,
              ),
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.orange),
              onPressed: () {},
            ),
          ],
        ),
      ],
      //

      //
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
