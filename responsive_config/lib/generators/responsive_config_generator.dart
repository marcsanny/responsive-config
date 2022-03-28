import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:responsive_annotation/annotations/responsive_config.dart';
import 'package:source_gen/source_gen.dart';

import 'package:responsive_config/domain/class.dart';
import 'package:responsive_config/templates/responsive_generator_template.dart';

class ResponsiveConfigGenerator
    extends GeneratorForAnnotation<ResponsiveConfig> {
  ResponsiveConfigGenerator(this.options);

  final BuilderOptions options;

  @override
  dynamic generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Could not generate for non-class $element',
      );
    }
    final subject = Class.fromElement(element);
    final config = ResponsiveConfig.fromJson(options.config);
    return ResponsiveGeneratorTemplate(subject, config).generate();
  }
}
