import 'package:ecommerce_app/src/features/account/account_screen.dart';
import 'package:ecommerce_app/src/features/orders_list/orders_list_screen.dart';
import 'package:ecommerce_app/src/features/products_list/products_list_screen.dart';
import 'package:ecommerce_app/src/features/shopping_cart/shopping_cart_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_screen.dart';
import 'package:ecommerce_app/src/features/sign_in/email_password_sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const ProductsListScreen(),
        routes: [
          GoRoute(
            path: 'cart',
            pageBuilder: (context, state) => MaterialPage(
              child: const ShoppingCartScreen(),
              key: state.pageKey,
              fullscreenDialog: true,
            ),
          ),
          GoRoute(
            path: 'orders',
            pageBuilder: (context, state) => MaterialPage(
              child: const OrdersListScreen(),
              key: state.pageKey,
              fullscreenDialog: true,
            ),
          ),
          GoRoute(
            path: 'account',
            pageBuilder: (context, state) => MaterialPage(
              child: const AccountScreen(),
              key: state.pageKey,
              fullscreenDialog: true,
            ),
          ),
          GoRoute(
            path: 'signIn',
            pageBuilder: (context, state) => MaterialPage(
              child: const EmailPasswordSignInContents(
                formType: EmailPasswordSignInFormType.signIn,
              ),
              key: state.pageKey,
              fullscreenDialog: true,
            ),
          ),
        ]),
  ],
);
