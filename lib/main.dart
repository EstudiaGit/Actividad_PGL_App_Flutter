import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _imageIndex = 0;
  int _colorIndex = 0;

  final List<String> _imageUrls = [
    'https://tinyurl.com/3s2zehak',
    'https://tinyurl.com/yc58hzh5',
    'https://tinyurl.com/3d8dv2cn',
  ];

  final List<Color> _colors = [Colors.blue, Colors.green, Colors.orange];

  void _changeImage(int index) {
    setState(() {
      _imageIndex = index;
    });
  }

  void _changeColor(int index) {
    setState(() {
      _colorIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Imagen y Fondo'),
        ),
        body: Container(
          color: _colors[_colorIndex],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  _imageUrls[_imageIndex],
                  //width: 800,
                  height: 550,
                ),
                const SizedBox(height: 16),
                const Card(
                  color: Colors.white,
                  elevation: 4, // Elevación de la tarjeta
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '¡Hola Mundo!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 4, 115, 206),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _imageIndex,
          onTap: _changeImage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.cabin_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox_rounded),
              label: 'Intro',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.telegram_outlined),
              label: 'Contact',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _changeColor((_colorIndex + 1) % _colors.length);
          },
          child: const Icon(Icons.color_lens),
        ),
      ),
    );
  }
}
