import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider.autoDispose<int>(
  (ref) {
    return 0;
  },
);

class CounterAppScreen extends ConsumerWidget {
  const CounterAppScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counterNumber = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App...'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // ref.read(counterProvider.state).state++;
            ref.read(counterProvider.notifier).state++;
          },
          label: Icon(Icons.add)),
      body: Center(
        child: Text(counterNumber.toString()),
      ),
    );
  }
}
