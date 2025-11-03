class AppRoutes {

  static const String login = 'login';
  static const String loginPath = '/login';
  static const String register = 'register';
  static const String registerPath = '/register';

  // Rutas de la App (Protegidas)
  static const String home = 'home';
  static const String homePath = '/';

  static const String goalDetails = 'goal-details';
  // Nota: :id es un parámetro que pasaremos
  static const String goalDetailsPath = '/goal/:id';
}