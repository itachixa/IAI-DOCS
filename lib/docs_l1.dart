import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SemesterL1Screen extends StatelessWidget {
  const SemesterL1Screen({super.key});

  final List<Map<String, String>> partialsS1 = const [
    {'name': 'Anglais', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'Algorithme', 'path': 'assets/pdfs/document.pdf'},
    {'name': 'Analyse Math', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'ATO', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'Electronique', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'Français', 'path': 'assets/pdfs/Français/document.pdf'},
    {'name': 'IC3', 'path': 'assets/pdfs/IC3/document.pdf'},
    {'name': 'Langage C', 'path': 'assets/pdfs/Langage_C/document.pdf'},
    {'name': 'Linux', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Math Discret', 'path': 'assets/pdfs/Math_discret/document.pdf'},
  ];

  final List<Map<String, String>> devoirsS1 = const [
    {'name': 'Anglais', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'Algorithme', 'path': 'assets/pdfs/Algorithme/document.pdf'},
    {'name': 'Analyse Math', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'ATO', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'Electronique', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'Français', 'path': 'assets/pdfs/Français/document.pdf'},
    {'name': 'IC3', 'path': 'assets/pdfs/IC3/document.pdf'},
    {'name': 'Langage C', 'path': 'assets/pdfs/Langage_C/document.pdf'},
    {'name': 'Linux', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Math Discret', 'path': 'assets/pdfs/Math_discret/document.pdf'},
  ];

  final List<Map<String, String>> partialsS2 = const [
    {'name': 'Pratique_SQL', 'path': 'assets/pdfs/Chimie/'},
    {'name': 'initiation_BD', 'path': 'assets/pdfs/Physique/'},
    {'name': 'CCNA_1a', 'path': 'assets/pdfs/Biologie/'},
    {'name': 'CCNA_1b', 'path': 'assets/pdfs/Economie/'},
    {'name': 'Economie', 'path': 'assets/pdfs/Histoire/'},
    {'name': 'Comptabilite', 'path': 'assets/pdfs/Geographie/'},
    {'name': 'Python', 'path': 'assets/pdfs/Philosophie/'},
    {'name': 'Java', 'path': 'assets/pdfs/Sociologie/'},
    {'name': 'DEV_Web', 'path': 'assets/pdfs/Statistiques/'},
  ];

  final List<Map<String, String>> devoirsS2 = const [
   {'name': 'Pratique_SQL', 'path': 'assets/pdfs/Chimie/'},
    {'name': 'initiation_BD', 'path': 'assets/pdfs/Physique/'},
    {'name': 'CCNA_1a', 'path': 'assets/pdfs/Biologie/'},
    {'name': 'CCNA_1b', 'path': 'assets/pdfs/Economie/'},
    {'name': 'Economie', 'path': 'assets/pdfs/Histoire/'},
    {'name': 'Comptabilite', 'path': 'assets/pdfs/Geographie/'},
    {'name': 'Python', 'path': 'assets/pdfs/Philosophie/'},
    {'name': 'Java', 'path': 'assets/pdfs/Sociologie/'},
    {'name': 'DEV_Web', 'path': 'assets/pdfs/Statistiques/'},
  ];

  void _openPdf(String path, BuildContext context) async {
    final ByteData bytes = await rootBundle.load(path);
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File('${dir.path}/${path.split('/').last}');
    await file.writeAsBytes(bytes.buffer.asUint8List());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(file: file),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        title: const Text('IAI-DOCS-L1', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Épreuves de Devoir - Semestre 1'),
              _buildSubjectList(devoirsS1, Colors.blue[100]!, context),
              _buildSectionTitle('Épreuves de Partiels - Semestre 1'),
              _buildSubjectList(partialsS1, Colors.green[100]!, context),
              _buildSectionTitle('Épreuves de Devoir - Semestre 2'),
              _buildSubjectList(devoirsS2, Colors.blue[100]!, context),
              _buildSectionTitle('Épreuves de Partiels - Semestre 2'),
              _buildSubjectList(partialsS2, Colors.green[100]!, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Widget _buildSubjectList(List<Map<String, String>> subjects, Color color, BuildContext context) {
    return Column(
      children: subjects.map((subject) => Card(
        color: color,
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: const Icon(Icons.book, color: Colors.black54),
          title: Text(
            subject['name']!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          onTap: () => _openPdf(subject['path']!, context),
        ),
      )).toList(),
    );
  }
}

class PdfViewerPage extends StatelessWidget {
  final File file;

  const PdfViewerPage({required this.file, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: SfPdfViewer.file(file),
    );
  }
}
