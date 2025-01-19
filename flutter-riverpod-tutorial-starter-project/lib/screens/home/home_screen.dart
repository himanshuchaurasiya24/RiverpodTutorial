// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/providers/products_provider.dart';
import 'package:riverpod_files/shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('HomeScreen rebuild');
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);
    return Scaffold(
      // backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
        // backgroundColor: Colors.grey[50],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(top: 20),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                  Image.asset(
                    allProducts[index].image,
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    allProducts[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${allProducts[index].price}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextButton(
                      onPressed: () {
                        if(cartProducts.contains(allProducts[index])){
                          ref.read(cartNotifierProvider.notifier).removeProduct(allProducts[index]);
                        } else {
                          ref.read(cartNotifierProvider.notifier).addProduct(allProducts[index]);
                        }
                      },
                      child: Text(cartProducts.contains(allProducts[index])
                          ? "Remove"
                          : 'Add to Cart')),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
