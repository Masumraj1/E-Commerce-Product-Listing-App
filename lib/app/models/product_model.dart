class ProductModel {
  final List<ProductList> products;
  final int total;
  final int skip;
  final int limit;

  ProductModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    var list = json['products'] as List;
    List<ProductList> productsList = list.map((i) => ProductList.fromJson(i)).toList();

    return ProductModel(
      products: productsList,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class ProductList {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  ProductList({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) {
    var list = json['reviews'] as List? ?? [];
    List<Review> reviewsList = list.map((i) => Review.fromJson(i)).toList();

    return ProductList(
      id: json['id'] ?? 0,  // Default to 0 if 'id' is missing
      title: json['title'] ?? '',  // Default to empty string if 'title' is missing
      description: json['description'] ?? '',  // Default to empty string if 'description' is missing
      category: json['category'] ?? '',  // Default to empty string if 'category' is missing
      price: (json['price'] ?? 0.0).toDouble(),  // Default to 0.0 if 'price' is missing
      discountPercentage: (json['discountPercentage'] ?? 0.0).toDouble(),  // Default to 0.0 if 'discountPercentage' is missing
      rating: (json['rating'] ?? 0.0).toDouble(),  // Default to 0.0 if 'rating' is missing
      stock: json['stock'] ?? 0,  // Default to 0 if 'stock' is missing
      tags: List<String>.from(json['tags'] ?? []),  // Default to empty list if 'tags' is missing
      brand: json['brand'] ?? '',  // Default to empty string if 'brand' is missing
      sku: json['sku'] ?? '',  // Default to empty string if 'sku' is missing
      weight: json['weight'] ?? 0,  // Default to 0 if 'weight' is missing
      dimensions: json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : Dimensions(width: 0.0, height: 0.0, depth: 0.0),  // Handle null dimensions
      warrantyInformation: json['warrantyInformation'] ?? '',  // Default to empty string if 'warrantyInformation' is missing
      shippingInformation: json['shippingInformation'] ?? '',  // Default to empty string if 'shippingInformation' is missing
      availabilityStatus: json['availabilityStatus'] ?? '',  // Default to empty string if 'availabilityStatus' is missing
      reviews: reviewsList,
      returnPolicy: json['returnPolicy'] ?? '',  // Default to empty string if 'returnPolicy' is missing
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,  // Default to 0 if 'minimumOrderQuantity' is missing
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : Meta(createdAt: '', updatedAt: '', barcode: '', qrCode: ''),  // Handle null 'meta'
      images: List<String>.from(json['images'] ?? []),  // Default to empty list if 'images' is missing
      thumbnail: json['thumbnail'] ?? '',  // Default to empty string if 'thumbnail' is missing
    );
  }

}

class Review {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'],
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
    );
  }
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: json['width'].toDouble(),
      height: json['height'].toDouble(),
      depth: json['depth'].toDouble(),
    );
  }
}

class Meta {
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      barcode: json['barcode'],
      qrCode: json['qrCode'],
    );
  }
}
