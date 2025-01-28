import 'package:cwm_riverpod/different_providers/future_provider.dart';
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
                  return const WeatherScreen();
                },
              ),
            );
          },
          child: Text('Future Provider Example'),
        ),
      ),
    );
  }
}
