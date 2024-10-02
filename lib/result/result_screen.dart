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
    return Scaffold(
      appBar: AppBar(
        title: const Text('결과'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Text('정상', style: TextStyle(fontSize: 36),
            ),
            Icon(Icons.sentiment_satisfied,
              color: Colors.blue,
            size: 100,
            ),
          ],
        ),
      ),
    );
  }
}
