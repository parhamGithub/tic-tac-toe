import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/providers/npc_spots_provider.dart';
import 'package:tic_tac_toe/providers/npc_scores_provider.dart';
import 'package:tic_tac_toe/providers/turns.dart';
import 'package:tic_tac_toe/providers/user_spots_provider.dart';
import 'package:tic_tac_toe/providers/user_scores_provider.dart';

class Buttons extends ConsumerStatefulWidget {
  const Buttons({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ButtonsState();
  }
}

class _ButtonsState extends ConsumerState<Buttons> {
  void boardRestart() {
    ref.watch(userSpotsProvider.notifier).restart();
    ref.watch(npcSpotsProvider.notifier).restart();
  }

  void scoresRestart() {
    ref.watch(userScoresProvider.notifier).restart();
    ref.watch(npcScoresProvider.notifier).restart();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            if (ref.watch(turnsProvider)) {
              ref.watch(npcScoresProvider.notifier).npcWon();
            } else {
              ref.watch(userScoresProvider.notifier).userWon();
            }
            ref.watch(turnsProvider.notifier).switchTurn();
            boardRestart();
          },
          child: Text(
            'Withdraw',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const SizedBox(width: 50),
        TextButton(
          onPressed: () {
            scoresRestart();
            boardRestart();
          },
          child: Text(
            'Restart',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
