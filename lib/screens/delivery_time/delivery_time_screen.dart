import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/blocs/basket/basket_bloc.dart';
import 'package:kamelfoodapp/models/delivery_time_model.dart';

class DeliveryTimeScreen extends StatelessWidget {
  const DeliveryTimeScreen({Key? key}) : super(key: key);

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
            'Delivery Time',
            style: Theme.of(context)
                .textTheme
                .headline3!
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
                  child: Text('Select'),
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Choose a Date',
                  style: Theme.of(context).textTheme.headline5!),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Today',
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Tomorrow'),
                  ),
                ]),
              ),
              Text('Choose the time',
                  style: Theme.of(context).textTheme.headline5!),
              /*************** */
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 2.5),
                      itemCount: DeliveryTime.deliveryTimes.length,
                      itemBuilder: (context, index) {
                        return BlocBuilder<BasketBloc, BasketState>(
                          builder: (context, state) {
                            return Card(
                                child: TextButton(
                                    onPressed: () {
                                      context.read<BasketBloc>().add(
                                          SelectDeliveryTime(DeliveryTime
                                              .deliveryTimes[index]));
                                    },
                                    child: Text(
                                        '${DeliveryTime.deliveryTimes[index].value}')));
                          },
                        );
                      }),
                ),
              )

              /******************* */
            ],
          ),
        ));
  }
}
