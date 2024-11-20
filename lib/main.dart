import 'package:flutter/material.dart';
import 'package:flutter_ui/components/my_first_screen.dart';
import 'package:flutter_ui/presentation/recipe_list_screen.dart';
import 'package:flutter_ui/presentation/recipe_list_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final viewModel = RecipeListViewModel();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // 웹 타이틀 용
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: ListenableBuilder(
        // change notifier의 notice를 받아옴
        listenable: viewModel,
        builder: (context, widget) {
          return RecipeListScreen(state: viewModel.state);
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // statefulwidget includes state
  const MyHomePage({super.key, required this.title}); // 생성자

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // _private

  void _incrementCounter() {
    // _private
    setState(() {
      //state class provide
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //material style
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              // const => 안바뀜
              'You have pushed the button this many times:', //작은 따옴표가 기준
            ),
            Text(
              '${_counter * 1}', // $ 변수 스트링화
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // scaffold style provides
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.access_time),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
