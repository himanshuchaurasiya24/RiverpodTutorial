import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';
part 'cart_provider.g.dart';

// Making of notifierProvider by riverpod annotation
@riverpod
class CartNotifier extends _$CartNotifier {
  // initial value
  @override
  Set<Product> build() {
    // notifier is a set type to avoid any duplicate entries of products...
    return {
      // no need to write any initial value of product here
    };
  }

  // method to update state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
      // ...state is the old state of products
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((element) => element.id != product.id).toSet();
    }
  }
}

@riverpod
int cartTotal(ref) {
  int total = 0;
  final cartProducts = ref.watch(cartNotifierProvider);
  for(Product product in cartProducts){
    total += product.price;
  }
    return total;
}
// Manually making notifierProvider
// class CartNotifier extends Notifier<Set<Product>> {
//   // notifier is a set type to avoid any duplicate entries of products...
//   // initial value
//   @override
//   Set<Product> build() {
//     return {
//       const Product(
//           id: '4',
//           title: 'Red Backpack',
//           price: 14,
//           image: 'assets/products/backpack.png'),
//     };
//   }

//   // method to update state
//   void addProduct(Product product) {
//     if (!state.contains(product)) {
//       state = {...state, product};
//       // ...state is the old state of products
//     }
//   }

//   void removeProduct(Product product) {
//     if (state.contains(product)) {
//       state = state.where((element) => element.id != product.id).toSet();
//     }
//   }
// }
// final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(
//   () {
//     return CartNotifier();
//   },
// );
