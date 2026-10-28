import 'package:flutter/material.dart';

/*
Tema personalizado de la aplicación.
Se define aparte para mantener el código de la aplicación más limpio,
y se aplica en el MaterialApp mediante la propiedad theme.
*/

ThemeData temaPaises = ThemeData(
  // Esquema de color generado a partir de un color semilla (Material 3)
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
  // Estilos de texto de la aplicación
  textTheme: const TextTheme(
    // Título principal (nombre del país)
    displayLarge: TextStyle(
      fontFamily: "LeckerliOne",
      fontSize: 36,
      fontWeight: FontWeight.w100,
    ),
    // Texto sobre las imágenes de los continentes
    displayMedium: TextStyle(
      fontWeight: FontWeight.w300,
      color: Colors.white,
      fontFamily: "LeckerliOne",
      fontSize: 40,
      shadows: [
        Shadow(offset: Offset(2, 2), color: Colors.black, blurRadius: 3),
      ],
    ),
    // Etiquetas y valores de los datos del país
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 18),
    bodyMedium: TextStyle(fontSize: 16, height: 1.4),
  ),
);
