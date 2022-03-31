import 'package:flutter/material.dart';

import 'package:responsive_annotation/responsive_annotation.dart';

part 'example.g.dart';

@ResponsiveConfig(tabletBreakpoint: 700)
abstract class AppConfig {
  const AppConfig({
    required this.margin,
    required this.title,
    required this.customSample,
  });

  factory AppConfig.of(BuildContext context) =>
      _$ResponsiveAppConfig.of(context);

  @ResponsiveVariable<double>(
    mobile: 16,
    tablet: 32,
    laptop: 48,
    desktop: 64,
    widescreen: 128,
  )
  final double margin;

  @ResponsiveVariable<String>(
    mobile: 'Mobile',
    tablet: 'Tablet',
    laptop: 'Laptop',
    desktop: 'Desktop',
    widescreen: 'Widescreen',
  )
  final String title;

  @ResponsiveVariable<CustomClass>(
    mobile: CustomClassMobile(),
    tablet: CustomClass(),
    laptop: CustomClassLaptop(),
    desktop: CustomClass(),
    widescreen: CustomClassWidescreen(),
  )
  final CustomClass customSample;

  // No code will be generated for static or non final variables.
  @ResponsiveVariable()
  static const double commonSpacing = 24;
}

class CustomClass {
  const CustomClass();
}

class CustomClassMobile extends CustomClass {
  const CustomClassMobile();
}

class CustomClassLaptop extends CustomClass {
  const CustomClassLaptop();
}

class CustomClassWidescreen extends CustomClass {
  const CustomClassWidescreen();
}
