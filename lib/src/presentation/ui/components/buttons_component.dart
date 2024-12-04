import 'package:flutter/material.dart';

class ButtonsComponent extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final ButtonType type;
  final double? fontSize;

  const ButtonsComponent._({
    super.key,
    required this.title,
    required this.onTap,
    required this.type,
    this.fontSize,
  });

  /// Первая кнопка: белый текст, белый бордер, без фона
  factory ButtonsComponent.whiteBorder({
    required String title,
    required VoidCallback onTap,
    double? fontSize,
  }) {
    return ButtonsComponent._(
      title: title,
      onTap: onTap,
      type: ButtonType.whiteBorder,
      fontSize: fontSize,
    );
  }

  /// Вторая кнопка: чёрный фон, белый текст
  factory ButtonsComponent.blackBackground({
    required String title,
    required VoidCallback onTap,
    double? fontSize,
  }) {
    return ButtonsComponent._(
      title: title,
      onTap: onTap,
      type: ButtonType.blackBackground,
      fontSize: fontSize,
    );
  }

  /// Третья кнопка: чёрный текст, без фона, другой радиус и размер
  factory ButtonsComponent.blackText({
    required String title,
    required VoidCallback onTap,
    double? fontSize,
  }) {
    return ButtonsComponent._(
      title: title,
      onTap: onTap,
      type: ButtonType.blackText,
      fontSize: fontSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style;
    switch (type) {
      case ButtonType.whiteBorder:
        style = OutlinedButton.styleFrom(
          padding:  const EdgeInsets.symmetric(
          horizontal: 8, vertical: 4),
          foregroundColor: Colors.white,
          minimumSize: const Size(20, 30),
          side: const BorderSide(color: Colors.white),
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),

          ),
        );
        break;

      case ButtonType.blackBackground:
        style = OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        );
        break;

      case ButtonType.blackText:
        style = OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.grey),
          minimumSize: const Size(double.infinity, 58.0),
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        );
        break;
    }

    return OutlinedButton(
      onPressed: onTap,
      style: style,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

enum ButtonType {
  whiteBorder,
  blackBackground,
  blackText,
}
