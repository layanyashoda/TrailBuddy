import 'package:flutter/material.dart';
import '../../profile/widgets/favorite_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Map<String, dynamic>> favoritePlaces = [
    {
      'assetPath': 'assets/images/fav/hike_trail_1.jpg',
      'title': 'Ella to Ella Rock',
      'subtitle': '5.50 mi | Est. 2h 55m',
      'isFavorite': true,
      'isExpanded': false,
    },
    {
      'assetPath': 'assets/images/fav/hike_trail_2.jpg',
      'title': 'Ella Rock Trail',
      'subtitle': '3.30 mi | Est. 2h 10m',
      'isFavorite': true,
      'isExpanded': false,
    },
    {
      'assetPath': 'assets/images/fav/hike_trail_3.jpg',
      'title': 'Little Adam\'s Peak',
      'subtitle': '1.00 mi | Est. 34 min',
      'isFavorite': true,
      'isExpanded': false,
    },
    {
      'assetPath': 'assets/images/fav/hike_trail_4.jpg',
      'title': 'Adam\'s Peak',
      'subtitle': '5.50 mi | Est. 4h  56m',
      'isFavorite': true,
      'isExpanded': false,
    },
    {
      'assetPath': 'assets/images/fav/hike_trail_5.jpg',
      'title': 'Hanthana to Galaha',
      'subtitle': '7.90 mi | Est. 3h  50m',
      'isFavorite': true,
      'isExpanded': false,
    },
    {
      'assetPath': 'assets/images/fav/hike_trail_6.jpg',
      'title': 'Galaha to Loolkandura',
      'subtitle': '9.40 mi | Est. 4h  45m',
      'isFavorite': true,
      'isExpanded': false,
    },
  ];

  void toggleFavorite(int index) {
    setState(() {
      favoritePlaces.removeAt(index);
    });
  }

  void toggleExpansion(int index) {
    setState(() {
      favoritePlaces[index]['isExpanded'] = !favoritePlaces[index]['isExpanded'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) {
          final place = favoritePlaces[index];
          return FavoriteItem(
            assetPath: place['assetPath'] ?? '',
            title: place['title'] ?? 'Unknown',
            subtitle: place['subtitle'] ?? 'Unknown',
            isFavorite: place['isFavorite'] ?? false,
            isExpanded: place['isExpanded'] ?? false,
            onFavoriteToggle: () => toggleFavorite(index),
            onExpansionToggle: () => toggleExpansion(index),
          );
        },
      ),
    );
  }
}
