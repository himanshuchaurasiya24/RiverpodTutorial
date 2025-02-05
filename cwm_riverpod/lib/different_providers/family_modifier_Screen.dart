import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// hard coded value
// final weatherProviders = FutureProvider<String>((ref) {
//   return fetchWeather(cityName: 'Chandigarh');
// });
// FAMILY MODIFIER can be used with any provider type
// used to pass data to provider from ui or external parameters...

final weatherProvider = FutureProvider.family.autoDispose<String, String>((ref, arg) {
  return fetchWeather(cityName: arg);
});
Future<String> fetchWeather({required String cityName}) async {
  return await Future.delayed(const Duration(seconds: 3), () {
    return 'Sunny in $cityName...';
  });
}

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // String weather = ref.watch(weatherProvider('Chandigarh'));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Modifier Example...'),
      ),
      body: Center(
        child: ref
            .watch(
              weatherProvider('Chandigarh'),
            )
            .when(
              data: (weather) => Text(weather),
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error'),
            ),
      ),
    );
  }
}
