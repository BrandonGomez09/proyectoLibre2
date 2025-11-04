import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mis_metas_app/core/router/routes.dart';
import 'package:provider/provider.dart';
import 'package:mis_metas_app/features/goals/presentation/providers/goal_provider.dart';
import 'package:mis_metas_app/shared/providers/session_provider.dart';

// Importa el widget local
import 'package:mis_metas_app/features/goals/presentation/widgets/goal_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<GoalProvider>(context, listen: false).fetchGoals();
    });
  }

  void _logout() {
    Provider.of<SessionProvider>(context, listen: false).logout();
  }

  // MÉTODO PARA MOSTRAR EL DIÁLOGO DE CREAR META ---
  void _showCreateGoalDialog() {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        final goalProvider = context.read<GoalProvider>();

        return AlertDialog(
          title: const Text('Nueva Meta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
            FilledButton(
              child: const Text('Crear'),
              onPressed: () async {
                final title = titleController.text;
                final description = descriptionController.text;

                if (title.isEmpty) return;
                final bool success = await goalProvider.addGoal(
                  title: title,
                  description: description,
                );

                if (!mounted) return;
                Navigator.of(dialogContext).pop();
                if (!success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(goalProvider.error ?? 'Error al crear meta'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final goalProvider = context.watch<GoalProvider>();
    final sessionProvider = context.watch<SessionProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Metas (Usuario: ${sessionProvider.user?.name ?? '...'})'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cerrar Sesión',
            onPressed: _logout,
          ),
        ],
      ),
      body: _buildBody(goalProvider),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateGoalDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(GoalProvider provider) {
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.error != null) {
      return Center(
        child: Text('Error al cargar metas: ${provider.error}'),
      );
    }

    if (provider.goals.isEmpty) {
      return const Center(
        child: Text('No tienes metas. ¡Añade una!'),
      );
    }

    return ListView.builder(
      itemCount: provider.goals.length,
      itemBuilder: (context, index) {
        final goal = provider.goals[index];
        return GoalCard(goal: goal);
      },
    );
  }
}