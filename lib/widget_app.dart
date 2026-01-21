import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: const Color(0xFF0000FF),
      onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return HomePage();
          },
        );
      },
      builder: (context, child) {
        return Container(
          color: const Color(0xFFFFFFFF),
          child: child,
        );
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
  bool _isDrawerOpen = false;
  int _selectedIndex = 0;

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main Column
        Column(
          children: [
            // Custom AppBar
            Container(
              height: 60,
              color: const Color(0xFF0000FF),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: _toggleDrawer,
                    child: IconWidget(Icons.menu, color: 0xFFFFFFFF),
                  ),
                  TextWidget('My AppBar', color: 0xFFFFFFFF, size: 20),
                  IconWidget(Icons.settings, color: 0xFFFFFFFF),
                ],
              ),
            ),
            // Body
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidget(
                      'Hello WidgetsApp 👋',
                      color: 0xFFFF0000,
                      size: 24,
                    ),
                    SizedBox(height: 20),
                    // Button
                    GestureDetector(
                      onTap: () {
                        print('Button Pressed!');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 24),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0000FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextWidget(
                          'Click Me',
                          color: 0xFFFFFFFF,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Navigation
            Container(
              height: 60,
              color: const Color(0xFFE0E0E0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavItem('Home', 0),
                  BottomNavItem('Business', 1),
                  BottomNavItem('School', 2),
                ],
              ),
            ),
          ],
        ),
        // Drawer
        if (_isDrawerOpen)
          GestureDetector(
            onTap: _toggleDrawer,
            child: Container(
              color: const Color(0x88000000),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 250,
                  color: const Color(0xFFFFFFFF),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        color: const Color(0xFF0000FF),
                        alignment: Alignment.center,
                        child: TextWidget('Drawer Header',
                            color: 0xFFFFFFFF, size: 24),
                      ),
                      ListItem('Item 1'),
                      ListItem('Item 2'),
                      ListItem('Item 3'),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget BottomNavItem(String title, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onBottomNavTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(title,
              color: isSelected ? 0xFF0000FF : 0xFF888888, size: 16),
        ],
      ),
    );
  }

  Widget ListItem(String title) {
    return GestureDetector(
      onTap: () {
        print('$title tapped');
        _toggleDrawer();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: TextWidget(title, color: 0xFF000000, size: 18),
      ),
    );
  }
}

// Helper Widgets
class TextWidget extends StatelessWidget {
  final String text;
  final int color;
  final double size;
  const TextWidget(this.text,
      {super.key, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
      style: TextStyle(fontSize: size, color: Color(color)),
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData icon;
  final int color;
  const IconWidget(this.icon, {super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: Color(color));
  }
}
