import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff924c00),
      surfaceTint: Color(0xff924c00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffff8906),
      onPrimaryContainer: Color(0xff613000),
      secondary: Color(0xffac2c1f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffce4535),
      onSecondaryContainer: Color(0xfffffbff),
      tertiary: Color(0xffb70051),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffdb2869),
      onTertiaryContainer: Color(0xfffffbff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffdf8f9),
      onSurface: Color(0xff1c1b1c),
      onSurfaceVariant: Color(0xff46464c),
      outline: Color(0xff77767d),
      outlineVariant: Color(0xffc7c5cd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313031),
      inversePrimary: Color(0xffffb780),
      primaryFixed: Color(0xffffdcc4),
      onPrimaryFixed: Color(0xff2f1400),
      primaryFixedDim: Color(0xffffb780),
      onPrimaryFixedVariant: Color(0xff6f3800),
      secondaryFixed: Color(0xffffdad4),
      onSecondaryFixed: Color(0xff410000),
      secondaryFixedDim: Color(0xffffb4a8),
      onSecondaryFixedVariant: Color(0xff8d150c),
      tertiaryFixed: Color(0xffffd9df),
      onTertiaryFixed: Color(0xff3f0017),
      tertiaryFixedDim: Color(0xffffb1c1),
      onTertiaryFixedVariant: Color(0xff90003e),
      surfaceDim: Color(0xffddd9da),
      surfaceBright: Color(0xfffdf8f9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f2f3),
      surfaceContainer: Color(0xfff1eded),
      surfaceContainerHigh: Color(0xffebe7e8),
      surfaceContainerHighest: Color(0xffe5e1e2),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff572a00),
      surfaceTint: Color(0xff924c00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa85800),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff740000),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc33e2e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff71002f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffd01e62),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f9),
      onSurface: Color(0xff111112),
      onSurfaceVariant: Color(0xff35363b),
      outline: Color(0xff525258),
      outlineVariant: Color(0xff6d6c73),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313031),
      inversePrimary: Color(0xffffb780),
      primaryFixed: Color(0xffa85800),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff844400),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xffc33e2e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xffa12519),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffd01e62),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xffaa004b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c6c6),
      surfaceBright: Color(0xfffdf8f9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f2f3),
      surfaceContainer: Color(0xffebe7e8),
      surfaceContainerHigh: Color(0xffe0dcdc),
      surfaceContainerHighest: Color(0xffd4d1d1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff482200),
      surfaceTint: Color(0xff924c00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff733a00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff610000),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff91180e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5e0026),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff940040),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f9),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2b2c31),
      outlineVariant: Color(0xff49494f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313031),
      inversePrimary: Color(0xffffb780),
      primaryFixed: Color(0xff733a00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff512800),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff91180e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6d0000),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff940040),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6a002c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb8b9),
      surfaceBright: Color(0xfffdf8f9),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f0f0),
      surfaceContainer: Color(0xffe5e1e2),
      surfaceContainerHigh: Color(0xffd7d3d4),
      surfaceContainerHighest: Color(0xffc9c6c6),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb780),
      surfaceTint: Color(0xffffb780),
      onPrimary: Color(0xff4e2600),
      primaryContainer: Color(0xffff8906),
      onPrimaryContainer: Color(0xff613000),
      secondary: Color(0xffffb4a8),
      onSecondary: Color(0xff690000),
      secondaryContainer: Color(0xfff4604d),
      onSecondaryContainer: Color(0xff5a0000),
      tertiary: Color(0xffffb1c1),
      onTertiary: Color(0xff66002a),
      tertiaryContainer: Color(0xffff4c85),
      onTertiaryContainer: Color(0xff2a000d),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141314),
      onSurface: Color(0xffe5e1e2),
      onSurfaceVariant: Color(0xffc7c5cd),
      outline: Color(0xff919097),
      outlineVariant: Color(0xff46464c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e2),
      inversePrimary: Color(0xff924c00),
      primaryFixed: Color(0xffffdcc4),
      onPrimaryFixed: Color(0xff2f1400),
      primaryFixedDim: Color(0xffffb780),
      onPrimaryFixedVariant: Color(0xff6f3800),
      secondaryFixed: Color(0xffffdad4),
      onSecondaryFixed: Color(0xff410000),
      secondaryFixedDim: Color(0xffffb4a8),
      onSecondaryFixedVariant: Color(0xff8d150c),
      tertiaryFixed: Color(0xffffd9df),
      onTertiaryFixed: Color(0xff3f0017),
      tertiaryFixedDim: Color(0xffffb1c1),
      onTertiaryFixedVariant: Color(0xff90003e),
      surfaceDim: Color(0xff141314),
      surfaceBright: Color(0xff3a393a),
      surfaceContainerLowest: Color(0xff0e0e0f),
      surfaceContainerLow: Color(0xff1c1b1c),
      surfaceContainer: Color(0xff201f20),
      surfaceContainerHigh: Color(0xff2b2a2a),
      surfaceContainerHighest: Color(0xff353435),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd4b6),
      surfaceTint: Color(0xffffb780),
      onPrimary: Color(0xff3e1d00),
      primaryContainer: Color(0xffff8906),
      onPrimaryContainer: Color(0xff321600),
      secondary: Color(0xffffd2cb),
      onSecondary: Color(0xff540000),
      secondaryContainer: Color(0xfff4604d),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd1d9),
      onTertiary: Color(0xff520020),
      tertiaryContainer: Color(0xffff4c85),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141314),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdddbe3),
      outline: Color(0xffb2b1b8),
      outlineVariant: Color(0xff908f96),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e2),
      inversePrimary: Color(0xff713900),
      primaryFixed: Color(0xffffdcc4),
      onPrimaryFixed: Color(0xff200c00),
      primaryFixedDim: Color(0xffffb780),
      onPrimaryFixedVariant: Color(0xff572a00),
      secondaryFixed: Color(0xffffdad4),
      onSecondaryFixed: Color(0xff2d0000),
      secondaryFixedDim: Color(0xffffb4a8),
      onSecondaryFixedVariant: Color(0xff740000),
      tertiaryFixed: Color(0xffffd9df),
      onTertiaryFixed: Color(0xff2c000e),
      tertiaryFixedDim: Color(0xffffb1c1),
      onTertiaryFixedVariant: Color(0xff71002f),
      surfaceDim: Color(0xff141314),
      surfaceBright: Color(0xff454445),
      surfaceContainerLowest: Color(0xff080708),
      surfaceContainerLow: Color(0xff1e1d1e),
      surfaceContainer: Color(0xff282828),
      surfaceContainerHigh: Color(0xff333233),
      surfaceContainerHighest: Color(0xff3e3d3e),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffece2),
      surfaceTint: Color(0xffffb780),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffb276),
      onPrimaryContainer: Color(0xff170700),
      secondary: Color(0xffffece9),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffffaea2),
      onSecondaryContainer: Color(0xff220000),
      tertiary: Color(0xffffebed),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffabbd),
      onTertiaryContainer: Color(0xff210009),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff141314),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff1eff6),
      outlineVariant: Color(0xffc3c2c9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e2),
      inversePrimary: Color(0xff713900),
      primaryFixed: Color(0xffffdcc4),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffb780),
      onPrimaryFixedVariant: Color(0xff200c00),
      secondaryFixed: Color(0xffffdad4),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffffb4a8),
      onSecondaryFixedVariant: Color(0xff2d0000),
      tertiaryFixed: Color(0xffffd9df),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb1c1),
      onTertiaryFixedVariant: Color(0xff2c000e),
      surfaceDim: Color(0xff141314),
      surfaceBright: Color(0xff515050),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f20),
      surfaceContainer: Color(0xff313031),
      surfaceContainerHigh: Color(0xff3c3b3c),
      surfaceContainerHighest: Color(0xff484647),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
