import 'package:cwm_riverpod/different_providers/counter_app_screen.dart';
import 'package:flutter/material.dart';

class DummyHomeScreen extends StatelessWidget {
  const DummyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CounterAppScreen()));
                },
                child: Text('Counter App')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CounterAppScreen()));
                },
                child: Text('Family Modifier')),
          ],
        ),
      ),
    );
  }
}
