import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/blocs/basket/basket_bloc.dart';
import 'package:kamelfoodapp/blocs/wishlist/wishlist_bloc.dart';
import 'package:kamelfoodapp/blocs/wishlist/wishlist_event.dart';
import 'package:kamelfoodapp/blocs/wishlist/wishlist_state.dart';
import 'package:kamelfoodapp/models/menu_item_model.dart';
import 'package:kamelfoodapp/models/restaurant_model.dart';
import 'package:kamelfoodapp/screens/widgets/restaurant_information.dart';

class RestaurantDetails extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantDetails({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Restaurant restaurant = Restaurant.restaurants[0];
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/wishlist');
                  // Navigator.of(context).pushNamed(
                  //   '/product',
                  //   arguments: product,
                  // );
                },
                icon: Icon(Icons.favorite, color: Colors.orange))
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                return IconButton(
                  icon: Icon(Icons.favorite, color: Colors.orange),
                  onPressed: () {
                    context
                        .read<WishlistBloc>()
                        .add(AddWishlistProduct(restaurant));
                    final snackBar = SnackBar(
                        content: Text('Added to your Wishlist!',
                            style: TextStyle(color: Colors.pinkAccent)));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                );
              }),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange, //Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder()),
                onPressed: () {
                  Navigator.pushNamed(context, '/basket');
                },
                child: Text(
                  "Cart",
                  //style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          )),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 50),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    restaurant.imageUrl,
                  ),
                ),
              ),
            ),
            RestaurantInformation(restaurant: restaurant),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: restaurant.tags.length,
                itemBuilder: (context, index) {
                  return _buildMenuItems(restaurant, context, index);
                }),
          ],
        )));
  }

  Widget _buildMenuItems(
      Restaurant restaurant, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Text(restaurant.tags[index],
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Theme.of(context).primaryColor,
                  )),
        ),
        //** */
        Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map(
                (menuItem) => Column(
                  children: [
                    Container(
                      color: Colors.white,
                      //  padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        dense: true,
                        title: Text(menuItem.name,
                            style: Theme.of(context).textTheme.headline5!),
                        subtitle: Text(menuItem.description,
                            style: Theme.of(context).textTheme.bodyText1!),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('\$${menuItem.price}',
                                style: Theme.of(context).textTheme.headline3!),
                            BlocBuilder<BasketBloc, BasketState>(
                              builder: (context, state) {
                                return IconButton(
                                    onPressed: () {
                                      context.read<BasketBloc>()
                                        ..add(AddItem(menuItem));
                                      final snackBar = SnackBar(
                                          content: Text('Added to your Cart!',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3!
                                                  .copyWith(
                                                      color: Colors
                                                          .lightGreenAccent)));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    icon: Icon(Icons.add_circle),
                                    color: Colors.redAccent);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                    )
                  ],
                ),
              )
              .toList(),
        )
        //** */
      ],
    );
  }
}
