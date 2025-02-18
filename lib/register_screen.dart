import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con formas decorativas
          Positioned.fill(
            child: CustomPaint(
              painter: RegisterBackgroundPainter(),
            ),
          ),
          // Contenido principal
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF2EA7E), // Color amarillo claro
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Correo",
                    labelStyle: TextStyle(color: Color(0xFFF2CDA0)), // Etiqueta color suave
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2CDA0)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2CDA0)),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                const TextField(
                  decoration: InputDecoration(
                    labelText: "Usuario",
                    labelStyle: TextStyle(color: Color(0xFFF2CDA0)), // Etiqueta color suave
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2CDA0)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2CDA0)),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    labelStyle: TextStyle(color: Color(0xFFF2CDA0)), // Etiqueta color suave
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2CDA0)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2CDA0)),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Repite contraseña",
                    labelStyle: TextStyle(color: Color(0xFFF2CDA0)), // Etiqueta color suave
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2CDA0)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFF2CDA0)),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Acción de registro
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD9805F), // Color cálido para el botón
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Crear Cuenta"),
                ),
                const Divider(height: 30, thickness: 1),
                TextButton(
                  onPressed: () {
                    _showLoginDialog(context);
                  },
                  child: const Text(
                    "¿Ya tienes una cuenta? Inicia sesión",
                    style: TextStyle(
                      color: Color(0xFFF2EA7E), // Color amarillo claro para el texto
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método para mostrar el diálogo
  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("¿Ya tienes cuenta?"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Cierra el diálogo
                  Navigator.pushNamed(context, '/login'); // Navega a la pantalla de login
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD9805F),
                ),
                child: const Text("Sí"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Cierra el diálogo
                  _showInfoPopup(context); // Muestra la información adicional
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD9805F),
                ),
                child: const Text("No"),
              ),
            ],
          ),
        );
      },
    );
  }

  // Método para mostrar la pequeña pestaña con información adicional
  void _showInfoPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
            "Aquí puedes registrarte para crear una cuenta.",
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el popup
              },
              child: const Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }
}

// Clase para pintar el fondo decorativo
class RegisterBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Forma superior izquierda (amarillo claro)
    paint.color = const Color(0xFFF2EA7E).withOpacity(0.5);
    var path = Path()
      ..moveTo(0, size.height * 0.25)
      ..quadraticBezierTo(
          size.width * 0.2, size.height * 0.1, size.width * 0.4, 0)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path, paint);

    // Forma inferior derecha (naranja)
    paint.color = const Color(0xFFD9805F).withOpacity(0.5);
    path = Path()
      ..moveTo(size.width, size.height * 0.8)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.9,
          size.width * 0.5, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, paint);

    // Forma central inferior izquierda (morado claro)
    paint.color = const Color(0xFFA385D9).withOpacity(0.5);
    path = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.2, size.height * 0.8,
          size.width * 0.4, size.height * 0.6)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
