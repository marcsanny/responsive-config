// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'package:responsive_config/generators/responsive_config_generator.dart';

/// Builder which generates responsive code for classes annotated with
/// `@ResponsiveConfig`.
Builder responsiveConfigBuilder(BuilderOptions options) => SharedPartBuilder(
      [ResponsiveConfigGenerator(options)],
      'responsive_config',
    );
