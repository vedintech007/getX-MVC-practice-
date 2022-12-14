import 'package:get/get.dart';

class Product {
  Product({
    this.id,
    this.productName,
    this.productDescription,
    this.productImage,
    this.price,
  });

  final int? id;
  final String? productName;
  final String? productImage;
  final String? productDescription;
  final double? price;

  final isFavorite = false.obs;
  final quantity = 1.obs;
}
