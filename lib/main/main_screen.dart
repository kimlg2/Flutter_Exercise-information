import 'package:bmi_flutter/result/result_screen.dart';  // 실제 파일 경로에 맞게 수정
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    save();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }
  Future save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('height', double.parse(_heightController.text));
    await prefs.setDouble('weight', double.parse(_weightController.text));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI 계산')
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _heightController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '키'
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return '키를 입력해주세요!';
                }return null;
              },
            ),
            SizedBox(height: 8),
            TextFormField(
            controller: _weightController,
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
                if(_formKey.currentState?.validate() == false ) {
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      height: double.parse(_heightController.text), // 실수로 변경
                      weight: double.parse(_weightController.text),  // 실수로 변경
                    ),
                  ),
                );
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
