import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String image;
  Category({
    required this.id,
    required this.name,
    required this.image,
  });
  @override
  List<Object?> get props => [id, name, image];
  static List<Category> categories = [
    Category(
      id: 1,
      name: 'Pizza',
      image: 'assets/pizza.png',
    ),
    Category(
      id: 2,
      name: 'Burger',
      image: 'assets/burger.png',
    ),
    Category(
      id: 3,
      name: 'Coffee',
      image: 'assets/coffee1.jpg',
    ),
    Category(
      id: 4,
      name: 'Desser',
      image: 'assets/desser.png',
    ),
    Category(
      id: 5,
      name: 'Drink',
      image: 'assets/drink.png',
    ),
  ];
}
