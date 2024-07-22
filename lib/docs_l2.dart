import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SemesterL2Screen extends StatelessWidget {
  const SemesterL2Screen({super.key});

  final List<Map<String, String>> partialsS3 = const [
    {'name': 'Approche_MERISE', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'METHODE_AGILES', 'path': 'assets/pdfs/Algorithme/document.pdf'},
    {'name': 'Approche_O_UML', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'BD', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'XML', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'Probabilité', 'path': 'assets/pdfs/Français/document.pdf'},
    {'name': 'Graphes', 'path': 'assets/pdfs/IC3/document.pdf'},
    {'name': 'Algebre_linéaire', 'path': 'assets/pdfs/Langage_C/document.pdf'},
    {'name': 'Crypthograpie', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'CCNA2', 'path': 'assets/pdfs/Math_discret/document.pdf'},
    {'name': 'Sécurité_informatique', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'WEB||', 'path': 'assets/pdfs/Math_discret/document.pdf'},
    {'name': 'Python', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'POO(JAVA)', 'path': 'assets/pdfs/Math_discret/document.pdf'},
  ];

  final List<Map<String, String>> devoirsS3 = const [
    {'name': 'Approche_MERISE', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'METHODE_AGILES', 'path': 'assets/pdfs/Algorithme/document.pdf'},
    {'name': 'Approche_O_UML', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'BD', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'XML', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'Probabilité', 'path': 'assets/pdfs/Français/document.pdf'},
    {'name': 'Graphes', 'path': 'assets/pdfs/IC3/document.pdf'},
    {'name': 'Algebre_linéaire', 'path': 'assets/pdfs/Langage_C/document.pdf'},
    {'name': 'Crypthograpie', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'CCNA2', 'path': 'assets/pdfs/Math_discret/document.pdf'},
    {'name': 'Sécurité_informatique', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'WEB||', 'path': 'assets/pdfs/Math_discret/document.pdf'},
    {'name': 'Python', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'POO(JAVA)', 'path': 'assets/pdfs/Math_discret/document.pdf'},
  ];

  final List<Map<String, String>> partialsS4 = const [
    {'name': 'Anglais_sientifique', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'Français', 'path': 'assets/pdfs/Algorithme/document.pdf'},
    {'name': 'Rédaction_sientifique', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'ATO II', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'Electronique', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'Programmation_mobile', 'path': 'assets/pdfs/Français/document.pdf'},
    {'name': 'C#', 'path': 'assets/pdfs/IC3/document.pdf'},
    {'name': 'Cloud Computing', 'path': 'assets/pdfs/Langage_C/document.pdf'},
    {'name': 'Management', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Droit des TIC', 'path': 'assets/pdfs/Math_discret/document.pdf'},
  ];

  final List<Map<String, String>> devoirsS4 = const [
    {'name': 'Anglais_sientifique', 'path': 'assets/pdfs/Anglais/document.pdf'},
    {'name': 'Français', 'path': 'assets/pdfs/Algorithme/document.pdf'},
    {'name': 'Rédaction_sientifique', 'path': 'assets/pdfs/Analyse_Math/document.pdf'},
    {'name': 'ATO II', 'path': 'assets/pdfs/ATO/document.pdf'},
    {'name': 'Electronique', 'path': 'assets/pdfs/Electronique/document.pdf'},
    {'name': 'Programmation_mobile', 'path': 'assets/pdfs/Français/document.pdf'},
    {'name': 'C#', 'path': 'assets/pdfs/IC3/document.pdf'},
    {'name': 'Cloud Computing', 'path': 'assets/pdfs/Langage_C/document.pdf'},
    {'name': 'Management', 'path': 'assets/pdfs/Linux/document.pdf'},
    {'name': 'Droit des TIC', 'path': 'assets/pdfs/Math_discret/document.pdf'},
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
        title: const Text('IAI-DOCS-L2', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Épreuves de Devoir - Semestre 3'),
              _buildSubjectList(devoirsS3, Colors.blue[100]!, context),
              _buildSectionTitle('Épreuves de Partiels - Semestre 3'),
              _buildSubjectList(partialsS3, Colors.green[100]!, context),
              _buildSectionTitle('Épreuves de Devoir - Semestre 4'),
              _buildSubjectList(devoirsS4, Colors.blue[100]!, context),
              _buildSectionTitle('Épreuves de Partiels - Semestre 4'),
              _buildSubjectList(partialsS4, Colors.green[100]!, context),
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
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.primaryDelta! > 0) {
            Navigator.pop(context);
          }
        },
        child: SfPdfViewer.file(file),
      ),
    );
  }
}
