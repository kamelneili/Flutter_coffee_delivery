import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/blocs/basket/basket_bloc.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange[50],
//Theme.of(context).backgroundColor,
        appBar: AppBar(
          //backgroundColor: Theme.of(context).primaryColor,
          //elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'My Cart',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.orange),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit_basket');
                },
                icon: Icon(Icons.edit, color: Colors.orange))
          ],
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
                onPressed: () {},
                child: Text("Go to checkout"),
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
              Text('Cutlery',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor)),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: Colors.white),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('Do you need cutlery',
                          style: Theme.of(context).textTheme.headline6!),
                    ),
                    BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoading)
                          return Center(child: CircularProgressIndicator());
                        else if (state is BasketLoaded) {
                          return SizedBox(
                              width: 100,
                              child: SwitchListTile(
                                dense: false,
                                value: state.basket.cutlery,
                                onChanged: (bool? nawvalue) {
                                  context.read<BasketBloc>()
                                    ..add(ToggleSwitch());
                                },
                              ));
                        } else
                          return Text("something went wrong");
                      },
                    )
                  ],
                ),
              ),
              Text('Items',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
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
                                  style:
                                      Theme.of(context).textTheme.headline6!),
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
                                            .headline5!),
                                  ),
                                  Text(
                                      '\$${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).price}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!)
                                ],
                              ),
                            );
                          });
                } else
                  return Text("something went wrong");
              }),
              //*
              Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/delivery.jpg'),
                    ),
                    BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoaded) {
                          return (state.basket.deliveryTime == null)
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Delivery in 20 minutes',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/delivery_time');
                                        },
                                        child: Text('Change',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(color: Colors.blue)))
                                  ],
                                )
                              : Text(
                                  'Delivery at ${state.basket.deliveryTime!.value}',
                                  style:
                                      Theme.of(context).textTheme.headline4!);
                        } else
                          return Text('something went wrong');
                      },
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoaded) {
                          return (state.basket.voucher == null)
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(' Do you have a voucher',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5!),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/voucher');
                                        },
                                        child: Text('Apply',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .copyWith(color: Colors.blue)))
                                  ],
                                )
                              : Text("Your voucher is aded",
                                  style:
                                      Theme.of(context).textTheme.headline6!);
                        } else
                          return Text("something went wrong");
                      },
                    ),
                    Image(
                      image: AssetImage('assets/voucher.jpg'),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 80,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(color: Colors.white),
                child: BlocBuilder<BasketBloc, BasketState>(
                    builder: (context, state) {
                  if (state is BasketLoading)
                    return Center(child: CircularProgressIndicator());
                  else if (state is BasketLoaded) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SubTotal',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                            Text('\$${state.basket.subtotalString}',
                                style: Theme.of(context).textTheme.headline4!)
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivery fee',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor)),
                            Text('\$5.00',
                                style: Theme.of(context).textTheme.headline4!)
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor)),
                            Text('\$${state.basket.totalString}',
                                style: Theme.of(context).textTheme.headline4!)
                          ],
                        ),
                      ],
                    );
                  } else
                    return Text("something went wrong");
                }),
              )
            ],
          ),
        ));
  }
}
