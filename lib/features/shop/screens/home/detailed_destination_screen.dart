import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Destination> favoriteDestinations = [];

  void toggleFavorite(Destination destination) {
    setState(() {
      if (favoriteDestinations.contains(destination)) {
        favoriteDestinations.remove(destination);
      } else {
        favoriteDestinations.add(destination);
      }
    });
  }

  void navigateToDetailedScreen(Destination destination) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailedDestinationScreen(destination: destination),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(favoriteDestinations: favoriteDestinations),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Current Location',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Iconsax.location, color: Colors.blue),
                              SizedBox(width: 4),
                              Text(
                                'Badulla, Sri Lanka',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user_avatar.png'), // Placeholder for user avatar
                      radius: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      CategoryItem(icon: Iconsax.location5, label: 'Nearby'),
                      CategoryItem(icon: Iconsax.route_square, label: 'Epic Views'),
                      CategoryItem(icon: Iconsax.tree, label: 'Among Trees'),
                      CategoryItem(icon: Iconsax.star5, label: 'Top Picks'),
                      CategoryItem(icon: Iconsax.location3, label: 'Waterfalls'),
                      CategoryItem(icon: Iconsax.wind, label: 'Lakes'),
                      CategoryItem(icon: Iconsax.radar5, label: 'Rivers'),
                      CategoryItem(icon: Iconsax.radar5, label: 'Wildflowers'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Destination',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                PopularDestinationCard(
                  destination: Destination(
                    imagePath: 'assets/images/fav/hike_trail_1.jpg',
                    title: 'Ella to Ella Rock',
                    location: 'Badulla, Sri Lanka',
                    price: '5.50 mi | Est. 2h 55m',
                    trailLength: '5.50 mi',
                    averageTime: '2h 55m',
                    description: 'A scenic trail from Ella to Ella Rock.',
                    weather: 'Sunny, 75°F',
                  ),
                  isFavorite: favoriteDestinations.contains(Destination(
                    imagePath: 'assets/images/fav/hike_trail_1.jpg',
                    title: 'Ella to Ella Rock',
                    location: 'Badulla, Sri Lanka',
                    price: '5.50 mi | Est. 2h 55m',
                    trailLength: '5.50 mi',
                    averageTime: '2h 55m',
                    description: 'A scenic trail from Ella to Ella Rock.',
                    weather: 'Sunny, 75°F',
                  )),
                  onFavoriteToggle: toggleFavorite,
                  onCardTap: navigateToDetailedScreen,
                ),
                PopularDestinationCard(
                  destination: Destination(
                    imagePath: 'assets/images/fav/hike_trail_2.jpg',
                    title: 'Ella Rock Trail',
                    location: 'Badulla, Sri Lanka',
                    price: '3.30 mi | Est. 2h 10m',
                    trailLength: '3.30 mi',
                    averageTime: '2h 10m',
                    description: 'A beautiful trail to Ella Rock.',
                    weather: 'Partly cloudy, 70°F',
                  ),
                  isFavorite: favoriteDestinations.contains(Destination(
                    imagePath: 'assets/images/fav/hike_trail_2.jpg',
                    title: 'Ella Rock Trail',
                    location: 'Badulla, Sri Lanka',
                    price: '3.30 mi | Est. 2h 10m',
                    trailLength: '3.30 mi',
                    averageTime: '2h 10m',
                    description: 'A beautiful trail to Ella Rock.',
                    weather: 'Partly cloudy, 70°F',
                  )),
                  onFavoriteToggle: toggleFavorite,
                  onCardTap: navigateToDetailedScreen,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Explore More',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View All',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                PopularDestinationCard(
                  destination: Destination(
                    imagePath: 'assets/images/fav/hike_trail_3.jpg',
                    title: 'Little Adam\'s Peak',
                    location: 'Badulla, Sri Lanka',
                    price: '1.00 mi | Est. 34 min',
                    trailLength: '1.00 mi',
                    averageTime: '34 min',
                    description: 'A short hike to Little Adam\'s Peak.',
                    weather: 'Sunny, 80°F',
                  ),
                  isFavorite: favoriteDestinations.contains(Destination(
                    imagePath: 'assets/images/fav/hike_trail_3.jpg',
                    title: 'Little Adam\'s Peak',
                    location: 'Badulla, Sri Lanka',
                    price: '1.00 mi | Est. 34 min',
                    trailLength: '1.00 mi',
                    averageTime: '34 min',
                    description: 'A short hike to Little Adam\'s Peak.',
                    weather: 'Sunny, 80°F',
                  )),
                  onFavoriteToggle: toggleFavorite,
                  onCardTap: navigateToDetailedScreen,
                ),
                PopularDestinationCard(
                  destination: Destination(
                    imagePath: 'assets/images/fav/hike_trail_4.jpg',
                    title: 'Adam\'s Peak',
                    location: 'Rathnapura, Sri Lanka',
                    price: '5.50 mi | Est. 4h 56m',
                    trailLength: '5.50 mi',
                    averageTime: '4h 56m',
                    description: 'A challenging hike to Adam\'s Peak.',
                    weather: 'Rainy, 65°F',
                  ),
                  isFavorite: favoriteDestinations.contains(Destination(
                    imagePath: 'assets/images/fav/hike_trail_4.jpg',
                    title: 'Adam\'s Peak',
                    location: 'Rathnapura, Sri Lanka',
                    price: '5.50 mi | Est. 4h 56m',
                    trailLength: '5.50 mi',
                    averageTime: '4h 56m',
                    description: 'A challenging hike to Adam\'s Peak.',
                    weather: 'Rainy, 65°F',
                  )),
                  onFavoriteToggle: toggleFavorite,
                  onCardTap: navigateToDetailedScreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              destination.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
            const SizedBox(height: 16),
            Text(
              destination.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              destination.location,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              'Trail Length: ${destination.trailLength}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Average Time: ${destination.averageTime}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Description: ${destination.description}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Weather: ${destination.weather}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // Open a map app or navigation app with the destination location
              },
              icon: const Icon(Icons.navigation),
              label: const Text('Get Directions'),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  final List<Destination> favoriteDestinations;

  const FavoriteScreen({Key? key, required this.favoriteDestinations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteDestinations.length,
        itemBuilder: (context, index) {
          final destination = favoriteDestinations[index];
          return ListTile(
            leading: Image.asset(
              destination.imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(destination.title),
            subtitle: Text(destination.location),
            trailing: IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}

class PopularDestinationCard extends StatelessWidget {
  final Destination destination;
  final bool isFavorite;
  final Function(Destination) onFavoriteToggle;
  final Function(Destination) onCardTap;

  const PopularDestinationCard({
    Key? key,
    required this.destination,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onCardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCardTap(destination),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              destination.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    destination.location,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    destination.price,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () => onFavoriteToggle(destination),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({Key? key, required this.icon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(0.2),
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
