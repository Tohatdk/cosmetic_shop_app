import 'package:flutter/material.dart';

class FilterShopComponent extends StatelessWidget {
  FilterShopComponent({super.key});

  final List<FilterOption> filterOptions = [
    FilterOption(title: 'Сортировка', value: 'По популярности'),
    FilterOption(title: 'Тип кожи', value: 'Жирная'),
    FilterOption(title: 'Тип средства', value: 'Все'),
    FilterOption(title: 'Проблема кожи', value: 'Не выбрано'),
    FilterOption(title: 'Эффект средства', value: 'Увлажнение'),
    FilterOption(title: 'Линия косметики', value: 'Все'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Фильтры'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        itemCount: filterOptions.length,
        itemBuilder: (context, index) {
          final option = filterOptions[index];
          return ListTile(
            title: Text(
              option.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              option.value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Center(
                  child: Text('Выбор значения для ${option.title}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FilterOption {
  final String title;
  final String value;

  FilterOption({required this.title, required this.value});
}
