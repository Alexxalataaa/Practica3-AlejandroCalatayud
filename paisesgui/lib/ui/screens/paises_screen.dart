import 'package:flutter/material.dart';
import 'package:paisesgui/data/repositories/paises_repository.dart';
import 'package:paisesgui/domain/entities/pais.dart';

class PaisesScreen extends StatelessWidget {
  PaisesScreen();

  // Referencia al repositorio, de donde obtendremos la lista de continentes
  final PaisesRepository _repository = PaisesRepository();


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: Center(
            child: _creaListaPaises(_repository.getPaises()),
          ),
        ),
      );
  }

    Widget _creaListaPaises(List<Pais> paises) {
    return ListView.builder(
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
    // TO-DO
    // Devuelve un widget de tipo Card, con el diseño que desees, pero
    // que muestre la imagen  (obtenida de Internet a partir de la url)
    // y el nombre del país.
        return Card(
      margin: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.network(
            imagen,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              nombre,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ],
      ),
    );
  }
}
