import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:responsive_annotation/responsive_annotation.dart';
import 'package:source_gen/source_gen.dart';

class Variable {
  const Variable({
    required this.name,
    required this.type,
    required this.mobile,
    required this.tablet,
    required this.laptop,
    required this.desktop,
    required this.widescreen,
  });

  factory Variable.fromElement(FieldElement element) {
    const annotationChecker = TypeChecker.fromRuntime(ResponsiveVariable);
    final variableAnnotation = annotationChecker.firstAnnotationOf(element);

    dynamic type;
    dynamic mobile;
    dynamic tablet;
    dynamic laptop;
    dynamic desktop;
    dynamic widescreen;

    if (variableAnnotation != null) {
      final reader = ConstantReader(variableAnnotation);
      final mobileReader = reader.read('mobile');
      final tabletReader = reader.read('tablet');
      final laptopReader = reader.read('laptop');
      final desktopReader = reader.read('desktop');
      final widescreenReader = reader.read('widescreen');

      type = reader.read('type').typeValue;
      mobile = mobileReader.isLiteral
          ? mobileReader.literalValue
          : '${mobileReader.objectValue.type}()';
      tablet = tabletReader.isLiteral
          ? tabletReader.literalValue
          : '${tabletReader.objectValue.type}()';
      laptop = laptopReader.isLiteral
          ? laptopReader.literalValue
          : '${laptopReader.objectValue.type}()';
      desktop = desktopReader.isLiteral
          ? desktopReader.literalValue
          : '${desktopReader.objectValue.type}()';
      widescreen = widescreenReader.isLiteral
          ? widescreenReader.literalValue
          : '${widescreenReader.objectValue.type}()';
    }

    return Variable(
      name: element.name,
      type: type as DartType,
      mobile: mobile,
      tablet: tablet,
      laptop: laptop,
      desktop: desktop,
      widescreen: widescreen,
    );
  }

  final String name;
  final DartType type;
  final dynamic mobile;
  final dynamic tablet;
  final dynamic laptop;
  final dynamic desktop;
  final dynamic widescreen;
}
