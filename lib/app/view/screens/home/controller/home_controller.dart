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
          searchedProducts.value = productList;
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

//===================>>>>>Search Method<<<<<===========
  RxList<ProductList> searchedProducts = <ProductList>[].obs;
  TextEditingController searchController = TextEditingController();

  void filterProductByName(String query) {
    if (query.isEmpty) {
      searchedProducts.value = productList;
    } else {
      searchedProducts.value = productList
          .where((product) => product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }


  @override
  void onInit() {
   getProduct();
    super.onInit();
  }

}
