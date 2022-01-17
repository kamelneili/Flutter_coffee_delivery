import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final String name;
  final int restaurantId;
  final String description;
  final double price;
  final String category;

  MenuItem(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.restaurantId,
      required this.category});
  @override
  List<Object?> get props =>
      [id, name, description, restaurantId, price, category];
  static List<MenuItem> menuItems = [
    MenuItem(
      id: 1,
      restaurantId: 1,
      category: 'Pizza',
      name: 'Margherita',
      description: 'Pizza with tomates',
      price: 5.99,
    ),
    MenuItem(
      id: 2,
      restaurantId: 2,
      category: 'Drink',
      name: 'menuitem2',
      description: 'a cold beverage ',
      price: 1.99,
    ),
    MenuItem(
      id: 3,
      restaurantId: 2,
      category: 'Drink',
      name: 'menuitem3',
      description: 'a cold beverage rr',
      price: 1.99,
    ),
    MenuItem(
      id: 4,
      restaurantId: 1,
      category: 'Drink',
      name: 'menuitem4',
      description: 'a cold beverage ',
      price: 1.99,
    ),
    MenuItem(
      id: 7,
      restaurantId: 3,
      category: 'Drink',
      name: 'Ice Gelato',
      description: 'a cold beverage ',
      price: 1.99,
    ),
    MenuItem(
      id: 5,
      restaurantId: 1,
      category: 'Coffee',
      name: 'Coffee black',
      description: 'Tunisian coffee ',
      price: 1.99,
    ),
    MenuItem(
      id: 6,
      restaurantId: 1,
      category: 'Coffee',
      name: 'expresso',
      description: 'Tunisian expresso ',
      price: 3.99,
    ),
  ];
}
