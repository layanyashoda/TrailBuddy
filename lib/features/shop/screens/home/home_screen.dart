// lib/features/shop/screens/home/home_screen.dart
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
                      backgroundImage: AssetImage('assets/images/others/profile_picture.jpg'), // Placeholder for user avatar
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
                      'Popular Destinations',
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
                    description: 'A short hike starting from Ella Village to Ella Rock. For a couple of miles, you are to walk along the train tracks till you come to the true path. The trail of elevation starts from the ground and goes across a small populated area and then up to the rock. Cocktails Coconut drinks available at the top.',
                    weather: 'Sunny, 75°F',
                  ),
                  isFavorite: favoriteDestinations.contains(Destination(
                    imagePath: 'assets/images/fav/hike_trail_1.jpg',
                    title: 'Ella to Ella Rock',
                    location: 'Badulla, Sri Lanka',
                    price: '5.50 mi | Est. 2h 55m',
                    trailLength: '5.50 mi',
                    averageTime: '2h 55m',
                    description: 'A short hike starting from Ella Village to Ella Rock. For a couple of miles, you are to walk along the train tracks till you come to the true path. The trail of elevation starts from the ground and goes across a small populated area and then up to the rock. Cocktails Coconut drinks available at the top.',
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
                    description: 'These are wonderful trails that begin from through a tea estate. Basically it is said that the starting part is fairly easy while towards the latter part it becomes quite a steep trail. Continue straining to get to the top because the views are great. From this place you will be able to have full view of the city of Ella and even little Adam’s peak. Bring plenty of water. The entire steep climb is in the forest so one will not lack for shade most of the time.',
                    weather: 'Partly cloudy, 70°F',
                  ),
                  isFavorite: favoriteDestinations.contains(Destination(
                    imagePath: 'assets/images/fav/hike_trail_2.jpg',
                    title: 'Ella Rock Trail',
                    location: 'Badulla, Sri Lanka',
                    price: '3.30 mi | Est. 2h 10m',
                    trailLength: '3.30 mi',
                    averageTime: '2h 10m',
                    description: 'These are wonderful trails that begin from through a tea estate. Basically it is said that the starting part is fairly easy while towards the latter part it becomes quite a steep trail. Continue straining to get to the top because the views are great. From this place you will be able to have full view of the city of Ella and even little Adam’s peak. Bring plenty of water. The entire steep climb is in the forest so one will not lack for shade most of the time.',
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
                    description: 'Little Adam’s Peak, or Mini Adam’s Peak, is another Ella hiking attraction located nearby. The mountain has a height of 1,141 meters and it is comparatively an easy trek when compared to Ellarock. The trek leads you through beautiful terrains of tea plantations and it only lasts for about 45 minutes.',
                    weather: 'Sunny, 80°F',
                  ),
                  isFavorite: favoriteDestinations.contains(Destination(
                    imagePath: 'assets/images/fav/hike_trail_3.jpg',
                    title: 'Little Adam\'s Peak',
                    location: 'Badulla, Sri Lanka',
                    price: '1.00 mi | Est. 34 min',
                    trailLength: '1.00 mi',
                    averageTime: '34 min',
                    description: 'Little Adam’s Peak, or Mini Adam’s Peak, is another Ella hiking attraction located nearby. The mountain has a height of 1,141 meters and it is comparatively an easy trek when compared to Ellarock. The trek leads you through beautiful terrains of tea plantations and it only lasts for about 45 minutes.',
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
                    description: 'Sri Pada popularly called the Adam’s Peak is a Mountain situated in central province of Sri Lanka. The mountain has a holy footprint measuring 1. 8 meters of rock at the peak which is considered holy by Buddhists, Hindu, Muslims, and Christians. The pilgrimage is performed throughout the season from December to May though hikers accompany the devotees throughout the year.',
                    weather: 'Rainy, 65°F',
                  ),
                  isFavorite: favoriteDestinations.contains(Destination(
                    imagePath: 'assets/images/fav/hike_trail_4.jpg',
                    title: 'Adam\'s Peak',
                    location: 'Rathnapura, Sri Lanka',
                    price: '5.50 mi | Est. 4h 56m',
                    trailLength: '5.50 mi',
                    averageTime: '4h 56m',
                    description: 'Sri Pada popularly called the Adam’s Peak is a Mountain situated in central province of Sri Lanka. The mountain has a holy footprint measuring 1. 8 meters of rock at the peak which is considered holy by Buddhists, Hindu, Muslims, and Christians. The pilgrimage is performed throughout the season from December to May though hikers accompany the devotees throughout the year.',
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
          children: [
            Image.asset(destination.imagePath),
            const SizedBox(height: 16),
            Text(
              destination.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              destination.location,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              destination.description,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Trail Length: ${destination.trailLength}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Average Time: ${destination.averageTime}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Weather: ${destination.weather}',
              style: TextStyle(fontSize: 16),
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
            leading: Image.asset(destination.imagePath, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(destination.title),
            subtitle: Text(destination.location),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailedDestinationScreen(destination: destination),
                ),
              );
            },
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Image.asset(
                destination.imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    destination.location,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    destination.price,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        destination.weather,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
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
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(0.2),
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}