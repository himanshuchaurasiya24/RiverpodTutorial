// ignore_for_file: unused_import

import 'package:cwm_riverpod/different_providers/change_notifier_provider.dart';
import 'package:cwm_riverpod/different_providers/future_provider.dart';
import 'package:cwm_riverpod/different_providers/state_notifier_provider.dart';
import 'package:cwm_riverpod/different_providers/stream_provider_example.dart';
import 'package:flutter/material.dart';

class LandingFutureProvider extends StatelessWidget {
  const LandingFutureProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Future Provider...'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  // return const WeatherScreen();
                  // return const StreamProviderExample();
                  return  ChangeNotifierProviderExample();
                  // return  StateNotifierProviderExample();
                },
              ),
            );
          },
          child: Text('Change Notifier Provider Example'),
        ),
      ),
    );
  }
}
