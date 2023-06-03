import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  final String label1;
  final TextEditingController textController;

  const CustomForm({
    super.key,
    required this.label1,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: TextFormField(
              style: const TextStyle(color: Colors.amber),
              controller: textController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(3, 4, 4, 0.4),
                border: InputBorder.none,
                label: Text(
                  label1,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
