import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/providers/npc_scores_provider.dart';
import 'package:tic_tac_toe/providers/npc_spots_provider.dart';
import 'package:tic_tac_toe/providers/turns.dart';
import 'package:tic_tac_toe/providers/user_scores_provider.dart';
import 'package:tic_tac_toe/providers/user_spots_provider.dart';

class Layout extends ConsumerStatefulWidget {
  const Layout({super.key});

  @override
  ConsumerState<Layout> createState() => _LayoutState();
}

class _LayoutState extends ConsumerState<Layout> {
  void play(int x, int y) {
    // handle turns and play the game (true = User, false = NPC)
    final user = ref.watch(userSpotsProvider.notifier);
    final npc = ref.watch(npcSpotsProvider.notifier);

    final location = '$x $y';

    if (user.checkIfPlayed(location) || npc.checkIfPlayed(location)) {
      return;
    }

    if (ref.watch(turnsProvider)) {
      final status = user.newSpot(location);
      if (status == 'win') {
        user.restart();
        npc.restart();
        ref.watch(userScoresProvider.notifier).userWon();
        return;
      }
    } else {
      final status = npc.newSpot(location);
      if (status == 'win') {
        user.restart();
        npc.restart();
        ref.watch(npcScoresProvider.notifier).npcWon();
        return;
      }
    }

    ref.watch(turnsProvider.notifier).switchTurn();
  }

  String place(x, y) {
    // rendering the tags
    final userChosens = ref.watch(userSpotsProvider);
    final npcChosens = ref.watch(npcSpotsProvider);
    final location = '$x $y';

    if (userChosens.contains(location)) {
      return 'X';
    }

    if (npcChosens.contains(location)) {
      return 'O';
    }
    return '___';
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < 3; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextButton(
                      onPressed: () {
                        play(i, 0);
                      },
                      child: Text(place(i, 0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextButton(
                      onPressed: () {
                        play(i, 1);
                      },
                      child: Text(place(i, 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextButton(
                      onPressed: () {
                        play(i, 2);
                      },
                      child: Text(place(i, 2)),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
