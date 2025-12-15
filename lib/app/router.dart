import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// GoRouter Provider
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('페이지를 찾을 수 없습니다.'),
      ),
    ),
  );
});

