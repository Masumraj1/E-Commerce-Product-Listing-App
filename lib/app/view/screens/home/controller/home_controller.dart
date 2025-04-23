import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/app/models/product_model.dart';
import 'package:recipe_app/app/services/api_check.dart';
import 'package:recipe_app/app/services/api_client.dart';
import 'package:recipe_app/app/services/app_url.dart';
import 'package:recipe_app/app/utils/enums/status.dart';

class HomeController extends GetxController {
  final rxRequestStatus = Status.loading.obs;
  int currentPage = 1;
  int itemsPerPage = 20;
  var isLoadingMore = false.obs;
  bool hasMoreData = true;

  RxList<ProductList> productList = <ProductList>[].obs;
  RxList<ProductList> searchedProducts = <ProductList>[].obs;
  TextEditingController searchController = TextEditingController();

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;


  //======================Get Products==================
  getProduct({int page = 1}) async {
    if (isLoadingMore.value) return;
    isLoadingMore = true.obs;
    setRxRequestStatus(Status.loading);

    try {
      var response = await ApiClient.getData(
        '${ApiUrl.products}?page=$page&limit=$itemsPerPage',
      );

      if (response.statusCode == 200) {
        if (response.body['products'] != null) {
          if (page == 1) {
            productList.value = List<ProductList>.from(
              response.body['products'].map((x) => ProductList.fromJson(x)),
            );
          } else {
            productList.addAll(
              List<ProductList>.from(
                response.body['products'].map((x) => ProductList.fromJson(x)),
              ),
            );
          }

          searchedProducts.value = productList;
          setRxRequestStatus(Status.completed);
          currentPage = page;
          if (response.body['products'].length < itemsPerPage) {
            hasMoreData = false;
          }
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
      isLoadingMore = false.obs;
    }
  }

  //======================Search==================
  void filterProductByName(String query) {
    if (query.isEmpty) {
      searchedProducts.value = productList;
    } else {
      searchedProducts.value = productList
          .where((product) => product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }


  // ────────────────── sort helpers ──────────────────

  void sortByPriceAscending() {
    searchedProducts.sort((a, b) => a.price.compareTo(b.price));
    searchedProducts.refresh();
  }


  void sortByRatingDescending() {
    searchedProducts.sort((a, b) => b.rating.compareTo(a.rating));
    searchedProducts.refresh();
  }
  @override
  void onInit() {
    getProduct(page: 1);  // Start by fetching the first page of products
    super.onInit();
  }
}
