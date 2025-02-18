import 'package:borcelle/login_screen.dart';
import 'package:borcelle/register_screen.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Borcelle',
    theme: ThemeData(
      primarySwatch: Colors.pink,
    ),
    initialRoute: '/home', // Establece la ruta inicial
    routes: {
      '/login': (context) => const LoginScreen(),
      '/register': (context) => const RegisterScreen(),
      '/home': (context) => const HomePage(), // Agregamos la ruta del Home
    },
  );
}
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  int _currentSlide = 0;

  final List<String> offers = [
    'assets/offer1.jpg',
    'assets/offer2.jpg',
    'assets/offer3.jpg',
  ];

  final List<Map<String, String>> categories = [
    {'icon': 'assets/fotodeiconos/iconodebabyshower.png', 'label': 'Baby Shower'},
    {'icon': 'assets/fotodeiconos/iconodequinceaños.jpg', 'label' : 'XV Años'},
    {'icon': 'assets/fotodeiconos/iconodecumpleaños.jpg', 'label': 'Cumpleaños'},
    {'icon': 'assets/fotodeiconos/iconodeboda.jpg', 'label': 'Bodas'},
    {'icon': 'assets/fotodeiconos/iconodebautizo.png', 'label': 'Bautizos'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Ajusta la altura del AppBar
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFF8D68E), // Color del contorno
              width: 2.0, // Ancho del contorno
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.pink[200],
            automaticallyImplyLeading: true, // Habilita el botón de menú automáticamente
            title: Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildCatalog(),
          _buildCatalog(), // Catálogo en Pasteles
          _buildCatalog(), // Catálogo en Reposteros
          Container(), // Crear pastel (pendiente de contenido)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: 'Pasteles'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Reposteros'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Crear Pastel'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Mi cuenta'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
  leading: const Icon(Icons.exit_to_app),
  title: const Text('Cerrar sesión'),
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmar"),
          content: const Text("¿Seguro que quieres cerrar sesión?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo sin hacer nada
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()), // Redirige a login
                );
              },
              child: const Text("Sí"),
            ),
          ],
        );
      },
    );
  },
),

            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Mis pedidos'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Centro de ayuda'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuración'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCatalog() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // PageView en lugar del Carousel
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: offers.length,
              onPageChanged: (index) {
                setState(() {
                  _currentSlide = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(offers[index], fit: BoxFit.cover);
              },
            ),
          ),
          // Indicadores de página
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: offers.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _pageController.animateToPage(entry.key,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentSlide == entry.key ? Colors.pink : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Image.asset(category['icon']!, width: 50, height: 50),
                      Text(category['label']!, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
                    child: const Text('Destacados', style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 400, // Ajusta la altura según tus necesidades
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      _buildFeaturedItem(
                        'Pastel paint',
                        'assets/fotodepasteles/fotopastel6.jpg',
                        4.5,
                        1145.00,
                      ),
                      _buildFeaturedItem(
                        'Pastel paint',
                        'assets/fotodepasteles/fotopastel5.jpg',
                        4.8,
                        2155.00,
                      ),
                      _buildFeaturedItem(
                        'Pastel paint',
                        'assets/fotodepasteles/fotopastel6.jpg',
                        4.5,
                        1145.00,
                      ),
                      _buildFeaturedItem(
                        'Pastel paint',
                        'assets/fotodepasteles/fotopastel5.jpg',
                        4.8,
                        2155.00,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedItem(String title, String image, double rating, double price) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(image, width: 150, height: 150),
            Positioned(
              top: 5,
              right: 5,
              child: Icon(Icons.favorite, color: Colors.pink),
            ),
          ],
        ),
        Row(children: [Icon(Icons.star, color: Colors.yellow), Text(rating.toString())]),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text('\$${price.toString()} MXN', style: const TextStyle(color: Colors.brown)),
      ],
    );
  }
}

class CategoryGrid extends StatelessWidget {
  final List<Map<String, String>> categories;

  const CategoryGrid({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
  return GridView.builder(
    itemCount: categories.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3, // Puedes ajustar este valor según tu diseño
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
    ),
    itemBuilder: (context, index) {
      return Column(
        children: [
          ClipOval(
            child: Image.asset(
              categories[index]['icon']!,
              width: 80.0,  // Ajusta el tamaño del ícono
              height: 80.0, // Ajusta el tamaño del ícono
              fit: BoxFit.cover,  // Para que la imagen se ajuste bien dentro del círculo
            ),
          ),
          const SizedBox(height: 5),
          Text(categories[index]['label']!),
        ],
      );
    },
  );
}
}
