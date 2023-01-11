import 'package:flutter/material.dart';
import 'package:structure/models/document.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReaderScreen extends StatefulWidget {
  ReaderScreen(this.doc, {super.key});

  Document doc;

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("${widget.doc.title}"),
          backgroundColor: Color(0xFA1F2B36),
        ),
        body: Container(
          child: SfPdfViewer.network(
            widget.doc.url!,
          ),
          key: _pdfViewerKey,
        ));
  }
}
