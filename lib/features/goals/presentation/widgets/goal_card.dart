import 'package:flutter/material.dart';
import 'package:mis_metas_app/features/goals/domain/entities/goal.dart';

class GoalCard extends StatelessWidget {
  final Goal goal;

  const GoalCard({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(goal.title),
      subtitle: Text(goal.description),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
      },
    );
  }
}