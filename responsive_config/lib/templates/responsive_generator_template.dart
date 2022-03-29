import 'package:responsive_annotation/responsive_annotation.dart';

import 'package:responsive_config/domain/class.dart';
import 'package:responsive_config/domain/variable.dart';

class ResponsiveGeneratorTemplate {
  const ResponsiveGeneratorTemplate(
    this.subject,
    this.config,
  );

  final Class subject;
  final ResponsiveConfig? config;

  String generate() {
    final className = subject.name;

    final tabletBreakpoint =
        config?.tabletBreakpoint ?? subject.tabletBreakpoint;
    final laptopBreakpoint =
        config?.laptopBreakpoint ?? subject.laptopBreakpoint;
    final desktopBreakpoint =
        config?.desktopBreakpoint ?? subject.desktopBreakpoint;
    final widescreenBreakpoint =
        config?.widescreenBreakpoint ?? subject.widescreenBreakpoint;

    final mobileClassName = '_\$Mobile$className';
    final tabletClassName = '_\$Tablet$className';
    final laptopClassName = '_\$Laptop$className';
    final desktopClassName = '_\$Desktop$className';
    final widescreenClassName = '_\$Widescreen$className';

    final variables = subject.variables;

    return '''
abstract class _\$Responsive$className {
  static $className of(BuildContext context) {
    final screenType = _getScreenType(context);
    switch (screenType) {
      case ScreenType.mobile:
        return $mobileClassName();
      case ScreenType.tablet:
        return $tabletClassName();
      case ScreenType.laptop:
        return $laptopClassName();
      case ScreenType.desktop:
        return $desktopClassName();
      case ScreenType.widescreen:
        return $widescreenClassName();
    }
  }

  static ScreenType _getScreenType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= $widescreenBreakpoint) {
      return ScreenType.widescreen;
    } else if (width >= $desktopBreakpoint) {
      return ScreenType.desktop;
    } else if (width >= $laptopBreakpoint) {
      return ScreenType.laptop;
    } else if (width >= $tabletBreakpoint) {
      return ScreenType.tablet;
    } else {
      return ScreenType.mobile;
    }
  }
}

class $mobileClassName implements $className {
  ${variables.formatSyntax(ScreenType.mobile).join('\n')}
}

class $tabletClassName implements $className {
  ${variables.formatSyntax(ScreenType.tablet).join('\n')}
}

class $laptopClassName implements $className {
  ${variables.formatSyntax(ScreenType.laptop).join('\n')}
}

class $desktopClassName implements $className {
  ${variables.formatSyntax(ScreenType.desktop).join('\n')}
}

class $widescreenClassName implements $className {
  ${variables.formatSyntax(ScreenType.widescreen).join('\n')}
}
''';
  }
}

extension _OutputVariablesFor on Iterable<Variable> {
  Iterable<String> formatSyntax(ScreenType screenType) => map((variable) =>
      '@override\nfinal ${variable.type} ${variable.name} = ${variable.valueForScreenType(screenType)}');
}

extension _ValueForScreenTypeExtension on Variable {
  String valueForScreenType(ScreenType screenType) {
    dynamic value;
    switch (screenType) {
      case ScreenType.mobile:
        value = mobile;
        break;
      case ScreenType.tablet:
        value = tablet;
        break;
      case ScreenType.laptop:
        value = laptop;
        break;
      case ScreenType.desktop:
        value = desktop;
        break;
      case ScreenType.widescreen:
        value = widescreen;
        break;
    }

    // For String variables apostrophes should be added.
    return '$type' == 'String' ? '\'$value\';' : '$value;';
  }
}
