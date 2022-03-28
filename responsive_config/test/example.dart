import 'package:flutter/material.dart';

import 'package:responsive_annotation/responsive_annotation.dart';

part 'example.g.dart';

@ResponsiveConfig(tabletBreakpoint: 400)
abstract class Example {
  const Example({
    this.margin = 16,
    this.customSample = const CustomClassDesktop(),
  });

  factory Example.of(BuildContext context) => _$ResponsiveExample.of(context);

  @ResponsiveVariable<double>(
    mobile: 16,
    tablet: 32,
    laptop: 48,
    desktop: 64,
    widescreen: 128,
  )
  final double margin;

  @ResponsiveVariable<CustomClass>(
    mobile: CustomClass.mobile(),
    tablet: CustomClass.tablet(),
    laptop: CustomClass(),
    desktop: CustomClassDesktop(),
    widescreen: CustomClass(),
  )
  final CustomClass customSample;
}

class CustomClass {
  const CustomClass();

  const CustomClass.mobile();
  const CustomClass.tablet();
}

class CustomClassDesktop extends CustomClass {
  const CustomClassDesktop();
}
