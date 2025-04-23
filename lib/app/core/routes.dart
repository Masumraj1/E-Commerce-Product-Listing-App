import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/app/global/helper/extension/extension.dart';
import 'package:recipe_app/app/view/screens/home/home_screen.dart';
import 'package:recipe_app/app/view/screens/home/search/search_screen.dart';
import 'package:recipe_app/app/view/screens/splash/splash_screen.dart';
import 'route_path.dart';

class AppRouter {
  static final GoRouter initRoute = GoRouter(
      initialLocation: RoutePath.splashScreen.addBasePath,
      debugLogDiagnostics: true,
      navigatorKey: GlobalKey<NavigatorState>(),
      routes: [
        ///======================= Initial Route =======================
        GoRoute(
          name: RoutePath.splashScreen,
          path: RoutePath.splashScreen.addBasePath,
          pageBuilder: (context, state) => _buildPageWithAnimation(
            child:  SplashScreen(),
            state: state,
          ),
        ),


       ///======================= homeScreen=======================
        GoRoute(
          name: RoutePath.homeScreen,
          path: RoutePath.homeScreen.addBasePath,
          pageBuilder: (context, state) => _buildPageWithAnimation(
            child:   const HomeScreen(),
            state: state,
          ),
        ),

        ///======================= SearchScreen=======================
        GoRoute(
          name: RoutePath.searchScreen,
          path: RoutePath.searchScreen.addBasePath,
          pageBuilder: (context, state) => _buildPageWithAnimation(
            child:   SearchScreen(),
            state: state,

          ),
        ),


      ]);

  static CustomTransitionPage _buildPageWithAnimation(
      {required Widget child,
      required GoRouterState state,
      bool disableAnimation = false}) {
    if (disableAnimation) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionDuration: Duration.zero, // Disable animation
        transitionsBuilder: (_, __, ___, child) => child, // No transition
      );
    } else {
      return CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      );
    }
  }

  static GoRouter get route => initRoute;
}
