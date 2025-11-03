// lib/features/goals/presentation/widgets/goal_card.dart
import 'package:flutter/material.dart';
import 'package:mis_metas_app/features/goals/domain/entities/goal.dart';
// (En el futuro importaremos 'package:go_router/go_router.dart' y 'routes.dart' para la navegación)

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
        // TODO: Navegar a la pantalla de detalles
        // context.goNamed(AppRoutes.goalDetails, pathParameters: {'id': goal.id});
      },
    );
  }
}