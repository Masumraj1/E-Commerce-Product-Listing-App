import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/models/product_model.dart';
import 'package:recipe_app/app/services/api_check.dart';
import 'package:recipe_app/app/services/api_client.dart';
import 'package:recipe_app/app/services/app_url.dart';
import 'package:recipe_app/app/utils/enums/status.dart';


class HomeController extends GetxController {

  final rxRequestStatus = Status.loading.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  //===================>>>>>Product Method<<<<<===========
  RxList<ProductList> productList = <ProductList>[].obs;

  getProduct() async {
    setRxRequestStatus(Status.loading);
    refresh();

    try {
      var response = await ApiClient.getData(ApiUrl.products);

      if (response.statusCode == 200) {
        if (response.body['products'] != null) {
          productList.value = List<ProductList>.from(
              response.body['products'].map((x) => ProductList.fromJson(x))
          );
          debugPrint("Length============${productList.length}");
          setRxRequestStatus(Status.completed);
        } else {
          setRxRequestStatus(Status.error);
        }
      } else {
        setRxRequestStatus(Status.error);
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      debugPrint("Error: $e");
      setRxRequestStatus(Status.error);
    } finally {
      refresh();
    }
  }




  @override
  void onInit() {
   getProduct();
    super.onInit();
  }
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

    {
      'imageUrl': 'path_to_image',
      'title': 'Calvin Clein Regular fit casual shirt',
      'currentPrice': '\$45',
      'originalPrice': '\$50.00',
      'discount': '10% OFF',
      'rating': 4.5,
      'reviewsCount': 25,
    },    {
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
