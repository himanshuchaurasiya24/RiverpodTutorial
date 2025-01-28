import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<int>(
  (ref) {
    return 0;
  },
);

class OurStateProvider extends ConsumerWidget {
  const OurStateProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counterProvider = ref.watch(counterStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider Example...'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterStateProvider.notifier).state++;
        },
      ),
      body: Center(
        child: Text(
          counterProvider.toString(),
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
