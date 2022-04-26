import 'package:flutter/material.dart';

class AddFileFloatingButton extends StatefulWidget {
  final VoidCallback onPressed;

  const AddFileFloatingButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<AddFileFloatingButton> createState() => _AddFileFloatingButtonState();
}

class _AddFileFloatingButtonState extends State<AddFileFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onPressed,
      child: const Icon(Icons.add),
    );
  }
}
