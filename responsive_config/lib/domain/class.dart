import 'package:analyzer/dart/element/element.dart';
import 'package:responsive_annotation/responsive_annotation.dart';
import 'package:source_gen/source_gen.dart';

import 'package:responsive_config/domain/variable.dart';

class Class {
  const Class({
    required this.name,
    required this.desktopBreakpoint,
    required this.tabletBreakpoint,
    required this.laptopBreakpoint,
    required this.mobileBreakpoint,
    required this.widescreenBreakpoint,
    required this.variables,
  });

  factory Class.fromElement(ClassElement element) {
    final name = element.name;

    const annotationChecker = TypeChecker.fromRuntime(ResponsiveConfig);
    final configAnnotation = annotationChecker.firstAnnotationOf(element);

    final reader = ConstantReader(configAnnotation);
    final desktopReader = reader.read('desktopBreakpoint');
    final tabletReader = reader.read('tabletBreakpoint');
    final laptopReader = reader.read('laptopBreakpoint');
    final mobileReader = reader.read('mobileBreakpoint');
    final widescreenReader = reader.read('widescreenBreakpoint');

    final desktopBreakpoint = desktopReader.isNull
        ? DefaultBreakpoints.desktop
        : desktopReader.doubleValue;
    final tabletBreakpoint = tabletReader.isNull
        ? DefaultBreakpoints.tablet
        : tabletReader.doubleValue;
    final laptopBreakpoint = laptopReader.isNull
        ? DefaultBreakpoints.laptop
        : laptopReader.doubleValue;
    final mobileBreakpoint = mobileReader.isNull
        ? DefaultBreakpoints.mobile
        : mobileReader.doubleValue;
    final widescreenBreakpoint = widescreenReader.isNull
        ? DefaultBreakpoints.widescreen
        : widescreenReader.doubleValue;

    Iterable<Variable> variables() sync* {
      for (final fieldElement in element.fields) {
        if (fieldElement.isStatic || !fieldElement.isFinal) continue;
        yield Variable.fromElement(fieldElement);
      }
    }

    return Class(
      name: name,
      desktopBreakpoint: desktopBreakpoint,
      tabletBreakpoint: tabletBreakpoint,
      laptopBreakpoint: laptopBreakpoint,
      mobileBreakpoint: mobileBreakpoint,
      widescreenBreakpoint: widescreenBreakpoint,
      variables: variables(),
    );
  }

  final String name;
  final double desktopBreakpoint;
  final double tabletBreakpoint;
  final double laptopBreakpoint;
  final double mobileBreakpoint;
  final double widescreenBreakpoint;
  final Iterable<Variable> variables;
}
