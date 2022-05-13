import 'package:foodme_backend/models/model.dart';

abstract class BaseRestaurantRepository {
  Future<void> addRestaurant(Restaurant restaurant);
  Future<void> editRestaurantSettings(Restaurant restaurant);
  Future<void> editRestaurantOpeningHours(List<OpeningHours> openingHours);
  Future<void> editProducts(List<Product> products);
  Stream<Restaurant> getRestaurant();
}