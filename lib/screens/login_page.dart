import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 120,
              ),
              const SizedBox(height: 20),

              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Color(0xFF718096),
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

              // Password Input
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Lozinka',
                  labelStyle: TextStyle(
                    color: Color(0xFF718096),
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  // Handle login functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFEB3B),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Prijavi se',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),

              ElevatedButton.icon(
                onPressed: () {
                  // Handle Google login functionality
                },
                icon: Image.asset(
                  'assets/images/google.png',
                  height: 24,
                ),
                label: const Text('Sign in with Google'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // White background
                  iconColor: Colors.black, // Text and icon color
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),

              RichText(
                text: const TextSpan(
                  text: 'Nemate nalog? ',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Registrujte se.',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
