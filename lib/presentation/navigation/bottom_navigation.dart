import 'dart:io';

import 'package:alfaresi/config/themes/app_colors.dart';
import 'package:alfaresi/routes/routes.dart';
import 'package:alfaresi/config/constants/app_assets.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key, required this.child});
  final Widget child;

  @override
  BottomNavBarScreenState createState() => BottomNavBarScreenState();
}

class BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;
  bool isNeedOverHeight = false;
  String device = '';
  @override
  void initState() {
    _initDeviceCheck();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentIndex = _getCurrentIndex();
  }

  Future<void> _initDeviceCheck() async {
    final result = await isS25Series();
    setState(() {
      isNeedOverHeight = result;
    });
  }

  Future<bool> isS25Series() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      return false;
    }

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      final model = (androidInfo.model).toLowerCase();
      final deviceName = (androidInfo.name).toLowerCase();

      if (model.contains('sm-s92') || deviceName.contains('s25')) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CurvedNavigationBar(
        height: isNeedOverHeight ? 100 : 75,
        backgroundColor: AppColors.transparent,
        index: _currentIndex,
        items:
            _destinations.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isActive = index == _currentIndex;

              return Image.asset(
                isActive ? item.selectedIcon : item.icon,
                height: 25,
                width: 24,
              );
            }).toList(),
        onTap: _onDestinationSelected,
      ),
    );
  }

  List<_NavigationDestination> get _destinations => [
    const _NavigationDestination(
      'Software',
      AppAssets.softwareUnselected,
      AppAssets.softwareSelected,
    ),
    const _NavigationDestination(
      'Marketing',
      AppAssets.marketingUnselected,
      AppAssets.marketingSelected,
    ),
    const _NavigationDestination(
      'Services',
      AppAssets.serviceUnSelected,
      AppAssets.serviceSelected,
    ),
    const _NavigationDestination(
      'Partner',
      AppAssets.partnerUnSelected,
      AppAssets.partnerSelected,
    ),
  ];

  // This method gets the index based on the current route path
  int _getCurrentIndex() {
    final path = GoRouterState.of(context).uri.path;
    final routes = [
      GRouteSoftware.path,
      GRouteMarketing.path,

      GRouteServices.path,
      GRoutePartner.path,
    ];
    final index = routes.indexOf(path);
    return index == -1 ? 0 : index; // Default to index 0 if path not found
  }

  // Handles tapping on a navigation item
  void _onDestinationSelected(int index) {
    if (_currentIndex == index)
      return; // No need to update if it's already selected

    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 1:
        context.go(GRouteMarketing.path);
        break;
      case 0:
        context.go(GRouteSoftware.path);
        break;
      case 2:
        context.go(GRouteServices.path);
        break;
      case 3:
        context.go(GRoutePartner.path);
        break;
    }
  }
}

class _NavigationDestination {
  const _NavigationDestination(this.label, this.icon, this.selectedIcon);
  final String label;
  final String icon;
  final String selectedIcon;
}
