import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // 웹 타이틀 용
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: BigButton(
          title: 'Button',
          onTap: () {
            print('click!');
          },
        ),
      ),
    );
  }
}

class BigButton extends StatefulWidget {
  final String title;
  final void Function() onTap;

  const BigButton({super.key, required this.title, required this.onTap});

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  bool isPressed = false; // 상태이므로, hot reload 안됨

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        print('onTapDown');
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        print('onTapUp');
        setState(() {
          isPressed = false;
        });
        widget.onTap.call();
      },
      onTapCancel: () {
        print('onTapCancel');
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isPressed ? Colors.grey : Colors.teal,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 30),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
