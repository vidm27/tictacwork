import 'package:go_router/go_router.dart';
import 'package:tictac_mobile/timer/pages/home_page.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) =>  HomeScreen())
]);
