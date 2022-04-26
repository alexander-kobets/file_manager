import 'package:custom_file_manager/enums/button_option_enum.dart';
import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final ButtonOption buttonOption;
  final VoidCallback onPressed;

  const OptionTile({
    Key? key,
    required this.buttonOption,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: buttonOption.icon,
          iconSize: 32,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            buttonOption.label,
            style: const TextStyle(fontSize: 14),
          ),
        )
      ],
    );
  }
}
