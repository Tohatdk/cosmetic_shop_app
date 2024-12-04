import 'package:cosmetic_shop/src/presentation/ui/components/buttons_component.dart';
import 'package:cosmetic_shop/src/presentation/ui/components/list_catalog_component.dart';
import 'package:cosmetic_shop/src/presentation/ui/components/list_types_component.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final List<ListTypeData> items = [
      ListTypeData(
        imagePath: "assets/images/Frame7.png",
        title: "Наборы",
      ),
      ListTypeData(
        imagePath: "assets/images/Frame8.png",
        title: "Для лица",
      ),
      ListTypeData(
        imagePath: "assets/images/Frame1.png",
        title: "Для глаз",
      ),
      ListTypeData(
        imagePath: "assets/images/Frame2.png",
        title: "Для тела",
      ),
      ListTypeData(
        imagePath: "assets/images/ggg.png",
        title: "Умывание",
      ),
    ];

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
        type: "Сыворотка",
        price: 3095,
      ),
    ];

    final List<ListTypeData> items3 = [
      ListTypeData(
        imagePath: "assets/images/Frame50.png",
        title: "Демакияж",
      ),
      ListTypeData(
        imagePath: "assets/images/image39.png",
        title: "Очищение",
      ),
      ListTypeData(
        imagePath: "assets/images/Frame54.png",
        title: "Сыворотка",
      ),
      ListTypeData(
        imagePath: "assets/images/Frame53.png",
        title: "Дневной крем",
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Верхний баннер
          Container(
            height: size.height * 0.4,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/first.png"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    children: [
                      Spacer(),
                      Text(
                        "Скидка -15%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Сыворотка",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        "HA EYE & NECK SERUM",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonsComponent.whiteBorder(
                          title: 'Перейти к акции',
                          fontSize: 12,
                          onTap: () {})),
                ],
              ),
            ),
          ),
          // Компоненты типа List
          ListTypesComponent(items: items),
          const SizedBox(height: 20),
          const Text(
            "Новинки",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          ListCatalogComponent(items: items2),
          // Остальной контент
          const SizedBox(height: 30),
          Container(
            height: size.height * 0.35,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/2222.png"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Моя схема домашнего ухода"),
                  ListTypesComponent(items: items3),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Ответьте на 10 вопросов, и мы подберем нужный уход",
                        ),
                      ),
                      ButtonsComponent.blackBackground(
                        onTap: () {},
                        title: "Пройти тест",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Хиты",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          ListCatalogComponent(items: items2),
        ],
      ),
    );
  }
}
