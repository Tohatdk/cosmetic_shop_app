import 'package:cosmetic_shop/service/navigation/constants_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CatalogShopScreen extends StatefulWidget {
  const CatalogShopScreen({super.key});

  @override
  State<CatalogShopScreen> createState() => _CatalogShopScreenState();
}

class _CatalogShopScreenState extends State<CatalogShopScreen> {
  final List<ListItemData> items2 = [
    ListItemData(
      imagePath: "assets/images/Rectangle5.png",
      title: "Unstress Total Serenity Serum",
      type: "Сыворотка",
      price: 10195,
    ),
    ListItemData(
      imagePath: "assets/images/Frame27.png",
      title: "Unstress Revitalizing Toner",
      type: "Тоник",
      price: 3095,
    ),
    ListItemData(
      imagePath: "assets/images/Rectangle5.png",
      title: "Unstress Total Serenity Serum",
      type: "Сыворотка",
      price: 10195,
    ),
    ListItemData(
      imagePath: "assets/images/Frame27.png",
      title: "Unstress Revitalizing Toner",
      type: "Тоник",
      price: 3095,
    ),
    ListItemData(
      imagePath: "assets/images/Rectangle5.png",
      title: "Unstress Total Serenity Serum",
      type: "Сыворотка",
      price: 10195,
    ),
    ListItemData(
      imagePath: "assets/images/Frame27.png",
      title: "Unstress Revitalizing Toner",
      type: "Тоник",
      price: 3095,
    ),
  ];

  int? _selectedFilterIndex;

  final List<String> buttonTitles = [
    'Очищение',
    'Увлажнение',
    'Регенерация',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Средства для жирной кожи',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text(
                    '28 продуктов',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      context.go(Routes.filter.fullPath);
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/FadersHorizontal.svg',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: buttonTitles.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedFilterIndex == index;
                    return OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _selectedFilterIndex = index;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor:
                        isSelected ? Colors.white : Colors.black,
                        backgroundColor: isSelected
                            ? Colors.black
                            : Colors.transparent,
                        side: BorderSide(
                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        buttonTitles[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                  const SizedBox(width: 10),
                ),
              ),
              const SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: items2.length,
                itemBuilder: (context, index) {
                  final item = items2[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          item.imagePath,
                          fit: BoxFit.cover,
                          height: 140,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Каталог выбран
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}

class ListItemData {
  final String imagePath;
  final String title;
  final int price;
  final String type;

  ListItemData({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.type,
  });
}
