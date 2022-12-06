import 'package:get/get.dart';
import 'package:getx_shop_app/models/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get cartCount => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price!);

  // var testAmount = 0;

  void addToCart(Product product) {
    cartItems.add(product);
  }
}
