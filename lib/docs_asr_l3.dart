import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ASRL3Screen extends StatelessWidget {
  const ASRL3Screen({super.key});

  final List<Map<String, String>> partialsS5 = const [
    {'name': 'PS', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'Linux', 'path': 'assets/pdfs/Algorithme/document.pdf'},
    {'name': 'CCNA3', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'Huawei_certif', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'Admistration_reseaux', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'Big_data', 'path': 'assets/pdfs/Français/document.pdf'},
    {'name': 'Securité_réseau', 'path': 'assets/pdfs/IC3/document.pdf'},
    {'name': 'Anglais', 'path': 'assets/pdfs/Langage_C/document.pdf'},
    {'name': 'Prepartion_TOEIC', 'path': 'assets/pdfs/Linux/document.pdf'},
  ];

  final List<Map<String, String>> devoirsS5 = const [
    {'name': 'PS', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'Linux', 'path': 'assets/pdfs/Algorithme/document.pdf'},
    {'name': 'CCNA3', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'Huawei_certif', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'Admistration_reseaux', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'Big_data', 'path': 'assets/pdfs/Français/document.pdf'},
    {'name': 'Securité_réseau', 'path': 'assets/pdfs/IC3/document.pdf'},
    {'name': 'Anglais', 'path': 'assets/pdfs/Langage_C/document.pdf'},
    {'name': 'Prepartion_TOEIC', 'path': 'assets/pdfs/Linux/document.pdf'},
  ];

  final List<Map<String, String>> partialsS6 = const [
    {'name': 'Création_Entreprise', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'Droit_du_travail', 'path': 'assets/pdfs/Algorithme/document.pdf'},
    {'name': 'MSR', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'AAR', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'Réseaux_mobile', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'Fibre optique', 'path': 'assets/pdfs/Français/document.pdf'},
    {'name': 'Audit_Systeme_R', 'path': 'assets/pdfs/IC3/document.pdf'},
    {'name': 'TCI', 'path': 'assets/pdfs/Langage_C/document.pdf'},
  ];

  final List<Map<String, String>> devoirsS6 = const [
    {'name': 'Création_Entreprise', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'Droit_du_travail', 'path': 'assets/pdfs/Algorithme/document.pdf'},
    {'name': 'MSR', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'AAR', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'Réseaux_mobile', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'Fibre optique', 'path': 'assets/pdfs/Français/document.pdf'},
    {'name': 'Audit_Systeme_R', 'path': 'assets/pdfs/IC3/document.pdf'},
    {'name': 'TCI', 'path': 'assets/pdfs/Langage_C/document.pdf'},
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
