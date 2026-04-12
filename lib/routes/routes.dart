import 'package:alfaresi/presentation/screens/software_screen.dart';
import 'package:alfaresi/presentation/screens/onboarding_screen.dart';
import 'package:alfaresi/presentation/screens/partner_screen.dart';
import 'package:alfaresi/presentation/screens/service_screen.dart';
import 'package:alfaresi/presentation/screens/splash_screen.dart';
import 'package:alfaresi/presentation/screens/merchant_login_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract base class GRoute {
  Widget builder(BuildContext context, GoRouterState state);
  void nop() {}
}

final class GRouteSplash extends GRoute {
  static const String name = 'splash';
  static const String path = '/splash';
  void goNamed(BuildContext context) {
    context.goNamed(name);
  }

  @override
  Widget builder(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}

final class GRouteOnboard extends GRoute {
  static const String name = 'onboard';
  static const String path = '/onboard';
  void goNamed(BuildContext context) {
    context.goNamed(name);
  }

  @override
  Widget builder(BuildContext context, GoRouterState state) =>
      const OnboardingScreen();
}

final class GRouteMarketing extends GRoute {
  static const String name = 'marketing';
  static const String path = '/marketing';
  void goNamed(BuildContext context) {
    context.goNamed(name);
  }

  @override
  Widget builder(BuildContext context, GoRouterState state) =>
      const SoftwareScreen();
}

final class GRouteSoftware extends GRoute {
  static const String name = 'software';
  static const String path = '/software';
  void goNamed(BuildContext context) {
    context.goNamed(name);
  }

  @override
  Widget builder(BuildContext context, GoRouterState state) =>
      const SoftwareScreen();
}

final class GRouteServices extends GRoute {
  static const String name = 'services';
  static const String path = '/services';
  void goNamed(BuildContext context) {
    context.goNamed(name);
  }

  @override
  Widget builder(BuildContext context, GoRouterState state) =>
      const ServiceScreen();
}

final class GRoutePartner extends GRoute {
  static const String name = 'partner';
  static const String path = '/partner';
  void goNamed(BuildContext context) {
    context.goNamed(name);
  }

  @override
  Widget builder(BuildContext context, GoRouterState state) =>
      const PartnerScreen();
}

final class GRouteMerchantLogin extends GRoute {
  static const String name = 'merchant-login';
  static const String path = '/merchant-login';
  void goNamed(BuildContext context) {
    context.goNamed(name);
  }

  @override
  Widget builder(BuildContext context, GoRouterState state) =>
      const MerchantLoginScreen();
}
