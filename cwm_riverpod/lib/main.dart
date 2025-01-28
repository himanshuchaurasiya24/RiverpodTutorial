// ignore_for_file: unused_import

import 'package:cwm_riverpod/different_providers/landing_future_provider.dart';
import 'package:cwm_riverpod/riverpod_cwm.dart';
import 'package:cwm_riverpod/different_providers/state_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    // UpdateCheck(),
    // const ProviderScope(
    //   child: MyApp(),
    // ),
    // Provider<String>(
    //   create: (context) {
    //     return 'I\'m riverpod';
    //   },
    //   child: MyApp(),
    // ),
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: Provider<String>(
      //   create: (context) {
      //     return 'I\'m riverpod child';
      //   },
      //   child: ProviderCWM(),
      // ),
      // home: RiverpodCwm(),
      // home: OurStateProvider(),
      home: LandingFutureProvider(),
    );
  }
}
