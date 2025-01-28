import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stringProvider = Provider<String>((ref) {
  return 'I\'m riverpod cwm provider';
});

class RiverpodCwm extends ConsumerWidget {
  const RiverpodCwm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String value = ref.watch(stringProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod CWM'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('I\'m better'),
          ),
          Center(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
