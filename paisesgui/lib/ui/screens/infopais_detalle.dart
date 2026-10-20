import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';
import 'package:paisesgui/ui/widgets/my_weather_info.dart';

class InfoPaisDetalle extends StatelessWidget {
  InfoPaisDetalle({super.key});

  // Referencia al repositorio, de donde obtendremos la información del país
  final PaisesRepository _repository = PaisesRepository();

  @override
  Widget build(BuildContext context) {
    Pais pais = _repository.infoPais();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const MyWeatherInfo(),
              const SizedBox(height: 30),
              _fila(context, "Población", pais.poblacion ?? ""),
              _fila(context, "Latitud", "${pais.latitud}"),
              _fila(context, "Longitud", "${pais.longitud}"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fila(BuildContext context, String titulo, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titulo, style: Theme.of(context).textTheme.titleLarge),
          Text(valor, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}