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
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('height', double.parse(_heightController.text));
    await prefs.setDouble('weight', double.parse(_weightController.text));
  }

  Future load() async {
    final prefs = await SharedPreferences.getInstance();
    final double? height = prefs.getDouble('height');
    final double? weight = prefs.getDouble('weight');

    if (height != null && weight != null) {
      _heightController.text = '$height';
      _weightController.text = '$weight';
      print('키 : $height , 몸무게 : $weight');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI 계산기'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bmi_background.jpg'), // 배경 이미지 경로
            fit: BoxFit.cover, // 이미지가 화면 전체를 덮도록 설정
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 수직 중앙 정렬
                mainAxisSize: MainAxisSize.min, // 콘텐츠가 최소한의 공간만 차지하게 설정
                children: [
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/images/bmi.png', // 이미지 경로
                    height: 100, // 이미지의 높이 설정
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _heightController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '키',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '키를 입력해주세요!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _weightController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '몸무게',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '몸무게를 입력해주세요!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == false) {
                        return;
                      }
                      save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            height: double.parse(_heightController.text),
                            weight: double.parse(_weightController.text),
                          ),
                        ),
                      );
                    },
                    child: Text('결과'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
