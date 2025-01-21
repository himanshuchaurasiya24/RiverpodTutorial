import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// vid at 13:00
class ProviderCWM extends StatelessWidget {
  const ProviderCWM({super.key});

  @override
  Widget build(BuildContext context) {
    String data = Provider.of<String>(context);
    // int data = Provider.of<int>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider CWM'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Provider CWM'),
            Text(data.toString()),
          ],
        ),
      ),
    );
  }
}
