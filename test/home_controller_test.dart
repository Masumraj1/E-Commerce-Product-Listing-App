// import 'package:flutter_test/flutter_test.dart';
// import 'package:recipe_app/app/models/product_model.dart';
// import 'package:recipe_app/app/view/screens/home/controller/home_controller.dart';
//
// void main() {
//   late HomeController controller;
//
//   setUp(() {
//     controller = HomeController();
//
//     controller.allProducts.value = [
//       ProductModel(id: 1, title: 'Apple', price: 50, rating: 4.5),
//       ProductModel(id: 2, title: 'Banana', price: 20, rating: 3.5),
//       ProductModel(id: 3, title: 'Orange', price: 30, rating: 4.8),
//     ];
//   });
//
//   test('searchProducts filters results by query', () {
//     controller.searchProducts('apple', '');
//     expect(controller.searchResults.length, 1);
//     expect(controller.searchResults[0].title, 'Apple');
//   });
//
//   test('searchProducts sorts by priceLow', () {
//     controller.searchProducts('', 'priceLow');
//     expect(controller.searchResults.first.title, 'Banana'); // lowest price
//   });
//
//   test('searchProducts sorts by ratingHigh', () {
//     controller.searchProducts('', 'ratingHigh');
//     expect(controller.searchResults.first.title, 'Orange'); // highest rating
//   });
// }
