import 'package:flutter/material.dart';

class ListTypesComponent extends StatelessWidget {
  final List<ListTypeData> items;

  const ListTypesComponent({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
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
                    height: 145,
                    width: 106,
                  ),
                ),
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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

class ListTypeData {
  final String imagePath;
  final String title;

  ListTypeData({
    required this.imagePath,
    required this.title,
  });
}
