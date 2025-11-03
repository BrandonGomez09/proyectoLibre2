// lib/features/goals/data/models/goal_model.dart
import 'package:mis_metas_app/features/goals/domain/entities/goal.dart';

// 1. Extiende de la entidad del Dominio
class GoalModel extends Goal {
  GoalModel({
    required super.id,
    required super.title,
    required super.description,
  });

  // 2. Factory para crear un GoalModel desde el JSON de la API
  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
      id: json['id'] ?? 'no-id',
      title: json['title'] ?? 'no-title',
      description: json['description'] ?? 'no-description',
    );
  }

  // 3. Método para convertir a JSON (para crear/actualizar)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}