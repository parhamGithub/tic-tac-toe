import 'package:flutter_riverpod/flutter_riverpod.dart';

class NpcScoresNotifier extends StateNotifier<int> {
  NpcScoresNotifier() : super(0);

  void npcWon() {
    state++;
  }

  void restart() {
    state = 0;
  }
}

final npcScoresProvider = StateNotifierProvider<NpcScoresNotifier, int>((ref) {
  return NpcScoresNotifier();
});
