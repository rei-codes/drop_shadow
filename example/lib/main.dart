import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropShadow(
                child: Image.network(
                  'https://images.pexels.com/photos/1191639/pexels-photo-1191639.jpeg',
                  width: 250,
                ),
              ),
              const SizedBox(height: 35),
              DropShadow(
                child: Container(
                  height: 150,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF3366FF), Color(0xFF00CCFF)],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              const DropShadow(
                child: Text(
                  'Ehuehuehueuhe',
                  style: TextStyle(fontSize: 35, color: Colors.orange),
                ),
              ),
              const DropShadow(
                color: Colors.black,
                child: Text(
                  'Solid color drop shadow',
                  style: TextStyle(fontSize: 35, color: Colors.orange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
