// import 'package:cwm_riverpod/different_providers/counter_state_notifier.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class StateNotifierProviderExample extends ConsumerWidget {
//   const StateNotifierProviderExample({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     debugPrint('REbuilt...');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('State Notifier Provider...'),
//       ),
//       body: Consumer(
//         builder: (context, ref, child) {
//     debugPrint('REbuilt...in consumer....');
//           return Center(
//             child: Text(
//               ref.watch(counterNotifierProvider).toString(),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           ref.read(counterNotifierProvider.notifier).increment();
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
