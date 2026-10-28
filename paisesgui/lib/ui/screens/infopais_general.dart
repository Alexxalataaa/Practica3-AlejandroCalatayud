import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';
import 'package:paisesgui/ui/widgets/imagen_red.dart';

/* Pantalla InfoPaisGeneral: muestra la información general de un país:
   imagen, nombre, capital y descripción. */

class InfoPaisGeneral extends StatelessWidget {
  InfoPaisGeneral({super.key});

  // Referencia al repositorio, de donde obtendremos la información del país
  final PaisesRepository _repository = PaisesRepository();

  @override
  Widget build(BuildContext context) {
    // Recogemos el país del repositorio
    Pais pais = _repository.infoPais();

    return Scaffold(
      appBar: AppBar(title: Text(pais.nombre)),
      body: SafeArea(
        // Contenedor con scroll para no salirnos del espacio disponible
        // (por ejemplo, al girar el dispositivo)
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Imagen del país, obtenida de Internet
              ImagenRed(url: pais.imagen ?? "", alto: 220),
              const SizedBox(height: 16),
              // Nombre del país
              Text(
                pais.nombre,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 8),
              // Capital
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_city, size: 22),
                  const SizedBox(width: 8),
                  Text(
                    pais.capital ?? "",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Descripción
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  pais.descripcion ?? "",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
