import 'package:flutter/material.dart';
class ResultScreen extends StatelessWidget {
  final double height;
  final double weight;

  const ResultScreen({
    Key? key,
    required this.height,
    required this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String result = '정상';
    return Scaffold(
      appBar: AppBar(
        title: const Text('결과'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result,
              style: const TextStyle(fontSize: 36),
            ),
            const Icon(Icons.sentiment_satisfied,
              color: Colors.blue,
            size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
