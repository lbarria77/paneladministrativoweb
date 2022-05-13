import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodme_backend/models/restaurant_model.dart';
import 'package:foodme_backend/models/product_model.dart';
import 'package:foodme_backend/models/opening_hours_model.dart';
import 'package:foodme_backend/repositories/restaurant/base_restaurant_repository.dart';

class RestaurantRepository extends BaseRestaurantRepository {
  final FirebaseFirestore _firebaseFirestore;

  RestaurantRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Future<void> addRestaurant(Restaurant restaurant) async {
    await _firebaseFirestore
        .collection('restaurants')
        .add(restaurant.toDocument());
  }

  @override
  Future<void> editProducts(List<Product> products) async {
    await _firebaseFirestore
        .collection('restaurants')
        .doc('hjdhajshdjkashjdhk')
        .update({
      'products': products.map((product) {
        return product.toDocument();
      }).toList()
    });
  }

  @override
  Future<void> editRestaurantOpeningHours(
      List<OpeningHours> openingHours) async {
    await _firebaseFirestore
        .collection('restaurants')
        .doc('hjdhajshdjkashjdhk')
        .update({
      'openigHours': openingHours.map((openingHour) {
        return openingHour.toDocument();
      }).toList()
    });
  }

  @override
  Future<void> editRestaurantSettings(Restaurant restaurant) async {
    await _firebaseFirestore
        .collection('restaurants')
        .doc('hjdhajshdjkashjdhk')
        .update(restaurant.toDocument());
  }

  @override
  Stream<Restaurant> getRestaurant() {
    return _firebaseFirestore
        .collection('restaurants')
        .doc('hjdhajshdjkashjdhk')
        .snapshots()
        .map((snapshot) {
      return Restaurant.fromSnapshot(snapshot);
    });
  }
}
