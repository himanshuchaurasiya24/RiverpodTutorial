import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stringProvider = Provider<String>((ref) => DateTime.now().toString());
// final stringProvider = Provider<String>((ref) =>tiktok());
// String tiktok() {
//   String date = 'gcjvhbk';
//   Timer.periodic(
//     Duration(seconds: 1),
//     (timer) {
//       date = DateTime.now().toString();
//     },
//   );
//   return date;
// }

final stringNotifierProvider = StateNotifierProvider<StringNotifier, String>(
  (ref) {
    return StringNotifier();
  },
);

class StringNotifier extends StateNotifier<String> {
  StringNotifier() : super(DateTime.now().toString()) {
    startTimer();
  }
  void startTimer() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        state = DateTime.now().toString();
      },
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(stringProvider);
    final timer = ref.watch(stringNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(message),
            Text(timer),
          ],
        ),
      ),
    );
  }
}
