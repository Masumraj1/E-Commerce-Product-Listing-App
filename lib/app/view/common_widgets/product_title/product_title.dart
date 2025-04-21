import 'package:flutter/material.dart';
import '../../../models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Expanded(
            child: Image.network(product.thumbnail, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(product.title,
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                Text("\$${product.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
