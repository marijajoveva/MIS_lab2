import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/meal.dart';

class FavoritesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = "favorites";

  Future<void> addFavorite(Meal meal) async {
    await _firestore.collection(collectionName).doc(meal.id).set({
      'id': meal.id,
      'name': meal.name,
      'thumbnail': meal.thumbnail,
      'instructions': meal.instructions,
      'ingredients': meal.ingredients,
      'youtubeLink': meal.youtubeLink,
    });
  }

  Future<void> removeFavorite(String id) async {
    await _firestore.collection(collectionName).doc(id).delete();
  }

  Stream<List<Meal>> getFavorites() {
    return _firestore.collection(collectionName).snapshots().map(
          (snapshot) => snapshot.docs.map((doc) {
        final data = doc.data();
        return Meal(
          id: data['id'],
          name: data['name'],
          thumbnail: data['thumbnail'],
          instructions: data['instructions'],
          ingredients: List<String>.from(data['ingredients'] ?? []),
          youtubeLink: data['youtubeLink'],
        );
      }).toList(),
    );
  }

  Future<bool> isFavorite(String id) async {
    final doc = await _firestore.collection(collectionName).doc(id).get();
    return doc.exists;
  }
}
