import 'package:flutter/material.dart';
import 'package:flutter_ui/components/my_second_screen.dart';
import 'package:flutter_ui/components/my_third_screen.dart';

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
        home: const MyFirstScreen());
  }
}

class MyFirstScreen extends StatelessWidget {
  const MyFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('jaekkim first screen'),
        backgroundColor: Colors.limeAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 100,
                child: TextField(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('click!');
                      // navpush: live templates
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MySecondScreen()),
                      );
                    },
                    child: const Text('go to second screen'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('click!');
                      // navpush: live templates
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const MyThirdScreen()),
                      );
                    },
                    child: const Text('go to third screen'),
                  ),
                ],
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.lime,
              ),
              Image.network(
                'https://www.alleycat.org/wp-content/uploads/2019/03/FELV-cat.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ), // 이름이 있는 생성자. 의미 부여된 생성자, ui는 다 생성자~
              Image.asset(
                'assets/cat.jpg',
                // width: 100,
                height: 600,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
