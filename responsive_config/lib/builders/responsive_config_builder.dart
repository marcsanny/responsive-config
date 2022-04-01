import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'package:responsive_config/generators/responsive_config_generator.dart';

/// Builder which generates responsive code for classes annotated with
/// `@ResponsiveConfig`.
Builder responsiveConfigBuilder(BuilderOptions options) => SharedPartBuilder(
      [ResponsiveConfigGenerator(options)],
      'responsive_config',
    );