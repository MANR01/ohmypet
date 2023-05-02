// ignore_for_file: camel_case_types, file_names, unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

import '../PDF/utils/pdf_View.dart';

class pdfPage extends StatefulWidget {
  const pdfPage({super.key});

  @override
  State<pdfPage> createState() => _pdfPageState();
}

class _pdfPageState extends State<pdfPage> {
  PrintingInfo? printingInfo;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final info = await Printing.info();
    setState(() {
      printingInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;
    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        const PdfPreviewAction(
            icon: Icon(Icons.download), onPressed: saveAsFile)
    ];
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_literals_to_create_immutables
        backgroundColor: const Color.fromRGBO(195, 204, 115, 1),
        bottomOpacity: 0,
        elevation: 0,
        title: const Text(""),
      ),
      body: PdfPreview(
        maxPageWidth: 700,
        actions: actions,
        onPrinted: showPrintedToast,
        onShared: showSharedToast,
        build: (format) => generatePdf(format, context),
      ),
    );
  }
}
