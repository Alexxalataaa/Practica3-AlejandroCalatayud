import 'package:flutter/material.dart';

/*
Widget personalizado que muestra una imagen obtenida de Internet,
indicando un progreso mientras se descarga y un icono de aviso
si no se ha podido cargar (por ejemplo, si no hay conexión).
*/

class ImagenRed extends StatelessWidget {
  const ImagenRed({
    required this.url,
    this.alto,
    this.ancho = double.infinity,
    super.key,
  });

  final String url;
  final double? alto;
  final double ancho;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: alto,
      width: ancho,
      fit: BoxFit.cover,
      // Mientras se descarga la imagen mostramos un indicador de progreso
      loadingBuilder: (context, child, progreso) {
        if (progreso == null) return child;
        return _marco(
          context,
          const CircularProgressIndicator(),
        );
      },
      // Si la imagen no se puede cargar, mostramos un icono de aviso
      errorBuilder: (context, error, stackTrace) {
        return _marco(
          context,
          const Icon(Icons.image_not_supported_outlined, size: 48),
        );
      },
    );
  }

  // Contenedor con el mismo tamaño que la imagen, para que la
  // interfaz no cambie de tamaño mientras ésta se carga o falla
  Widget _marco(BuildContext context, Widget hijo) {
    return Container(
      height: alto,
      width: ancho,
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      alignment: Alignment.center,
      child: hijo,
    );
  }
}
