import 'package:get/get.dart';
import 'package:recipe_app/app/global/helper/show_custom_message/show_custom_snackbar.dart';
import 'package:recipe_app/app/models/product_model.dart';
import 'package:recipe_app/app/services/product_service.dart';

class HomeController extends GetxController {
  final ProductService _service = ProductService();

  var products = <ProductModel>[].obs;
  var isLoading = false.obs;
  var isLoadingMore = false.obs;
  var hasMore = true.obs;
  var page = 0;
  final int limit = 10;

  var searchQuery = ''.obs;
  var sortOption = ''.obs;

  RxList<ProductModel> searchResults = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchInitialProducts();
    super.onInit();
  }

  // Fetch the initial set of products
  void fetchInitialProducts() async {
    isLoading(true);
    page = 0;
    try {
      final response = await _service.fetchProducts(limit: limit, skip: page * limit);
      products.assignAll(response.products);
      hasMore.value = response.products.length == limit;
    } catch (e) {
      toastMessage(message: 'Failed to fetch products');
    } finally {
      isLoading(false);
    }
  }

  // Load more products when reaching the end of the list
  void loadMoreProducts() async {
    if (isLoadingMore.value || !hasMore.value) return;

    isLoadingMore(true);
    page++;

    try {
      final response = await _service.fetchProducts(limit: limit, skip: page * limit);
      if (response.products.isNotEmpty) {
        products.addAll(response.products);
        hasMore.value = response.products.length == limit;
      } else {
        hasMore.value = false;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoadingMore(false);
    }
  }

  // Sort products based on selected option (price or rating)
  void sortProducts(String option) {
    sortOption.value = option;
    if (option == 'price_low') {
      products.sort((a, b) => a.price.compareTo(b.price));
    } else if (option == 'rating') {
      products.sort((a, b) => b.rating.compareTo(a.rating));
    }
  }

  // Search products based on query and sort them
  void searchProducts() {
    final query = searchQuery.value;
    final option = sortOption.value;

    final results = products.where((product) {
      return product.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    // Apply sorting after filtering
    if (option == 'priceLow') {
      results.sort((a, b) => a.price.compareTo(b.price));
    } else if (option == 'ratingHigh') {
      results.sort((a, b) => b.rating.compareTo(a.rating));
    }

    searchResults.assignAll(results);
  }
}
