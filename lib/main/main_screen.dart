import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비만도 계산')
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '키'
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return '키를 입력해주세요!';
                }
                return null;
              },
            ),
            SizedBox(height: 8),
            TextFormField(
            decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: '몸무게'
           ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return '몸무게를 입력해주세요!';
                }
                return null;
              },
            ),
           const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                if(_formKey.currentState?.validate() ?? false) {

                }
              },
              child: Text('결과'),
            ),
          ],
        ),
      )
      )
    );
  }
}
