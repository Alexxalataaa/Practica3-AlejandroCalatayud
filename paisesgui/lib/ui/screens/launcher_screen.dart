import 'package:flutter/material.dart';
import 'package:paisesgui/ui/screens/continentes_screen.dart';
import 'package:paisesgui/ui/screens/infopais_detalle.dart';
import 'package:paisesgui/ui/screens/infopais_general.dart';
import 'package:paisesgui/ui/screens/paises_screen.dart';

/* Pantalla principal: nos permite navegar al resto de pantallas de la aplicación */

class LauncherScreen extends StatelessWidget {
  const LauncherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Países"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _boton(
                  context,
                  texto: "Pantalla Continentes",
                  destino: ContinentesScreen(),
                ),
                _boton(
                  context,
                  texto: "Pantalla Países",
                  destino: PaisesScreen(),
                ),
                _boton(
                  context,
                  texto: "Pantalla con información\ngeneral del país",
                  destino: InfoPaisGeneral(),
                ),
                _boton(
                  context,
                  texto: "Pantalla con información\ndetallada del país",
                  destino: InfoPaisDetalle(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Crea un botón que navega hasta la pantalla indicada en destino
  Widget _boton(
    BuildContext context, {
    required String texto,
    required Widget destino,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => destino,
            ),
          );
        },
        child: Text(texto, textAlign: TextAlign.center),
      ),
    );
  }
}
