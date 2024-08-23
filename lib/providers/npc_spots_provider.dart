import 'package:flutter_riverpod/flutter_riverpod.dart';

class NpcSpotsNotifier extends StateNotifier<List<String>> {
  NpcSpotsNotifier() : super([]);

  String newSpot(String location) {
    state = [...state, location];
    // Check for win after user's move
    if (checkWin(state)) {
      return 'win';
    }
    return 'continue';
  }

  bool checkIfPlayed(location) {
    if (state.contains(location)) {
      return true;
    }
    return false;
  }

  void restart() {
    state = [];
  }

  bool checkWin(List<String> location) {
    // Implement win checking logic here
    if (state.contains('1 1')) {
      if (state.contains('0 2') && state.contains('2 0')) {
        return true;
      }
      if (state.contains('0 0') && state.contains('2 2')) {
        return true;
      }
      if (state.contains('0 1') && state.contains('2 1')) {
        return true;
      }
      if (state.contains('1 0') && state.contains('1 2')) {
        return true;
      }
    }
    if (state.contains('0 0')) {
      if (state.contains('0 1') && state.contains('0 2')) {
        return true;
      }
      if (state.contains('1 0') && state.contains('2 0')) {
        return true;
      }
    }
    if (state.contains('2 2')) {
      if (state.contains('1 2') && state.contains('0 2')) {
        return true;
      }
      if (state.contains('2 1') && state.contains('2 0')) {
        return true;
      }
    }
    return false;
  }
}

final npcSpotsProvider =
    StateNotifierProvider<NpcSpotsNotifier, List<String>>((ref) {
  return NpcSpotsNotifier();
});
