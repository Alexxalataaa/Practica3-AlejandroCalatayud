import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';
import 'package:paisesgui/ui/widgets/imagen_red.dart';

/* Pantalla PaisesScreen: muestra la lista de países en forma de tarjetas */

class PaisesScreen extends StatelessWidget {
  PaisesScreen({super.key});

  // Referencia al repositorio, de donde obtendremos la lista de países
  final PaisesRepository _repository = PaisesRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Países")),
      body: SafeArea(
        // Proporcionamos a _creaListaPaises la lista de países de Europa
        child: _creaListaPaises(_repository.getPaises()),
      ),
    );
  }

  // Recibimos la lista de países y recorremos la lista con un ListView.builder,
  // generando un widget personalizado de tipo PaisCard para cada uno de ellos.
  Widget _creaListaPaises(List<Pais> paises) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: paises.length,
      itemBuilder: (context, index) {
        return PaisCard(
          imagen: paises[index].imagen ?? "",
          nombre: paises[index].nombre,
        );
      },
    );
  }
}

class PaisCard extends StatelessWidget {
  // Este widget recibirá dos argumentos con nombre para construirse:
  // la imagen (imagen) y el nombre del país (nombre)
  const PaisCard({
    super.key,
    required this.imagen,
    required this.nombre,
  });

  final String imagen;
  final String nombre;

  @override
  Widget build(BuildContext context) {
    // Tarjeta con la imagen del país (obtenida de Internet) y su nombre
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImagenRed(url: imagen, alto: 180),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              nombre,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ],
      ),
    );
  }
}
