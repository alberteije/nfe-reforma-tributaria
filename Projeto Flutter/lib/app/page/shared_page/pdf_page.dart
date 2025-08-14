import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class PdfPage extends StatefulWidget {
  final String? title;
  final Uint8List? pdfFile;

  const PdfPage({Key? key, this.title, this.pdfFile}) : super(key: key);

  @override
  PdfPageState createState() => PdfPageState();
}

class PdfPageState extends State<PdfPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        actions: const <Widget>[],
      ),
      body: PdfPreview(
        maxPageWidth: 800,
        canChangePageFormat: false,
        build: (format) => widget.pdfFile!,
      ),
    );
  }

}
