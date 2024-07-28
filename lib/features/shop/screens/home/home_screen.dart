import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
                  ),
                  isFavorite: favoriteDestinations.contains(Destination(
                    imagePath: 'assets/images/fav/hike_trail_1.jpg',
                    title: 'Ella to Ella Rock',
                    location: 'Badulla, Sri Lanka',
                    price: '5.50 mi | Est. 2h 55m',
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
                  ),
                  isFavorite: favoriteDestinations.contains(Destination(
                    imagePath: 'assets/images/fav/hike_trail_2.jpg',
                    title: 'Ella Rock Trail',
                    location: 'Badulla, Sri Lanka',
                    price: '3.30 mi | Est. 2h 10m',
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
                  ),
                  isFavorite: favoriteDestinations.contains(Destination(
                    imagePath: 'assets/images/fav/hike_trail_3.jpg',
                    title: 'Little Adam\'s Peak',
                    location: 'Badulla, Sri Lanka',
                    price: '1.00 mi | Est. 34 min',
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
                  ),
                  isFavorite: favoriteDestinations.contains(Destination(
                    imagePath: 'assets/images/fav/hike_trail_4.jpg',
                    title: 'Adam\'s Peak',
                    location: 'Rathnapura, Sri Lanka',
                    price: '5.50 mi | Est. 4h 56m',
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

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(width: 8),
                Text(label),
              ],
            ),
          ),
        ],
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
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Image.asset(
                destination.imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () => onFavoriteToggle(destination),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.white : Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black54, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        destination.location,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        destination.price,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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

  const Destination({
    required this.imagePath,
    required this.title,
    required this.location,
    required this.price,
  });
}

class DetailedDestinationScreen extends StatelessWidget {
  final Destination destination;

  const DetailedDestinationScreen({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
      ),
      body: Center(
        child: Text(
          'Detailed information about ${destination.title}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  final List<Destination> favoriteDestinations;

  const FavoriteScreen({
    Key? key,
    required this.favoriteDestinations,
  }) : super(key: key);

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
            title: Text(destination.title),
            subtitle: Text(destination.location),
            trailing: Text(destination.price),
          );
        },
      ),
    );
  }
}
