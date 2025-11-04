import 'package:go_router/go_router.dart';
import 'package:mis_metas_app/features/login/presentation/pages/login_page.dart';
import 'package:mis_metas_app/features/register/presentation/pages/register_page.dart';
import 'package:mis_metas_app/features/goals/presentation/pages/home_page.dart';
import 'package:mis_metas_app/shared/providers/session_provider.dart';
import 'package:mis_metas_app/core/router/routes.dart';

GoRouter appRouter(SessionProvider sessionProvider) {
return GoRouter(
  initialLocation: AppRoutes.loginPath,

  refreshListenable: sessionProvider,

  routes: [
    GoRoute(
      path: AppRoutes.loginPath,
      name: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
        path: AppRoutes.registerPath,
        name: AppRoutes.register,
        builder: (context, state) =>
        const RegisterPage(),
    ),
    GoRoute(
      path: AppRoutes.homePath,
      name: AppRoutes.home,
      builder: (context, state) => const HomePage(),
    ),
  ],

  redirect: (context, state) {
    final authStatus = sessionProvider.authStatus;
    final location = state.matchedLocation;

    final publicRoutes = [AppRoutes.loginPath, AppRoutes.registerPath];

    if (authStatus == AuthStatus.notAuthenticated) {
    if (!publicRoutes.contains(location)) {
      return AppRoutes.loginPath;
    }
    }

    if (authStatus == AuthStatus.authenticated) {
    if (publicRoutes.contains(location)) {
      return AppRoutes.homePath;
    }
    }

    return null;
  },
);
}