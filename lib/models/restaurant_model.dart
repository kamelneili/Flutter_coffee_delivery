import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kamelfoodapp/models/menu_item_model.dart';

class Restaurant extends Equatable {
  final int id;
  final String name;
  final String priceCategory;
  final String imageUrl;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;
  Restaurant(
      {required this.id,
      required this.name,
      required this.menuItems,
      required this.imageUrl,
      required this.tags,
      required this.deliveryTime,
      required this.priceCategory,
      required this.deliveryFee,
      required this.distance});
  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        tags,
        deliveryFee,
        deliveryTime,
        priceCategory,
        distance,
        menuItems
      ];
  static List<Restaurant> restaurants = [
    Restaurant(
        id: 1,
        name: ' Coffee',
        imageUrl:
            'https://media.istockphoto.com/photos/mug-on-plate-filled-with-coffee-surrounded-by-coffee-beans-picture-id157528129?s=612x612',
        tags: ['Coffee'],
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 1)
            .toList(),
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1),
    Restaurant(
        id: 6,
        name: ' Coffee',
        imageUrl:
            'https://images.unsplash.com/photo-1588483977150-9c2127ab7bcc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        tags: ['Coffee'],
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 1)
            .toList(),
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1),
    Restaurant(
        id: 7,
        name: ' Coffee',
        imageUrl:
            'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        tags: ['Coffee'],
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 1)
            .toList(),
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1),
    Restaurant(
        id: 2,
        name: 'cream Ice ',
        imageUrl:
            'https://media.istockphoto.com/photos/triple-fruity-smoothie-treat-peach-strawberry-and-blackberry-picture-id150506636',
        tags: ['Drink'],
        // MenuItem.menuItems
        //     .where((menuItem) => menuItem.restaurantId == 2)
        //     .map((menuItem) => menuItem.category)
        //     .toSet()
        //     .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 2)
            .toList(),
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1),
    Restaurant(
        id: 3,
        name: ' Ice Gelato ',
        imageUrl:
            'https://images.unsplash.com/photo-1634046387041-db02e878d22b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80',
        tags: ['Drink'],
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 3)
            .toList(),
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1),
    Restaurant(
        id: 4,
        name: 'Golden Ice ',
        imageUrl:
            'https://images.unsplash.com/photo-1498654896293-37aacf113fd9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', // tags: ['Italian', 'Dessert', 'Ice Cream'],
        tags: ['Drink'],
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 4)
            .toList(),
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1),
  ];
}
