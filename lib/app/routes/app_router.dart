import 'package:asahi_todo/app/pages/firestore/firestore_page.dart';
import 'package:asahi_todo/app/pages/home/home_page.dart';
import 'package:asahi_todo/app/pages/provider/provider_page.dart';

import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        path: "/firestore", builder: (context, state) => const FirestorePage()),
    GoRoute(
        path: "/provider", builder: (context, state) => const ProviderPage()),
  ],
);
