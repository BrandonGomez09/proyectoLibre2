import 'package:mis_metas_app/features/goals/domain/entities/goal.dart';

class GoalModel extends Goal {
  GoalModel({
    required super.id,
    required super.title,
    required super.description,
  });

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
      id: json['id'] ?? 'no-id',
      title: json['title'] ?? 'no-title',
      description: json['description'] ?? 'no-description',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}