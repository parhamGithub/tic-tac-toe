import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserScoresNotifierNotifier extends StateNotifier<int> {
  UserScoresNotifierNotifier() : super(0);

  void userWon() {
    state++;
  }

  void restart() {
    state = 0;
  }
}

final userScoresProvider =
    StateNotifierProvider<UserScoresNotifierNotifier, int>((ref) {
  return UserScoresNotifierNotifier();
});
