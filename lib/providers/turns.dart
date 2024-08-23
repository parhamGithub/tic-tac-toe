import 'package:flutter_riverpod/flutter_riverpod.dart';

class Turns extends StateNotifier<bool> {
  Turns() : super(true);

  void switchTurn() {
    state = !state;
  }
}

final turnsProvider = StateNotifierProvider<Turns, bool>((ref) {
  return Turns();
});
