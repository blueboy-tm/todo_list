import 'package:flutter/material.dart';

class EmptyListView extends StatelessWidget {
  const EmptyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/box-color.png'),
          const SizedBox(height: 10),
          const Text(
            'لیست خالی است.',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 21,
            ),
          ),
        ],
      ),
    );
  }
}
