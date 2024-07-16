import 'package:flutter/material.dart';
import 'package:iai_docs/docs_asr_l3.dart';
import 'package:iai_docs/docs_glsi_l3.dart';
import 'docs_l1.dart';
import 'docs_l2.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IAI-DOCS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'IAI_DOCS',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset('lib/packege/logo.jpeg'), // Ensure the path is correct
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: const Center(child: Text('IAI-DOCS')),
        toolbarHeight: 80,
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bienvenue dans l\'application IAI_DOCS\nVeuillez choisir votre année',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildYearButton(context, ' L1 ', const SemesterL1Screen()),
                  const SizedBox(width: 50),
                  _buildYearButton(context, ' L2 ', const SemesterL2Screen()),
                  const SizedBox(width: 50),
                  _buildYearButton(context, ' L3 ', const SpecializationScreen(year: 'L3')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildYearButton(BuildContext context, String year, Widget screen) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: const BorderSide(color: Colors.blue, width: 2),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Text(
        year,
        style: const TextStyle(fontSize: 20), // Increased size for better readability
      ),
    );
  }
}

class SpecializationScreen extends StatelessWidget {
  final String year;
  const SpecializationScreen({super.key, required this.year});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: const Center(child: Text('IAI-DOCS')),
        toolbarHeight: 80,
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Veuillez choisir votre spécialisation',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              _buildSpecializationButton(context, 'GLSI'),
              const SizedBox(height: 20),
              _buildSpecializationButton(context, 'ASR'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecializationButton(BuildContext context, String specialization) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        side: const BorderSide(color: Colors.blue, width: 2),
      ),
      onPressed: () {
        // Use year and specialization to determine the next screen
        Widget nextScreen;
        if (specialization == 'GLSI') {
          nextScreen = GLSIL3Screen();
        } else {
          nextScreen = ASRL3Screen();
        }

        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: Text(
        specialization,
        style: const TextStyle(fontSize: 20), // Increased size for better readability
      ),
    );
  }
}
