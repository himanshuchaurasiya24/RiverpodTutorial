import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userChangeNotifierProvider = ChangeNotifierProvider<User>((ref) {
  return User();
});
class User extends ChangeNotifier {
  String username = 'Himanshu Chaurasiya';
  void changeUsername(String name) {
    username = name;
    // notifier listeners about the state change...
    notifyListeners();
  }
}
