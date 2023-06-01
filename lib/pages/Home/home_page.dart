// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';

import '../../core/utils/test_methods.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textCotroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    listenToAndroidData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Home Page'),
          const Text('Poc Flutter Inside Native With Project'),
          const SizedBox(height: 20),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  controller: textCotroller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your username',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    showSimpleSnackBar(context, 'Simple Message');
                  },
                  child: const Text('Show SnackBar')),
              TextButton(
                  onPressed: () {
                    log('Enviando data desde Flutter');
                    sendDataToAndroid(textCotroller.text.isEmpty
                        ? 'Data from Flutte with empty messager'
                        : textCotroller.text);
                  },
                  child: const Text('Send Data')),
            ],
          )
        ],
      )),
    );
  }

  void sendDataToAndroid(String data) async {
    final x = await channel.invokeMethod('sendDataToAndroid', data);

    showSimpleSnackBar(context, x.toString());

    await Future.delayed(const Duration(seconds: 2));
  }

  void listenToAndroidData() {
    channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'sendDataToFlutter') {
        String data = call.arguments;
        showSimpleSnackBar(context, data);
      }
    });
  }
}

const channel = MethodChannel('my_channel');
