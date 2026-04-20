import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diketahui, Ditanya, Dijawab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ProblemSolverPage(),
    );
  }
}

class ProblemSolverPage extends StatefulWidget {
  const ProblemSolverPage({super.key});

  @override
  State<ProblemSolverPage> createState() => _ProblemSolverPageState();
}

class _ProblemSolverPageState extends State<ProblemSolverPage> {
  final TextEditingController _diketahuiController = TextEditingController();
  final TextEditingController _ditanyaController = TextEditingController();
  final TextEditingController _jawabController = TextEditingController();

  @override
  void dispose() {
    _diketahuiController.dispose();
    _ditanyaController.dispose();
    _jawabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Format Penyelesaian Soal'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Masukkan Detail Soal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _diketahuiController,
              decoration: const InputDecoration(
                labelText: 'Diketahui',
                border: OutlineInputBorder(),
                hintText: 'Contoh: Massa = 5 kg, Gravitasi = 10 m/s^2',
              ),
              maxLines: null,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _ditanyaController,
              decoration: const InputDecoration(
                labelText: 'Ditanya',
                border: OutlineInputBorder(),
                hintText: 'Contoh: Berapa gaya beratnya?',
              ),
              maxLines: null,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _jawabController,
              decoration: const InputDecoration(
                labelText: 'Jawab',
                border: OutlineInputBorder(),
                hintText: 'Contoh: W = m x g = 5 x 10 = 50 N',
              ),
              maxLines: null,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 32),
            const Text(
              'Hasil Format',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildFormattedRow('Diketahui:', _diketahuiController.text),
                    const Divider(),
                    _buildFormattedRow('Ditanya:', _ditanyaController.text),
                    const Divider(),
                    _buildFormattedRow('Jawab:', _jawabController.text),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormattedRow(String label, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content.isEmpty ? '-' : content,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
