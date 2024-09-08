import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylish GetX App',
      theme: ThemeData(
        primaryColor: Color(0xFF6C63FF),
        hintColor: Color(0xFFFFA726),
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            'assets/demo.jpeg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Assignment 1',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => controller.increment(),
                          child: Container(
                            width: 400,
                            height: 400,
                            child: Center(
                              child: Column(
                                children: [
                                  Obx(
                                        () => Text(
                                      '${controller.count}',
                                      style: TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                      width: 200,
                                      height: 50,
                                      color: Colors.black,
                                      child: Center(child: Text('Click to the number', style: TextStyle(color: Colors.white),))),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        controller.reset();
                        Get.snackbar(
                          'Reset!',
                          'The counter has been reset to zero.',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.white.withOpacity(0.7),
                          colorText: Colors.white,
                          duration: Duration(seconds: 2),
                          margin: EdgeInsets.all(10),
                          borderRadius: 20,
                        );
                      },
                      child: Icon(Icons.refresh),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CounterController extends GetxController with GetSingleTickerProviderStateMixin {
  var count = 0.obs;
  late AnimationController _animationController;

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
  }

  void increment() {
    count++;
    _animationController.forward(from: 0.0);
  }

  void reset() {
    count.value = 0;
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}
