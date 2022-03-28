import 'package:meta/meta_meta.dart';

import 'package:responsive_annotation/models/screen_type.dart';

/// An annotation used to specify a variable to generate responsive code for.
@Target({TargetKind.field})
class ResponsiveVariable<T> {
  /// ResponsiveVariable<T> is used to annotate variables that are responsive.
  /// * [mobile] is the value applied for [ScreenType.mobile].
  /// * [tablet] is the value applied for [ScreenType.tablet].
  /// * [laptop] is the value applied for [ScreenType.laptop].
  /// * [desktop] is the value applied for [ScreenType.desktop].
  /// * [widescreen] is the value applied for [ScreenType.widescreen].
  ///
  /// Note that you can only provide simple types [T]
  /// or non parameterized default constructors as custom type [T].
  /// Parametrized and/or named constructors are not supported yet.
  const ResponsiveVariable({
    required this.mobile,
    required this.tablet,
    required this.laptop,
    required this.desktop,
    required this.widescreen,
  })  : type = T,
        assert(mobile != null),
        assert(tablet != null),
        assert(laptop != null),
        assert(desktop != null),
        assert(widescreen != null);

  final T mobile;
  final T tablet;
  final T laptop;
  final T desktop;
  final T widescreen;
  final Type type;
}
