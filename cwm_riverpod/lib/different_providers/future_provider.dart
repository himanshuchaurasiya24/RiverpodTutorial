import 'dart:convert';

import 'package:cwm_riverpod/different_providers/quote_constructor.dart';
import 'package:cwm_riverpod/different_providers/time_constructor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final String url = 'https://dummyjson.com/quotes';
final String timeURL =
    'https://script.googleusercontent.com/macros/echo?user_content_key=5gSYyvUgNkE1pZ15EHf8A7-Qf0Y-teZf1NAK1xos3J4ETMqJ9bYSfYJHgBcOGEWJcCX2WRnIOeQGA4X-Lp1aA4Ocq3VDXchVm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnJ9GRkcRevgjTvo8Dc32iw_BLJPcPfRdVKhJT5HNzQuXEeN3QFwl2n0M6ZmO-h7C6eIqWsDnSrEd&lib=MwxUjRcLr2qLlnVOLh12wSNkqcO1Ikdrk';
Future<QuoteConstructor> getQuotes() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return QuoteConstructor.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load quotes');
  }
}

Future<TimeConstructor> getTime() async {
  final response = await http.get(Uri.parse(timeURL));
  if (response.statusCode == 200) {
    return TimeConstructor.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load time');
  }
}

final futureQuotesProvider = FutureProvider.autoDispose<QuoteConstructor>(
  (ref) {
    return getQuotes();
  },
);
final futureTimeProvider = FutureProvider<TimeConstructor>(
  (ref) {
    TimeConstructor data = TimeConstructor(
      day: 0,
      dayofweek: 0,
      dayofweekName: '',
      fulldate: '',
      month: 0,
      seconds: 0,
      year: 0,
      hours: 0,
      minutes: 0,
      millis: 0,
      timezone: '',
      monthName: '',
      status: '',
    );
    Future.delayed(const Duration(seconds: 1), () {
      // ref.watch(futureTimeProvider);
      data = getTime() as TimeConstructor;
    });
    return data;
  },
);

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureQuotes = ref.watch(futureQuotesProvider);
    final futureTime = ref.watch(futureTimeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider...'),
      ),
      body: Container(
        child: futureQuotes.when(
          data: (quotes) => ListView.builder(
            itemCount: quotes.quotes!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(quotes.quotes![index].quote!),
                subtitle: Text(quotes.quotes![index].author!),
              );
            },
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.watch(futureQuotesProvider);
          // ref.watch(futureTimeProvider);
        },
        child: Text('Refresh'),
      ),
    );
  }
}
