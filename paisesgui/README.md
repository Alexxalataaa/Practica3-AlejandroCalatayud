# paisesgui

Práctica 3 de la Unidad 3 (Widgets) de Programación Multimedia y Dispositivos Móviles.

Aplicación Flutter que muestra información sobre continentes y países a partir de
unos datos de ejemplo, practicando el uso de widgets, contenedores, recursos
(imágenes y tipografías) y temas.

## Estructura

- `lib/main.dart`: punto de entrada, define el `MaterialApp` y aplica el tema.
- `lib/themes/tema_paises.dart`: tema personalizado (esquema de color y estilos de texto).
- `lib/domain/entities/`: entidades `Pais` y `Continente`.
- `lib/data/services/paises_ejemplo.dart`: datos estáticos de ejemplo.
- `lib/data/repositories/paises_repository.dart`: repositorio que abstrae el acceso a los datos.
- `lib/ui/screens/`: pantallas de la aplicación.
  - `launcher_screen.dart`: menú principal de navegación.
  - `continentes_screen.dart`: continentes mostrados con `CircleAvatar`.
  - `paises_screen.dart`: lista de países con `ListView.builder` y `Card`.
  - `infopais_general.dart`: imagen, nombre, capital y descripción del país.
  - `infopais_detalle.dart`: tiempo, población, latitud y longitud del país.
- `lib/ui/widgets/`: widgets reutilizables (`MyWeatherInfo`, `ImagenRed`).

## Ejecución

```bash
flutter pub get
flutter run
```
