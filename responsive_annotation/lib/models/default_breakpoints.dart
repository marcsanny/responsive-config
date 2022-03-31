/// Default breakpoints used by `responsive_config` library.
/// These values are used by default if they are
/// not provided to `@ResponsiveConfig` annotation or specified in `build.yaml`.
abstract class DefaultBreakpoints {
  /// Default breakpoint for mobile screens.
  static const double mobile = 320;

  /// Default breakpoint for tablet screens.
  static const double tablet = 768;

  /// Default breakpoint for laptop screens.
  static const double laptop = 992;

  /// Default breakpoint for desktop screens.
  static const double desktop = 1200;

  /// Default breakpoint for widescreen screens.
  static const double widescreen = 1920;
}
