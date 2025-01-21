// import 'package:cwm_riverpod/home_screen.dart';
import 'package:cwm_riverpod/provider_cwm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
      // const ProviderScope(
      //   child: MyApp(),
      // ),
      Provider<String>(
    create: (context) {
      return 'I\'m riverpod';
    },
    child: MyApp(),
  ));
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
      // home: const HomeScreen(),
      home:  Provider<String>(
        create: (context) {
          return 'I\'m riverpod child';
        },
        child: ProviderCWM()),
    );
  }
}
