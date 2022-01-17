import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/blocs/basket/basket_bloc.dart';

class EditBasketScreen extends StatelessWidget {
  const EditBasketScreen({Key? key}) : super(key: key);

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
          title: Text(
            'Edit Cart',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.orange),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, //Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Done",
                ),
              )
            ],
          )),
        ),
        //*
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Items',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).primaryColor)),
              BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
                if (state is BasketLoading)
                  return Center(child: CircularProgressIndicator());
                else if (state is BasketLoaded) {
                  return state.basket.items.length == 0
                      ? Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Text("No items in the basket!!",
                                  style: Theme.of(context).textTheme.headline5),
                            ],
                          ))
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.basket
                              .itemQuantity(state.basket.items)
                              .keys
                              .length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(color: Colors.white),
                              margin: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Text(
                                      '${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}X',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                        '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5),
                                  ),
                                  IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(RemoveAllItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                        final snackBar = SnackBar(
                                            content: Text(
                                                'Dropped from your Cart!',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3!
                                                    .copyWith(
                                                        color:
                                                            Colors.redAccent)));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      icon: Icon(Icons.delete,
                                          color: Colors.yellow)),
                                  IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(RemoveItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                        final snackBar = SnackBar(
                                            content: Text(
                                                'Removed from your Cart!',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3!
                                                    .copyWith(
                                                        color:
                                                            Colors.redAccent)));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      icon: Icon(Icons.remove_circle,
                                          color: Colors.red)),
                                  IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(AddItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
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
                                      icon: Icon(Icons.add_circle,
                                          color: Colors.green))
                                ],
                              ),
                            );
                          });
                } else
                  return Text("something went wrong");
              }),
              //*
            ],
          ),
        ));
  }
}
