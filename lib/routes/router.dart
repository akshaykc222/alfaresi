import 'package:alfaresi/presentation/navigation/bottom_navigation.dart';
import 'package:alfaresi/presentation/screens/marketing_screen.dart';
import 'package:alfaresi/presentation/screens/software_screen.dart';
import 'package:alfaresi/presentation/screens/partner_screen.dart';
import 'package:alfaresi/presentation/screens/service_screen.dart';
import 'package:alfaresi/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'home',
);

final homeShellRoute = StatefulShellRoute.indexedStack(
  parentNavigatorKey: rootNavigatorKey,
  builder: (context, state, navigationShell) {
    return BottomNavBarScreen(child: navigationShell);
  },
  branches: [
    StatefulShellBranch(
      navigatorKey: _homeNavigatorKey,
      routes: [
        GoRoute(
          path: GRouteMarketing.path,
          name: GRouteMarketing.name,
          builder: (context, state) => const MarketingScreen(),
          pageBuilder: GoTransitions.fadeUpwards.call,
        ),
        GoRoute(
          path: GRouteSoftware.path,
          name: GRouteSoftware.name,
          builder: (context, state) => const SoftwareScreen(),
          pageBuilder: GoTransitions.fadeUpwards.call,
        ),
        GoRoute(
          path: GRouteServices.path,
          name: GRouteServices.name,
          builder: (context, state) => const ServiceScreen(),
          pageBuilder: GoTransitions.fadeUpwards.call,
        ),
        GoRoute(
          path: GRoutePartner.path,
          name: GRoutePartner.name,
          builder: (context, state) => const PartnerScreen(),
          pageBuilder: GoTransitions.fadeUpwards.call,
        ),
      ],
    ),
  ],
);

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: GRouteSplash.path,
  routes: [
    GoRoute(
      path: GRouteSplash.path,
      builder: (context, state) => GRouteSplash().builder(context, state),
      pageBuilder: GoTransitions.fadeUpwards.call,
    ),
    GoRoute(
      path: GRouteOnboard.path,
      name: GRouteOnboard.name,
      builder: (context, state) => GRouteOnboard().builder(context, state),
      pageBuilder: GoTransitions.fadeUpwards.call,
    ),
    GoRoute(
      path: GRouteMerchantLogin.path,
      name: GRouteMerchantLogin.name,
      builder: (context, state) => GRouteMerchantLogin().builder(context, state),
      pageBuilder: GoTransitions.fadeUpwards.call,
    ),
    homeShellRoute,
  ],
);
