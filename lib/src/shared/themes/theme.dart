import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff843c19),
      surfaceTint: Color(0xff944925),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb16039),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff7e5543),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffcfbc),
      onSecondaryContainer: Color(0xff5e3929),
      tertiary: Color(0xff832900),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc04000),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff221a17),
      onSurfaceVariant: Color(0xff54433c),
      outline: Color(0xff87736b),
      outlineVariant: Color(0xffdac1b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2b),
      inversePrimary: Color(0xffffb596),
      primaryFixed: Color(0xffffdbcd),
      onPrimaryFixed: Color(0xff360f00),
      primaryFixedDim: Color(0xffffb596),
      onPrimaryFixedVariant: Color(0xff76320f),
      secondaryFixed: Color(0xffffdbcd),
      onSecondaryFixed: Color(0xff301407),
      secondaryFixedDim: Color(0xfff0bba5),
      onSecondaryFixedVariant: Color(0xff633e2d),
      tertiaryFixed: Color(0xffffdbcf),
      onTertiaryFixed: Color(0xff380d00),
      tertiaryFixedDim: Color(0xffffb59b),
      onTertiaryFixedVariant: Color(0xff812800),
      surfaceDim: Color(0xffe7d7d1),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ec),
      surfaceContainer: Color(0xfffbeae5),
      surfaceContainerHigh: Color(0xfff5e5df),
      surfaceContainerHighest: Color(0xffefdfd9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff712f0c),
      surfaceTint: Color(0xff944925),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb16039),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff5e3a2a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff966a58),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff7b2600),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc04000),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff221a17),
      onSurfaceVariant: Color(0xff503f38),
      outline: Color(0xff6e5b53),
      outlineVariant: Color(0xff8b766e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2b),
      inversePrimary: Color(0xffffb596),
      primaryFixed: Color(0xffb05e38),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff914723),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff966a58),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff7b5241),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffcc490c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xffa53600),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe7d7d1),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ec),
      surfaceContainer: Color(0xfffbeae5),
      surfaceContainerHigh: Color(0xfff5e5df),
      surfaceContainerHighest: Color(0xffefdfd9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff411400),
      surfaceTint: Color(0xff944925),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff712f0c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff381a0c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5e3a2a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff431100),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7b2600),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff2f211b),
      outline: Color(0xff503f38),
      outlineVariant: Color(0xff503f38),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff382e2b),
      inversePrimary: Color(0xffffe7de),
      primaryFixed: Color(0xff712f0c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff521b00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5e3a2a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff442416),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff7b2600),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff551800),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffe7d7d1),
      surfaceBright: Color(0xfffff8f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff1ec),
      surfaceContainer: Color(0xfffbeae5),
      surfaceContainerHigh: Color(0xfff5e5df),
      surfaceContainerHighest: Color(0xffefdfd9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb596),
      surfaceTint: Color(0xffffb596),
      onPrimary: Color(0xff581e00),
      primaryContainer: Color(0xff954925),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xfff0bba5),
      onSecondary: Color(0xff492819),
      secondaryContainer: Color(0xff583525),
      onSecondaryContainer: Color(0xfffcc5af),
      tertiary: Color(0xffffb59b),
      onTertiary: Color(0xff5b1a00),
      tertiaryContainer: Color(0xffb13a00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff19120f),
      onSurface: Color(0xffefdfd9),
      onSurfaceVariant: Color(0xffdac1b8),
      outline: Color(0xffa28c84),
      outlineVariant: Color(0xff54433c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefdfd9),
      inversePrimary: Color(0xff944925),
      primaryFixed: Color(0xffffdbcd),
      onPrimaryFixed: Color(0xff360f00),
      primaryFixedDim: Color(0xffffb596),
      onPrimaryFixedVariant: Color(0xff76320f),
      secondaryFixed: Color(0xffffdbcd),
      onSecondaryFixed: Color(0xff301407),
      secondaryFixedDim: Color(0xfff0bba5),
      onSecondaryFixedVariant: Color(0xff633e2d),
      tertiaryFixed: Color(0xffffdbcf),
      onTertiaryFixed: Color(0xff380d00),
      tertiaryFixedDim: Color(0xffffb59b),
      onTertiaryFixedVariant: Color(0xff812800),
      surfaceDim: Color(0xff19120f),
      surfaceBright: Color(0xff413733),
      surfaceContainerLowest: Color(0xff140d0a),
      surfaceContainerLow: Color(0xff221a17),
      surfaceContainer: Color(0xff261e1a),
      surfaceContainerHigh: Color(0xff312825),
      surfaceContainerHighest: Color(0xff3c332f),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffbb9f),
      surfaceTint: Color(0xffffb596),
      onPrimary: Color(0xff2d0c00),
      primaryContainer: Color(0xffd27a51),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff5bfa9),
      onSecondary: Color(0xff290f03),
      secondaryContainer: Color(0xffb58672),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffbba3),
      onTertiary: Color(0xff2f0900),
      tertiaryContainer: Color(0xfff26329),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff19120f),
      onSurface: Color(0xfffff9f8),
      onSurfaceVariant: Color(0xffdfc6bc),
      outline: Color(0xffb59e95),
      outlineVariant: Color(0xff947f76),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefdfd9),
      inversePrimary: Color(0xff783411),
      primaryFixed: Color(0xffffdbcd),
      onPrimaryFixed: Color(0xff250800),
      primaryFixedDim: Color(0xffffb596),
      onPrimaryFixedVariant: Color(0xff612201),
      secondaryFixed: Color(0xffffdbcd),
      onSecondaryFixed: Color(0xff230901),
      secondaryFixedDim: Color(0xfff0bba5),
      onSecondaryFixedVariant: Color(0xff502d1e),
      tertiaryFixed: Color(0xffffdbcf),
      onTertiaryFixed: Color(0xff270600),
      tertiaryFixedDim: Color(0xffffb59b),
      onTertiaryFixedVariant: Color(0xff651e00),
      surfaceDim: Color(0xff19120f),
      surfaceBright: Color(0xff413733),
      surfaceContainerLowest: Color(0xff140d0a),
      surfaceContainerLow: Color(0xff221a17),
      surfaceContainer: Color(0xff261e1a),
      surfaceContainerHigh: Color(0xff312825),
      surfaceContainerHighest: Color(0xff3c332f),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9f8),
      surfaceTint: Color(0xffffb596),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffbb9f),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9f8),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xfff5bfa9),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9f8),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffbba3),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff19120f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9f8),
      outline: Color(0xffdfc6bc),
      outlineVariant: Color(0xffdfc6bc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffefdfd9),
      inversePrimary: Color(0xff4d1900),
      primaryFixed: Color(0xffffe1d5),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffbb9f),
      onPrimaryFixedVariant: Color(0xff2d0c00),
      secondaryFixed: Color(0xffffe1d5),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xfff5bfa9),
      onSecondaryFixedVariant: Color(0xff290f03),
      tertiaryFixed: Color(0xffffe0d7),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffbba3),
      onTertiaryFixedVariant: Color(0xff2f0900),
      surfaceDim: Color(0xff19120f),
      surfaceBright: Color(0xff413733),
      surfaceContainerLowest: Color(0xff140d0a),
      surfaceContainerLow: Color(0xff221a17),
      surfaceContainer: Color(0xff261e1a),
      surfaceContainerHigh: Color(0xff312825),
      surfaceContainerHighest: Color(0xff3c332f),
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
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
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
