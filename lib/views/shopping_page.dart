import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_shop_app/controllers/cart_controller.dart';
import 'package:getx_shop_app/controllers/shopping_controlller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GetX<ShoppingController>(
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          margin: const EdgeInsets.all(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.products[index].productName.toString(),
                                          style: const TextStyle(fontSize: 24),
                                        ),
                                        Text(
                                          controller.products[index].productDescription.toString(),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      controller.products[index].price.toString(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                  ),
                                  child: const Text(
                                    "Add to cart",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    cartController.addToCart(controller.products[index]);
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
              GetX<CartController>(builder: (controller) {
                return Text(
                  "Total Amount: ${controller.totalPrice}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                );
              }),
              const SizedBox(height: 100),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: GetX<CartController>(
            builder: (controller) {
              return Text(
                "${controller.cartCount}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              );
            },
          ),
          icon: const Icon(
            Icons.shopping_cart_checkout,
            color: Colors.black,
            size: 25,
          ),
          backgroundColor: Colors.amber,
        ));
  }
}
