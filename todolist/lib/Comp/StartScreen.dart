import 'package:flutter/material.dart';
import 'package:todolist/Screen/Login_Screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
            // Positioned.fill(
            //   child: Image.asset(
            //     'assets/image/start.png',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/image/Ellipse 10.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'assets/image/Rectangle 12.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 25,top: 10),
                              child: Image.asset(
                                'assets/image/Group 115.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Image.asset(
                                'assets/image/Group 115.png',
                                fit: BoxFit.cover,
                              ),
                            Image.asset(
                              'assets/image/Group 113.png',
                              fit: BoxFit.cover,
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Welcome to My App!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'The best way to manage your tasks',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // Button color
                        elevation: 10.0, // Shadow
                        padding:
                            EdgeInsets.symmetric(vertical: 15.0), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30.0), // Rounded corners
                        ),
                        textStyle: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
  }
}