import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mis_metas_app/myapp.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mis_metas_app/shared/providers/session_provider.dart';
import 'package:mis_metas_app/features/login/data/datasources/auth_datasource.dart';
import 'package:mis_metas_app/features/login/data/repositories/auth_repository_impl.dart';
import 'package:mis_metas_app/features/login/domain/usecases/login_user.dart';
import 'package:mis_metas_app/features/login/presentation/providers/login_provider.dart';
import 'package:mis_metas_app/features/register/data/datasources/register_datasource.dart';
import 'package:mis_metas_app/features/register/data/repositories/register_repository_impl.dart';
import 'package:mis_metas_app/features/register/domain/usecases/register_user.dart';
import 'package:mis_metas_app/features/register/presentation/providers/register_provider.dart';
import 'package:mis_metas_app/features/goals/data/datasources/goal_datasource.dart';
import 'package:mis_metas_app/features/goals/data/repositories/goal_repository_impl.dart';
import 'package:mis_metas_app/features/goals/domain/usecases/get_goals.dart';
import 'package:mis_metas_app/features/goals/domain/usecases/create_goal.dart';
import 'package:mis_metas_app/features/goals/presentation/providers/goal_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final authDataSource = AuthDataSourceImpl();
  final authRepository = AuthRepositoryImpl(dataSource: authDataSource);
  final loginUserUseCase = LoginUser(authRepository);

  final registerDataSource = RegisterDataSourceImpl();
  final registerRepository =
  RegisterRepositoryImpl(dataSource: registerDataSource);
  final registerUserUseCase = RegisterUser(registerRepository);

  final goalDataSource = GoalDataSourceImpl();
  final goalRepository = GoalRepositoryImpl(dataSource: goalDataSource);
  final getGoalsUseCase = GetGoals(goalRepository);
  final createGoalUseCase = CreateGoal(goalRepository);

  final sessionProvider = SessionProvider();

  runApp(
    DevicePreview(
      enabled: kIsWeb,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: sessionProvider),

          // Provider de Login
          ChangeNotifierProvider(
            create: (_) => LoginProvider(
                loginUserUseCase: loginUserUseCase,
                sessionProvider: sessionProvider,
            ),
          ),

          // Provider de Register
          ChangeNotifierProvider(
            create: (_) => RegisterProvider(
                registerUserUseCase: registerUserUseCase,
                sessionProvider: sessionProvider,
            ),
          ),

          // Provider de Goals
          ChangeNotifierProvider(
            create: (_) => GoalProvider(
                getGoalsUseCase: getGoalsUseCase,
                createGoalUseCase: createGoalUseCase,
                sessionProvider: sessionProvider,
            ),
          ),
        ],
        child: MyApp(sessionProvider: sessionProvider),
      ),
    ),
  );
}