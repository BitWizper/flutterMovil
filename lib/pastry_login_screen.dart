import 'package:flutter/material.dart';

class PastryLoginScreen extends StatelessWidget {
  const PastryLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2CDA0), // Color de la barra
        title: const Text(
          'Login Repostero',
          style: TextStyle(color: Color(0xFF3A3A3A)), // Color del texto en la barra
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3A3A3A)),
          onPressed: () {
            // Acción para regresar a la pantalla de login general
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // Fondo con formas decorativas
          Positioned.fill(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          ),
          // Contenido principal
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login Repostero",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3A3A3A), // Color del texto principal
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Correo",
                    labelStyle: TextStyle(color: Color(0xFFF2CDA0)), // Color de las etiquetas
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2CDA0)), // Borde del TextField
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2CDA0)), // Borde al enfocarse
                    ),
                  ),
                  style: TextStyle(color: Colors.black), // Color del texto ingresado
                ),
                const SizedBox(height: 10),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    labelStyle: TextStyle(color: Color(0xFFF2CDA0)), // Color de las etiquetas
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2CDA0)), // Borde del TextField
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2CDA0)), // Borde al enfocarse
                    ),
                  ),
                  style: TextStyle(color: Colors.black), // Color del texto ingresado
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Implementar recuperación de contraseña.
                  },
                  style: TextButton.styleFrom(foregroundColor: const Color(0xFFF2CDA0)), // Color del texto
                  child: const Text("¿Has olvidado tu contraseña?"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción de inicio de sesión del repostero
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD9805F), // Color del botón
                  ),
                  child: const Text(
                    "Iniciar sesión",
                    style: TextStyle(color: Colors.white), // Color del texto
                  ),
                ),
                const SizedBox(height: 20),
                // Texto para el registro de nuevos usuarios
                TextButton(
                  onPressed: () {
                    // Navegar a la pantalla de registro
                    Navigator.pushNamed(context, '/register'); // Asumiendo que la ruta '/register' está configurada
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFFF2CDA0), // Color del texto
                  ),
                  child: const Text("¿No tienes cuenta? Regístrate"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Clase para pintar el fondo decorativo
class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Forma superior izquierda (amarillo pastel)
    paint.color = const Color(0xFFFFF6D3); // Amarillo pastel
    var path = Path()
      ..moveTo(0, size.height * 0.2)
      ..quadraticBezierTo(
          size.width * 0.25, size.height * 0.1, size.width * 0.5, 0)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path, paint);

    // Forma inferior derecha (morado)
    paint.color = const Color(0xFFB538A4).withOpacity(0.5); // Morado con opacidad
    path = Path()
      ..moveTo(size.width, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.85,
          size.width * 0.5, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, paint);

    // Forma central superior derecha (rosado)
    paint.color = const Color(0xFFFFC1C1).withOpacity(0.5); // Rosado claro
    path = Path()
      ..moveTo(size.width * 0.7, 0)
      ..quadraticBezierTo(
          size.width * 0.85, size.height * 0.2, size.width, size.height * 0.1)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path, paint);

    // Forma central inferior izquierda (gris oscuro)
    paint.color = const Color(0xFFA9A9A9).withOpacity(0.5); // Gris oscuro
    path = Path()
      ..moveTo(0, size.height * 0.8)
      ..quadraticBezierTo(
          size.width * 0.2, size.height * 0.75, size.width * 0.3, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
