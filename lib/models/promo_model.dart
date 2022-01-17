import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  Promo({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
  @override
  List<Object?> get props => [id, title, imageUrl, description];
  static List<Promo> promos = [
    Promo(
      description:
          'Tunisian Coffee of\$10 or more and the delivery fee is on us',
      id: 1,
      title: 'free delivery on your first 3 orders',
      imageUrl:
          'https://media.istockphoto.com/photos/mug-on-plate-filled-with-coffee-surrounded-by-coffee-beans-picture-id157528129?s=612x612',
    ),
    Promo(
      description:
          'Place an order of\$10 or more and the delivery fee is on us',
      id: 2,
      title: 'free delivery on your first 3 orders',
      imageUrl:
          'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    ),
  ];
}
