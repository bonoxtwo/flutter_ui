class Ingredient {
  final int id;
  final String name;
  final String image;
  final double amount;

  Ingredient({
    required this.id,
    required this.name,
    required this.image,
    required this.amount,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['ingredient']['id'],
      name: json['ingredient']['name'],
      image: json['ingredient']['image'],
      amount: json['amount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ingredient': {
        'id': id,
        'name': name,
        'image': image,
      },
      'amount': amount,
    };
  }

  // alt + insert 하면 toString 자동 생성 가능
  @override
  String toString() {
    return 'Ingredient{id: $id, name: $name, image: $image, amount: $amount}';
  }
}

class Recipe {
  final String category;
  final int id;
  final String name;
  final String image;
  final String chef;
  final String time;
  final double rating;
  final List<Ingredient> ingredients;

  Recipe({
    required this.category,
    required this.id,
    required this.name,
    required this.image,
    required this.chef,
    required this.time,
    required this.rating,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    var ingredientList = json['ingredients'] as List;
    List<Ingredient> ingredients = ingredientList.map((i) => Ingredient.fromJson(i)).toList();

    return Recipe(
      category: json['category'] ?? 'no category',
      id: json['id'],
      name: json['name'],
      image: json['image'],
      chef: json['chef'],
      time: json['time'],
      rating: json['rating'].toDouble(),
      ingredients: ingredients,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'id': id,
      'name': name,
      'image': image,
      'chef': chef,
      'time': time,
      'rating': rating,
      'ingredients': ingredients.map((ingredient) => ingredient.toJson()).toList(),
    };

  }

  // alt + insert 하면 toString 자동 생성 가능
  @override
  String toString() {
    return 'Recipe{category: $category, id: $id, name: $name, image: $image, chef: $chef, time: $time, rating: $rating, ingredients: $ingredients}';
  }
}

