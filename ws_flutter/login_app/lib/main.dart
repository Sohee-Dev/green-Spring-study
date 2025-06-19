import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String message ='';

  Future<void> login() async{
    final url = Uri.parse('http://localhost:8092/api/login');
    final response = await http.post(
      url,
      headers: {'Content-Type' : 'application/json'},
      body: json.encode({
        'username': usernameController.text,
        'password' : passwordController.text
      })
    );

    if(response.statusCode == 200){
      final data = json.decode(response.body);
      setState(() {
        message = '환영합니다, ${data['username']}님!';
      });
    }else{
      setState(() {
        message = '로그인 실패: 아이디 또는 비밀번호가 틀렸습니다.';
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('로그인'),),
      body: Padding(padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(labelText: '아이디', hintText: '아이디 입력'),
          ),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(labelText: '비밀번호', hintText: '비밀번호 입력'),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: login, child: const Text('로그인')),
          const SizedBox(height: 20,),
          Text(message),
        ],
      ),
      ),
    );
  }
}
