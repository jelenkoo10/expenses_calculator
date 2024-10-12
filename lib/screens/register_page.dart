import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                  labelText: 'Ime i prezime',
                  labelStyle: TextStyle(
                    color: Color(0xFF718096),
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),

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
                  // Handle register functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFEB3B),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Registruj se',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 10), // Space between buttons

              // Sign in with Google Button
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Google login functionality
                },
                icon: Image.asset(
                  'assets/images/google_logo.png', // Google logo
                  height: 24,
                ),
                label: Text('Sign in with Google'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // White background
                  iconColor: Colors.black, // Text and icon color
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 50), // Button width
                  side: const BorderSide(color: Colors.grey), // Add border to the button
                ),
              ),
              const SizedBox(height: 20),

              RichText(
                text: const TextSpan(
                  text: 'Imate nalog? ',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Prijavite se.',
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
