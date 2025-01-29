import 'package:cwm_riverpod/different_providers/user_change_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeNotifierProviderExample extends ConsumerWidget {
  ChangeNotifierProviderExample({super.key});
  final usernameController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('Rebuilt...');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider...'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
    // debugPrint('Rebuilt... in consumer');
              return Text(
                  ref.watch(userChangeNotifierProvider).username.toString());
            },
          ),
          TextField(
            controller: usernameController,
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(userChangeNotifierProvider.notifier)
                  .changeUsername(usernameController.text);
            },
            child: const Text('update username'),
          )
        ],
      ),
    );
  }
}
