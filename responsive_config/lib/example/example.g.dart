// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// ResponsiveConfigGenerator
// **************************************************************************

abstract class _$ResponsiveAppConfig {
  static AppConfig of(BuildContext context) {
    final screenType = _getScreenType(context);
    switch (screenType) {
      case ScreenType.mobile:
        return _$MobileAppConfig();
      case ScreenType.tablet:
        return _$TabletAppConfig();
      case ScreenType.laptop:
        return _$LaptopAppConfig();
      case ScreenType.desktop:
        return _$DesktopAppConfig();
      case ScreenType.widescreen:
        return _$WidescreenAppConfig();
    }
  }

  static ScreenType _getScreenType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1920.0) {
      return ScreenType.widescreen;
    } else if (width >= 1000.0) {
      return ScreenType.desktop;
    } else if (width >= 992.0) {
      return ScreenType.laptop;
    } else if (width >= 700.0) {
      return ScreenType.tablet;
    } else {
      return ScreenType.mobile;
    }
  }
}

class _$MobileAppConfig implements AppConfig {
  @override
  final double margin = 16.0;
  @override
  final String title = 'Mobile';
  @override
  final CustomClass customSample = CustomClassMobile();
}

class _$TabletAppConfig implements AppConfig {
  @override
  final double margin = 32.0;
  @override
  final String title = 'Tablet';
  @override
  final CustomClass customSample = CustomClass();
}

class _$LaptopAppConfig implements AppConfig {
  @override
  final double margin = 48.0;
  @override
  final String title = 'Laptop';
  @override
  final CustomClass customSample = CustomClassLaptop();
}

class _$DesktopAppConfig implements AppConfig {
  @override
  final double margin = 64.0;
  @override
  final String title = 'Desktop';
  @override
  final CustomClass customSample = CustomClass();
}

class _$WidescreenAppConfig implements AppConfig {
  @override
  final double margin = 128.0;
  @override
  final String title = 'Widescreen';
  @override
  final CustomClass customSample = CustomClassWidescreen();
}
