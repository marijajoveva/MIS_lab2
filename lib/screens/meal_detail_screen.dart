import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:url_launcher/url_launcher.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;
  MealDetailScreen({required this.meal});

  void _launchURL(String url) async {
    if (await canLaunch(url)) await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.network(meal.thumbnail),
          SizedBox(height: 16),
          Text(meal.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text('Instructions:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(meal.instructions ?? ''),
          SizedBox(height: 16),
          Text('Ingredients:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...?meal.ingredients?.map((ing) => Text(ing)),
          SizedBox(height: 16),
          if (meal.youtubeLink != null && meal.youtubeLink!.isNotEmpty)
            ElevatedButton(
              onPressed: () => _launchURL(meal.youtubeLink!),
              child: Text('Watch on YouTube'),
            ),
        ]),
      ),
    );
  }
}
