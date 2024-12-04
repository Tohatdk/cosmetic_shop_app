import 'package:flutter/material.dart';

class ListCatalogComponent extends StatelessWidget {
  final List<ListItemData> items;

  const ListCatalogComponent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    item.imagePath,
                    fit: BoxFit.contain,
                    height: 187,
                    width: 161,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${item.price} ₽',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.type,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ListItemData {
  final String imagePath;
  final String title;
  final int price;
  final String type;

  ListItemData(
      {required this.imagePath,
      required this.title,
      required this.price,
      required this.type});
}
