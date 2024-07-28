import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  final String assetPath;
  final String title;
  final String subtitle;
  final bool isFavorite;
  final bool isExpanded;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onExpansionToggle;

  const FavoriteItem({
    Key? key,
    required this.assetPath,
    required this.title,
    required this.subtitle,
    required this.isFavorite,
    required this.isExpanded,
    required this.onFavoriteToggle,
    required this.onExpansionToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ExpansionPanelList(
        elevation: 0,
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (int index, bool isExpanded) {
          onExpansionToggle();
        },
        children: [
          ExpansionPanel(
            isExpanded: isExpanded,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    assetPath,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, size: 60);
                    },
                  ),
                ),
                title: Text(title),
                subtitle: Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),
                trailing: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: onFavoriteToggle,
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Details about $title',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This is a placeholder for additional details about the hiking trail. You can add any extra information here.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
