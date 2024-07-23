import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4286856217),
      surfaceTint: Color(4287908133),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289814585),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4286469443),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294954940),
      onSecondaryContainer: Color(4284365097),
      tertiary: Color(4286785792),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290789376),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965494),
      onSurface: Color(4280424983),
      onSurfaceVariant: Color(4283712316),
      outline: Color(4287066987),
      outlineVariant: Color(4292526520),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871915),
      inversePrimary: Color(4294948246),
      primaryFixed: Color(4294958029),
      onPrimaryFixed: Color(4281732864),
      primaryFixedDim: Color(4294948246),
      onPrimaryFixedVariant: Color(4285936143),
      secondaryFixed: Color(4294958029),
      onSecondaryFixed: Color(4281340935),
      secondaryFixedDim: Color(4293966757),
      onSecondaryFixedVariant: Color(4284694061),
      tertiaryFixed: Color(4294958031),
      onTertiaryFixed: Color(4281863424),
      tertiaryFixedDim: Color(4294948251),
      onTertiaryFixedVariant: Color(4286654464),
      surfaceDim: Color(4293384145),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963692),
      surfaceContainer: Color(4294699749),
      surfaceContainerHigh: Color(4294305247),
      surfaceContainerHighest: Color(4293910489),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4285607692),
      surfaceTint: Color(4287908133),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289814585),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284365354),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4288047704),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4286260736),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290789376),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4280424983),
      onSurfaceVariant: Color(4283449144),
      outline: Color(4285422419),
      outlineVariant: Color(4287329902),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871915),
      inversePrimary: Color(4294948246),
      primaryFixed: Color(4289748536),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4287711011),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4288047704),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4286272065),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4291578124),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4289017344),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293384145),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963692),
      surfaceContainer: Color(4294699749),
      surfaceContainerHigh: Color(4294305247),
      surfaceContainerHighest: Color(4293910489),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282455040),
      surfaceTint: Color(4287908133),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285607692),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281866764),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284365354),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282585344),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4286260736),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281278747),
      outline: Color(4283449144),
      outlineVariant: Color(4283449144),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281871915),
      inversePrimary: Color(4294961118),
      primaryFixed: Color(4285607692),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283570944),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284365354),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282655766),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4286260736),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283766784),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293384145),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963692),
      surfaceContainer: Color(4294699749),
      surfaceContainerHigh: Color(4294305247),
      surfaceContainerHighest: Color(4293910489),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294948246),
      surfaceTint: Color(4294948246),
      onPrimary: Color(4283964928),
      primaryContainer: Color(4287973669),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4293966757),
      onSecondary: Color(4282984473),
      secondaryContainer: Color(4283970853),
      onSecondaryContainer: Color(4294755759),
      tertiary: Color(4294948251),
      onTertiary: Color(4284160512),
      tertiaryContainer: Color(4289804800),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279833103),
      onSurface: Color(4293910489),
      onSurfaceVariant: Color(4292526520),
      outline: Color(4288842884),
      outlineVariant: Color(4283712316),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293910489),
      inversePrimary: Color(4287908133),
      primaryFixed: Color(4294958029),
      onPrimaryFixed: Color(4281732864),
      primaryFixedDim: Color(4294948246),
      onPrimaryFixedVariant: Color(4285936143),
      secondaryFixed: Color(4294958029),
      onSecondaryFixed: Color(4281340935),
      secondaryFixedDim: Color(4293966757),
      onSecondaryFixedVariant: Color(4284694061),
      tertiaryFixed: Color(4294958031),
      onTertiaryFixed: Color(4281863424),
      tertiaryFixedDim: Color(4294948251),
      onTertiaryFixedVariant: Color(4286654464),
      surfaceDim: Color(4279833103),
      surfaceBright: Color(4282464051),
      surfaceContainerLowest: Color(4279504138),
      surfaceContainerLow: Color(4280424983),
      surfaceContainer: Color(4280688154),
      surfaceContainerHigh: Color(4281411621),
      surfaceContainerHighest: Color(4282135343),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294949791),
      surfaceTint: Color(4294948246),
      onPrimary: Color(4281142272),
      primaryContainer: Color(4291983953),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294295465),
      onSecondary: Color(4280880899),
      secondaryContainer: Color(4290086514),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294949795),
      onTertiary: Color(4281272576),
      tertiaryContainer: Color(4294075177),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279833103),
      onSurface: Color(4294965752),
      onSurfaceVariant: Color(4292855484),
      outline: Color(4290092693),
      outlineVariant: Color(4287922038),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293910489),
      inversePrimary: Color(4286067729),
      primaryFixed: Color(4294958029),
      onPrimaryFixed: Color(4280616960),
      primaryFixedDim: Color(4294948246),
      onPrimaryFixedVariant: Color(4284555777),
      secondaryFixed: Color(4294958029),
      onSecondaryFixed: Color(4280486145),
      secondaryFixedDim: Color(4293966757),
      onSecondaryFixedVariant: Color(4283444510),
      tertiaryFixed: Color(4294958031),
      onTertiaryFixed: Color(4280747520),
      tertiaryFixedDim: Color(4294948251),
      onTertiaryFixedVariant: Color(4284816896),
      surfaceDim: Color(4279833103),
      surfaceBright: Color(4282464051),
      surfaceContainerLowest: Color(4279504138),
      surfaceContainerLow: Color(4280424983),
      surfaceContainer: Color(4280688154),
      surfaceContainerHigh: Color(4281411621),
      surfaceContainerHighest: Color(4282135343),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965752),
      surfaceTint: Color(4294948246),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294949791),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965752),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4294295465),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965752),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294949795),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279833103),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965752),
      outline: Color(4292855484),
      outlineVariant: Color(4292855484),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293910489),
      inversePrimary: Color(4283242752),
      primaryFixed: Color(4294959573),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294949791),
      onPrimaryFixedVariant: Color(4281142272),
      secondaryFixed: Color(4294959573),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4294295465),
      onSecondaryFixedVariant: Color(4280880899),
      tertiaryFixed: Color(4294959319),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294949795),
      onTertiaryFixedVariant: Color(4281272576),
      surfaceDim: Color(4279833103),
      surfaceBright: Color(4282464051),
      surfaceContainerLowest: Color(4279504138),
      surfaceContainerLow: Color(4280424983),
      surfaceContainer: Color(4280688154),
      surfaceContainerHigh: Color(4281411621),
      surfaceContainerHighest: Color(4282135343),
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
