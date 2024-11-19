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
      home: RecipeScreen(),
    );
  }
}

class RecipeScreen extends StatelessWidget {
  final ingredients = [
    {},
    {
      'imageUrl': 'assets/cat.jpg',
      'itemName': 'Cat',
      'itemDetail': '7kg',
    },
    {
      'imageUrl': 'assets/cat.jpg',
      'itemName': 'Dog',
      'itemDetail': '10kg',
    },
    {
      'imageUrl': 'assets/cat.jpg',
      'itemName': 'Snake',
      'itemDetail': '1kg',
    },
  ];

  RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: IngredientItemWidget(
              imageUrl: ingredients[index]['imageUrl'] ?? 'assets/default.jpg',
              itemName: ingredients[index]['itemName'] ?? 'no name',
              itemDetail: ingredients[index]['itemDetail'] ?? 'no detail',
              onTap: (itemName) {
                print('$itemName');
              },
            ),
          );
        },
      ),
    );
  }
}

class IngredientItemWidget extends StatelessWidget {
  final String imageUrl;
  final String itemName;
  final String itemDetail;
  final void Function(String itemName)? onTap; //callback;

  const IngredientItemWidget({
    super.key,
    required this.imageUrl,
    required this.itemName,
    required this.itemDetail,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call(itemName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 100,
        child: Row(
          children: [
            const SizedBox(width: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              itemName,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              itemDetail,
              style: const TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
