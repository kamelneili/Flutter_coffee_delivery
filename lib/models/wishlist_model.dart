import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kamelfoodapp/models/restaurant_model.dart';

class Wishlist extends Equatable {
  final List<Restaurant> products;

  const Wishlist({
    this.products = const <Restaurant>[],
  });
  @override
  List<Object?> get props => [
        products,
      ];
}
