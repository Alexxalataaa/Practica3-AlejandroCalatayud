import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:paisesgui/themes/tema_paises.dart';
import 'package:paisesgui/ui/screens/continentes_screen.dart';
import 'package:paisesgui/ui/screens/infopais_detalle.dart';
import 'package:paisesgui/ui/screens/infopais_general.dart';
import 'package:paisesgui/ui/screens/launcher_screen.dart';
import 'package:paisesgui/ui/screens/paises_screen.dart';

/*
Comprueba que todas las pantallas se dibujan sin salirse del espacio
disponible, tanto en vertical como en horizontal y en pantallas grandes.
*/

void main() {
  final pantallas = <String, Widget Function()>{
    'LauncherScreen': () => const LauncherScreen(),
    'ContinentesScreen': () => ContinentesScreen(),
    'PaisesScreen': () => PaisesScreen(),
    'InfoPaisGeneral': () => InfoPaisGeneral(),
    'InfoPaisDetalle': () => InfoPaisDetalle(),
  };

  final tamanyos = <Size>[
    const Size(320, 568), // móvil pequeño
    const Size(360, 640), // móvil, vertical
    const Size(640, 360), // móvil, horizontal
    const Size(1200, 800), // escritorio
  ];

  for (final tamanyo in tamanyos) {
    pantallas.forEach((nombre, creaPantalla) {
      testWidgets(
        '$nombre se dibuja sin desbordar en '
        '${tamanyo.width.toInt()}x${tamanyo.height.toInt()}',
        (tester) async {
          await tester.binding.setSurfaceSize(tamanyo);
          await tester.pumpWidget(
            MaterialApp(theme: temaPaises, home: creaPantalla()),
          );
          await tester.pump();
          expect(tester.takeException(), isNull);
        },
      );
    });
  }
}
