import 'package:flutter/material.dart';

class MyThirdScreen extends StatelessWidget {
  const MyThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('third screen'),
      ),
      body: ListView.builder( // 보여지는 화면만 메모리 업로드. 성능 UP
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          print('$index');
          return Image.asset('assets/cat.jpg');
        },
      ),
    );
  }
}
