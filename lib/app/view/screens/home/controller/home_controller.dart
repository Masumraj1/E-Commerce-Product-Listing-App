import 'package:get/get.dart';


class HomeController extends GetxController {
  final List<Map<String, dynamic>> products = [
    {
      'imageUrl': 'path_to_image',
      'title': 'Allen Solly Regular fit cotton shirt',
      'currentPrice': '\$35',
      'originalPrice': '\$40.25',
      'discount': '15% OFF',
      'rating': 4.3,
      'reviewsCount': 41,
    },
    {
      'imageUrl': 'path_to_image',
      'title': 'Calvin Clein Regular fit casual shirt',
      'currentPrice': '\$45',
      'originalPrice': '\$50.00',
      'discount': '10% OFF',
      'rating': 4.5,
      'reviewsCount': 25,
    },
    // Add more products as needed
  ];
}
