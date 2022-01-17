import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kamelfoodapp/models/category_filter_model.dart';
import 'package:kamelfoodapp/models/price_filter_model.dart';

abstract class FiltersEvent extends Equatable {
  const FiltersEvent();
  @override
  List<Object?> get props => [];
}

class LoadFilter extends FiltersEvent {
  @override
  List<Object?> get props => [];
}

class UpdateCategoryFilter extends FiltersEvent {
  final CategoryFilter categoryFilter;
  UpdateCategoryFilter({required this.categoryFilter});
  @override
  List<Object?> get props => [categoryFilter];
}

class UpdatePriceFilter extends FiltersEvent {
  final PriceFilter priceFilter;
  UpdatePriceFilter({required this.priceFilter});
  @override
  List<Object?> get props => [priceFilter];
}
