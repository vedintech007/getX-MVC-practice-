import 'package:get/get.dart';
import 'package:getx_shop_app/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();

    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));

    final productResponse = [
      Product(
        id: 1,
        price: 20,
        productName: "Oraimo Freepod 3",
        productDescription: "A noise cancelation pod from oraimo",
        productImage: "assets/img1.png",
      ),
      Product(
        id: 2,
        price: 10,
        productName: "Hp Monitor",
        productDescription: "4k monitor from ht",
        productImage: "assets/img2.png",
      ),
      Product(
        id: 3,
        price: 60,
        productName: "Wireless Speaker",
        productDescription: "Super based speaker from \nJP-Kando tech",
        productImage: "assets/img3.png",
      ),
    ];

    products.value = productResponse;
  }
}
