// lib/features/goals/domain/entities/goal.dart

class Goal {
  final String id;
  final String title;
  final String description;
  // (Puedes agregar más campos como 'fecha_limite', etc.)

  Goal({
    required this.id,
    required this.title,
    required this.description,
  });
}

// NOTA: Podríamos crear una entidad Milestone (Hito) aquí también,
// pero empecemos solo con Goal para mantenerlo simple.