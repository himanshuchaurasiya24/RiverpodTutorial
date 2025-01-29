import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterNotifierProvider = StateNotifierProvider<CounterNotifier, int>(
  (ref) {
    return CounterNotifier();
  },
);

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);
  // state notifier provider allow to
  //replace the value entirely instead of
  //updating it...

  void increment() {
    state = state + 1;
  }

  void decrement() {
    state = state - 1;
  }
}
