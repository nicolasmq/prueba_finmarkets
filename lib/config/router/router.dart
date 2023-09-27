import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_finmarkets/features/asset_detail/presentation/screens/asset_detail_screen.dart';
import 'package:prueba_finmarkets/features/currencies_list/domain/entities/asset_entity.dart';
import 'package:prueba_finmarkets/features/currencies_list/presentation/screens/assets_screen.dart';

class AppRouter {
  static router() => GoRouter(initialLocation: '/', routes: [
        GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) => page(child: const AssetsScreen()),
            routes: [
              GoRoute(
                path: 'asset/:id',
                name: 'asset-detail',
                pageBuilder: (context, state) => page(
                    child: AssetDetail(
                  assetId: state.pathParameters['id']!,
                  assetEntity: state.extra as AssetEntity,
                )),
              ),
            ]),
      ]);

  static page({required Widget child, Object? arguments}) => MaterialPage(
        child: child,
        arguments: arguments,
      );
}
