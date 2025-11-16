import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/meal_card.dart';
import '../models/meal.dart';
import 'meal_detail_screen.dart';

class CategoryMealsScreen extends StatefulWidget {
  final String categoryName;
  CategoryMealsScreen({required this.categoryName});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  final ApiService api = ApiService();
  List<Meal> meals = [];
  List<Meal> filteredMeals = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  void fetchMeals() async {
    try {
      meals = await api.getMealsByCategory(widget.categoryName);
      setState(() {
        filteredMeals = meals;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  void searchMeals(String query) async {
    if (query.isEmpty) {
      setState(() {
        filteredMeals = meals;
      });
    } else {
      try {
        final results = await api.searchMeals(query);
        setState(() {
          filteredMeals = results.where((meal) => meal.name.toLowerCase().contains(query.toLowerCase())).toList();
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to search meals')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : error != null
          ? Center(child: Text(error!))
          : Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search meals...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: searchMeals,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemCount: filteredMeals.length,
              itemBuilder: (context, index) {
                final meal = filteredMeals[index];
                return MealCard(
                  meal: meal,
                  onTap: () async {
                    final detailedMeal = await api.getMealDetail(meal.id);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => MealDetailScreen(meal: detailedMeal)));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
