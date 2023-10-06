import 'package:asahi_todo/app/screens/firestore_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const FirestoreScreen(),
    ),
  ],
);