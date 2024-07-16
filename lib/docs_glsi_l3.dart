import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class GLSIL3Screen extends StatelessWidget {
  const GLSIL3Screen({super.key});

  final List<Map<String, String>> partialsS5 = const [
    {'name': 'Système_IG', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'Big Data', 'path': 'assets/pdfs/Algorithme/document.pdf'},
    {'name': 'SIAD', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'Programmation_JEEE', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'Programation mobile', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'Programtion Distribuée', 'path': 'assets/pdfs/Français/document.pdf'},
    {'name': 'Admistration_BD_O', 'path': 'assets/pdfs/IC3/document.pdf'},
    {'name': 'Sécuruté_BD', 'path': 'assets/pdfs/Langage_C/document.pdf'},
    {'name': 'Administration_BD_SQL', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Introduction_IA', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Analyste_donné', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Indroduction_GL', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Anglais', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Préparation_TOEIC', 'path': 'assets/pdfs/Linux/document.pdf'},
  ];

  final List<Map<String, String>> devoirsS5 = const [
      {'name': 'Système_IG', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'Big Data', 'path': 'assets/pdfs/Algorithme/document.pdf'},
    {'name': 'SIAD', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'Programmation_JEEE', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'Programation mobile', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'Programtion Distribuée', 'path': 'assets/pdfs/Français/document.pdf'},
    {'name': 'Admistration_BD_O', 'path': 'assets/pdfs/IC3/document.pdf'},
    {'name': 'Sécuruté_BD', 'path': 'assets/pdfs/Langage_C/document.pdf'},
    {'name': 'Administration_BD_SQL', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Introduction_IA', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Analyste_donné', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Indroduction_GL', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Anglais', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Préparation_TOEIC', 'path': 'assets/pdfs/Linux/document.pdf'},
  ];

  final List<Map<String, String>> partialsS6 = const [
    {'name': 'Création_Entreprise', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'Droit_du_travail', 'path': 'assets/pdfs/Algorithme/document.pdf'},
    {'name': 'POO_Avancé', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'Outil(Larvel,Nodejs)', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'Audil_SI', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'TMI', 'path': 'assets/pdfs/Français/document.pdf'},
   
  ];

  final List<Map<String, String>> devoirsS6 = const [
   {'name': 'Création_Entreprise', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'Droit_du_travail', 'path': 'assets/pdfs/Algorithme/document.pdf'},
    {'name': 'POO_Avancé', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'Outil(Larvel,Nodejs)', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'Audil_SI', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'TMI', 'path': 'assets/pdfs/Français/document.pdf'},
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
        title: const Text('IAI-DOCS-L3', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Épreuves de Devoir - Semestre 5'),
              _buildSubjectList(devoirsS5, Colors.blue[100]!, context),
              _buildSectionTitle('Épreuves de Partiels - Semestre 5'),
              _buildSubjectList(partialsS5, Colors.green[100]!, context),
              _buildSectionTitle('Épreuves de Devoir - Semestre 6'),
              _buildSubjectList(devoirsS6, Colors.blue[100]!, context),
              _buildSectionTitle('Épreuves de Partiels - Semestre 6'),
              _buildSubjectList(partialsS6, Colors.green[100]!, context),
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
