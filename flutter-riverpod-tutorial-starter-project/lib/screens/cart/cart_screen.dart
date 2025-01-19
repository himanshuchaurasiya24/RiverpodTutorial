import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/products_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(reducedProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartProducts.map(
                (product) {
                  return Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          product.image,
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          product.title,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(), // output cart products here
            ),

            // output totals here
          ],
        ),
      ),
    );
  }
}
