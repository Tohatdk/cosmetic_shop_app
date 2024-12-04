import 'package:cosmetic_shop/src/presentation/ui/components/buttons_component.dart';
import 'package:cosmetic_shop/service/navigation/constants_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CatalogSearchScreen extends StatefulWidget {
  const CatalogSearchScreen({super.key});

  @override
  State<CatalogSearchScreen> createState() => _CatalogSearchScreenState();
}

class _CatalogSearchScreenState extends State<CatalogSearchScreen> {
  TextEditingController textEditingController = TextEditingController();

  final List<String> allItems = [
    'Назначение',
    'Тип средства',
    'Тип кожи',
    'Линия косметики',
    'Наборы',
    'Акции',
    'Консультация с косметологом'
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
  }

  void _filterSearchResults(String query) {
    setState(() {
      filteredItems = allItems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                onChanged: _filterSearchResults,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Поиск',
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if (filteredItems[index] == 'Тип кожи') {
                          context.go(Routes.types.fullPath);
                        }
                      },
                      title: Text(filteredItems[index]),
                    );
                  },
                ),
              ),
              Flexible(
                flex: 0,
                child: Container(
                  height: size.height * 0.20,
                  width: size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/2222.png"),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Составим схему идеального домашнего ухода',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        const Text("10 вопросов о вашей коже"),
                        const Spacer(),
                        ButtonsComponent.blackBackground(
                            title: 'Пройти тест', onTap: () {}),
                      ],
                    ),
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

class TypeSelectionScreen extends StatelessWidget {
  const TypeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('По типу кожи'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                context.go(Routes.shoptype.fullPath);
              },
              title: const Text('Жирная'),
            ),
            ListTile(
              onTap: () {},
              title: const Text('Комбинированная '),
            ),
            ListTile(
              onTap: () {},
              title: const Text('Нормальная'),
            ),
            ListTile(
              onTap: () {},
              title: const Text('Сухая'),
            ),
            ListTile(
              onTap: () {},
              title: const Text('Любой тип'),
            ),
          ],
        ),
      ),
    );
  }
}
