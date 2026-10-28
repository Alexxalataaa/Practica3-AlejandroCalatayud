import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';
import 'package:paisesgui/ui/widgets/my_weather_info.dart';

/* Pantalla InfoPaisDetalle: muestra el tiempo en el país y sus datos
   detallados (población, latitud y longitud). */

class InfoPaisDetalle extends StatelessWidget {
  InfoPaisDetalle({super.key});

  // Referencia al repositorio, de donde obtendremos la información del país
  final PaisesRepository _repository = PaisesRepository();

  @override
  Widget build(BuildContext context) {
    Pais pais = _repository.infoPais();

    return Scaffold(
      appBar: AppBar(title: Text(pais.nombre)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Información sobre el tiempo en el país
              const MyWeatherInfo(),
              const SizedBox(height: 30),
              // Información del país, tabulada con Column y Row
              _fila(context, Icons.groups, "Población",
                  _formateaPoblacion(pais.poblacion)),
              _fila(context, Icons.swap_vert, "Latitud", "${pais.latitud}"),
              _fila(context, Icons.swap_horiz, "Longitud", "${pais.longitud}"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Cada fila muestra el nombre del dato a la izquierda y su valor a la derecha
  Widget _fila(
    BuildContext context,
    IconData icono,
    String titulo,
    String valor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icono, size: 24),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    titulo,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              valor,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }

  // Añade separadores de millares a la población (68000000 -> 68.000.000)
  String _formateaPoblacion(String? poblacion) {
    if (poblacion == null || poblacion.isEmpty) return "-";

    String resultado = "";
    for (int i = 0; i < poblacion.length; i++) {
      // Insertamos un punto cada tres dígitos empezando por la derecha
      if (i > 0 && (poblacion.length - i) % 3 == 0) resultado += ".";
      resultado += poblacion[i];
    }
    return "$resultado hab.";
  }
}
