import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/blocs/basket/basket_bloc.dart';
import 'package:kamelfoodapp/models/voucher_model.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key}) : super(key: key);

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
            'Voucher',
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
                child: Text(
                  "Apply",
                ),
              )
            ],
          )),
        ),
        //*
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Enter a voucher code",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).primaryColor)),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Voucher code',
                                contentPadding: const EdgeInsets.all(10))))
                  ],
                ),
              ),
              Text("Your vouchers",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Theme.of(context).primaryColor)),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: Voucher.vouchers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      //*
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1x',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor)),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Text(Voucher.vouchers[index].code,
                                  style:
                                      Theme.of(context).textTheme.headline5)),
                          BlocBuilder<BasketBloc, BasketState>(
                            builder: (context, state) {
                              return TextButton(
                                  onPressed: () {
                                    context.read<BasketBloc>().add(
                                        AddVoucher(Voucher.vouchers[index]));
                                    Navigator.pop(context);
                                  },
                                  child: Text('Apply',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: Colors.blue)));
                            },
                          ),
                        ],
                      ),
                      //
                    );
                  })
            ],
          ),
        ));
  }
}
