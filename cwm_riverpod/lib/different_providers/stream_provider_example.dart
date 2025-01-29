import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Stream<String> fetchNumbers() {
  return Stream<String>.periodic(
    const Duration(seconds: 1),
    (computationCount) {
      //
      return DateTime.now().toString();
    },
  ).take(500);
}

final numberProvider = StreamProvider<String>(
  (ref) => fetchNumbers(),
);

class StreamProviderExample extends ConsumerWidget {
  const StreamProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var asyncValue = ref.watch(numberProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider Example'),
      ),
      body: asyncValue.when(data: (data) {
        return Text('Data: $data');
      }, error: (error, stackTrace) {
        return Text('Error: $error');
      }, loading: () {
        return Center(child: const CircularProgressIndicator());
      }),
    );
  }
}
