import 'package:flutter/material.dart';
import 'dart:math';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 19, 19, 19),
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.onSurface.withAlpha(128),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notificaciones'),
          BottomNavigationBarItem(icon: Icon(Icons.hub), label: 'Redes Sociales'),
          BottomNavigationBarItem(icon: Icon(Icons.how_to_reg), label: 'Inscripciones'),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Parte superior
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ONG HIJOS DE LOS HÉROES',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        color: theme.colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          image: AssetImage('assets/video_placeholder.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Center(
                        child: Icon(Icons.play_circle_outline, color: Colors.white, size: 64),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Parte inferior: hexágonos con diseño conectado
            Expanded(
              child: Center(
                child: Transform.translate(
                  offset: const Offset(0, -60),  // sube 40 pixeles hacia arriba
                child: SizedBox(
                  width: 420,
                  height: 440,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: const [
                      // Centro
                      Positioned(
                        left: 145,
                        top: 150,
                        child: HexagonButton(label: 'Patas de Honor', icon: Icons.pets, size: 130),
                      ),

                      // Izquierda arriba
                      Positioned(
                        left: 5,
                        top: 60,
                        child: HexagonButton(label: 'Memoria Histórica', icon: Icons.history_edu, size: 120),
                      ),
                      // Izquierda medio
                      Positioned(
                        left: 5,
                        top: 210,
                        child: HexagonButton(label: 'Plan 1100', icon: Icons.map, size: 120),
                      ),

                      // Derecha arriba
                      Positioned(
                        left: 295,
                        top: 60,
                        child: HexagonButton(label: 'Calendario', icon: Icons.calendar_today, size: 120),
                      ),
                      // Derecha medio
                      Positioned(
                        left: 295,
                        top: 210,
                        child: HexagonButton(label: 'Psicología', icon: Icons.psychology, size: 120),
                      ),

                      // Abajo izquierda
                      Positioned(
                        left: 80,
                        top: 340,
                        child: HexagonButton(label: 'IA', icon: Icons.smart_toy, size: 120),
                      ),
                      // Abajo derecha
                      Positioned(
                        left: 220,
                        top: 340,
                        child: HexagonButton(label: 'Cooperación', icon: Icons.public, size: 120),
                      ),
                    ],
                  ),
                )
              ),
            ),
            ),
        ],
        ),
      ),
    );
  }
}

// Hexágono con parámetros
class HexagonButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final double size;

  const HexagonButton({
    super.key,
    required this.label,
    required this.icon,
    this.size = 80,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          // Borde del hexágono
          CustomPaint(
            size: Size(size, size),
            painter: HexagonBorderPainter(
              color: const Color.fromARGB(255, 79, 94, 51),
              strokeWidth: 2,
            ),
          ),
          // Clip para dar forma de hexágono al área interactiva
          ClipPath(
            clipper: HexagonClipper(),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  debugPrint('Hexágono $label presionado');
                },
                splashColor: Colors.white24,
                highlightColor: Colors.white10,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, color: Colors.white, size: size * 0.5),
                      const SizedBox(height: 4),
                      Text(
                        label,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size * 0.12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// Hexágono clipper
class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double radius = size.width / 2;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    for (int i = 0; i < 6; i++) {
      // Rotamos el hexágono 90° (pi/2) hacia la derecha
      final angle = (pi / 3) * i + pi / 2;
      final x = centerX + radius * cos(angle);
      final y = centerY + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



class HexagonBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  HexagonBorderPainter({required this.color, this.strokeWidth = 2});

  @override
  void paint(Canvas canvas, Size size) {
    final path = HexagonClipper().getClip(size);
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

