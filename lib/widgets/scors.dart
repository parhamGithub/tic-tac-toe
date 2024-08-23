import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/providers/npc_scores_provider.dart';

import 'package:tic_tac_toe/providers/user_scores_provider.dart';

class Scors extends ConsumerWidget {
  const Scors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userScoresProvider);
    final npc = ref.watch(npcScoresProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('You: $user'),
        const SizedBox(width: 100),
        Text('NPC: $npc'),
      ],
    );
  }
}
