// lib/features/shop/screens/home/detailed_destination_screen.dart
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DetailedDestinationScreen extends StatelessWidget {
  final Destination destination;

  DetailedDestinationScreen({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    destination.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  destination.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Iconsax.location, color: Colors.blue),
                    const SizedBox(width: 4),
                    Text(
                      destination.location,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Iconsax.ruler, color: Colors.blue),
                    const SizedBox(width: 4),
                    Text(
                      'Trail Length: ${destination.trailLength}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Iconsax.clock, color: Colors.blue),
                    const SizedBox(width: 4),
                    Text(
                      'Average Time: ${destination.averageTime}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Iconsax.cloud, color: Colors.blue),
                    const SizedBox(width: 4),
                    Text(
                      'Weather: ${destination.weather}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Description: ${destination.description}',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    // Open a map app or navigation app with the destination location
                  },
                  icon: Icon(Icons.navigation),
                  label: Text('Get Directions'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Destination {
  final String imagePath;
  final String title;
  final String location;
  final String price;
  final String trailLength;
  final String averageTime;
  final String description;
  final String weather;

  Destination({
    required this.imagePath,
    required this.title,
    required this.location,
    required this.price,
    required this.trailLength,
    required this.averageTime,
    required this.description,
    required this.weather,
  });
}