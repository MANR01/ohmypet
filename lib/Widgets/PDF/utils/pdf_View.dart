// ignore_for_file: unused_local_variable, await_only_futures, import_of_legacy_library_into_null_safe, depend_on_referenced_packages, avoid_print, unnecessary_import, unused_import, file_names, use_build_context_synchronously

import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ohmypet_res/Services/Provider/imageProvider.dart';
import 'package:ohmypet_res/Services/Provider/provider.dart';
import 'package:ohmypet_res/Widgets/formulario/camp_Formulario/_inputFechaN.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:provider/provider.dart';

Future<Uint8List> generatePdf(
    final PdfPageFormat format, BuildContext context) async {
  final doc = pw.Document(title: 'Registro Animal');

  final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/Logo.png')).buffer.asUint8List());

  final huellita = pw.MemoryImage(
      (await rootBundle.load('assets/icon-huella.png')).buffer.asUint8List());

  final font = await rootBundle.load('fonts/OpenSans-Regular.ttf');

  final ttf = pw.Font.ttf(font);

  final pageTheme = await _mypageTheme(format);

  final watch = Provider.of<mascotsProvider>(context, listen: false);

  doc.addPage(pw.MultiPage(
      pageTheme: pageTheme,
      header: ((final context) => pw.Row(children: [
            pw.Image(
              alignment: pw.Alignment.topRight,
              logoImage,
              fit: pw.BoxFit.contain,
              width: 120,
            ),
            pw.Container(
                padding: const pw.EdgeInsets.symmetric(horizontal: 30),
                child: pw.Text('Registro Animal',
                    style: pw.TextStyle(font: ttf, fontSize: 35))),
            pw.Image(
              alignment: pw.Alignment.topRight,
              logoImage,
              fit: pw.BoxFit.contain,
              width: 120,
            ),
          ])),
      build: (final context) => [
            //Tiulo del Acta de Nacimiento
            pw.Container(
                padding:
                    const pw.EdgeInsets.only(left: 20, right: 20, bottom: 15),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Padding(padding: const pw.EdgeInsets.only(top: 15)),
                      pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.end,
                              children: [
                                pw.SizedBox(width: 30),
                                pw.Container(
                                  decoration: pw.BoxDecoration(
                                      borderRadius: pw.BorderRadius.circular(7),
                                      border: pw.Border.all(
                                          color: const PdfColor(0, 0, 0))),
                                  alignment: pw.Alignment.bottomRight,
                                  margin: const pw.EdgeInsets.symmetric(
                                      horizontal: 70),
                                  padding: const pw.EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: pw.Row(
                                    mainAxisSize: pw.MainAxisSize.max,
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      pw.Text("ACTA DE NACIMIENTO",
                                          style: pw.TextStyle(
                                              font: ttf, fontSize: 20)),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ]),

                      //Foto de la Mascota
                      pw.SizedBox(height: 30),
                      pw.Image(
                        alignment: pw.Alignment.bottomLeft,
                        logoImage,
                        fit: pw.BoxFit.contain,
                        width: 150,
                      ),
                      pw.SizedBox(height: 30),
                      
                      //Cabezera de los datos de la Mascota
                      pw.Container(
                          decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(7),
                              border: pw.Border.all(
                                  color: const PdfColor(0, 0, 0))),
                          margin: const pw.EdgeInsets.symmetric(horizontal: 20),
                          padding:
                              const pw.EdgeInsets.symmetric(horizontal: 20),
                          child: pw.Column(
                              mainAxisSize: pw.MainAxisSize.min,
                              children: [
                                pw.Text("Datos de la Mascota",
                                    style:
                                        pw.TextStyle(font: ttf, fontSize: 20))
                              ])),
                      pw.SizedBox(height: 8),

                      //Datos de la Mascota
                      pw.Container(
                        decoration: pw.BoxDecoration(
                            borderRadius: pw.BorderRadius.circular(7),
                            border:
                                pw.Border.all(color: const PdfColor(0, 0, 0))),
                        margin: const pw.EdgeInsets.symmetric(horizontal: 20),
                        padding: const pw.EdgeInsets.symmetric(horizontal: 20),
                        child: pw.Column(
                          children: [
                            pw.SizedBox(
                              height: 12,
                            ),
                            pw.Row(
                              children: [
                                pw.Text("Fecha de Nacimiento:",
                                    style:
                                        pw.TextStyle(font: ttf, fontSize: 15)),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: pw.SizedBox(
                                    child: pw.Text(watch.fech,
                                        style: pw.TextStyle(
                                            font: ttf, fontSize: 15)),
                                    //widget.fech
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              children: [
                                pw.Text("Especie:",
                                    style:
                                        pw.TextStyle(font: ttf, fontSize: 15)),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: pw.SizedBox(
                                    child: pw.Text(watch.esp,
                                        style: pw.TextStyle(
                                            font: ttf, fontSize: 15)),
                                    //widget.esp
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              children: [
                                pw.Text("Raza:",
                                    style:
                                        pw.TextStyle(font: ttf, fontSize: 15)),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: pw.SizedBox(
                                    child: pw.Text(watch.raza,
                                        style: pw.TextStyle(
                                            font: ttf, fontSize: 15)),
                                    //widget.raza
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              children: [
                                pw.Text("Nombre:",
                                    style:
                                        pw.TextStyle(font: ttf, fontSize: 15)),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: pw.SizedBox(
                                    child: pw.Text(watch.nom,
                                        style: pw.TextStyle(
                                            font: ttf, fontSize: 15)),
                                    //widget.name
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 20),
                            pw.Row(
                              children: [
                                pw.Text("Edad:",
                                    style:
                                        pw.TextStyle(font: ttf, fontSize: 15)),
                                pw.Padding(
                                  padding: const pw.EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: pw.SizedBox(
                                    child: pw.Text(watch.edad,
                                        style: pw.TextStyle(
                                            font: ttf, fontSize: 15)),
                                    //widget.edad
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(height: 10),
                          ],
                        ),
                      ),
                      pw.SizedBox(height: 155),

                      //Cabezera de los datos de los Padres
                      pw.Container(
                          decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(7),
                              border: pw.Border.all(
                                  color: const PdfColor(0, 0, 0))),
                          margin: const pw.EdgeInsets.symmetric(horizontal: 20),
                          padding:
                              const pw.EdgeInsets.symmetric(horizontal: 20),
                          child: pw.Column(
                              mainAxisSize: pw.MainAxisSize.min,
                              children: [
                                pw.Text("Datos de los Padres",
                                    style:
                                        pw.TextStyle(font: ttf, fontSize: 20))
                              ])),
                      pw.SizedBox(height: 8),

                      //Datos de los Padres
                      pw.Container(
                        decoration: pw.BoxDecoration(
                            borderRadius: pw.BorderRadius.circular(7),
                            border:
                                pw.Border.all(color: const PdfColor(0, 0, 0))),
                        margin: const pw.EdgeInsets.symmetric(horizontal: 15),
                        padding: const pw.EdgeInsets.symmetric(horizontal: 15),
                        child: pw.Column(children: [
                          pw.SizedBox(
                            height: 12,
                          ),
                          pw.Row(
                            mainAxisSize: pw.MainAxisSize.max,
                            children: [
                              pw.Text("Nombre del Padre:",
                                  style: pw.TextStyle(font: ttf, fontSize: 15)),
                              pw.Padding(
                                padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 15),
                                child: pw.SizedBox(
                                  child: pw.Text(watch.padre,
                                      style: pw.TextStyle(
                                          font: ttf, fontSize: 15)),
                                  //widget.padre
                                ),
                              ),
                            ],
                          ),
                          pw.SizedBox(height: 20),
                          pw.Row(
                            mainAxisSize: pw.MainAxisSize.max,
                            children: [
                              pw.Text("Nombre de la Madre:",
                                  style: pw.TextStyle(font: ttf, fontSize: 15)),
                              pw.Padding(
                                padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 15),
                                child: pw.SizedBox(
                                  child: pw.Text(watch.madre,
                                      style: pw.TextStyle(
                                          font: ttf, fontSize: 15)),
                                  //widget.madre
                                ),
                              ),
                            ],
                          ),
                          pw.SizedBox(height: 20),
                        ]),
                      ),
                      pw.SizedBox(height: 20),

                      //Cabezera de la imagen de la huella
                      pw.Container(
                          decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(7),
                              border: pw.Border.all(
                                  color: const PdfColor(0, 0, 0))),
                          margin: const pw.EdgeInsets.symmetric(horizontal: 20),
                          padding:
                              const pw.EdgeInsets.symmetric(horizontal: 20),
                          child: pw.Column(
                              mainAxisSize: pw.MainAxisSize.min,
                              children: [
                                pw.Text("Huella de la Mascota",
                                    style:
                                        pw.TextStyle(font: ttf, fontSize: 20))
                              ])),
                      pw.SizedBox(height: 8),

                      //Imagen de la Huella
                      pw.Container(
                          decoration: pw.BoxDecoration(
                              borderRadius: pw.BorderRadius.circular(7),
                              border: pw.Border.all(
                                  color: const PdfColor(0, 0, 0))),
                          margin: const pw.EdgeInsets.symmetric(horizontal: 30),
                          padding:
                              const pw.EdgeInsets.symmetric(horizontal: 30),
                          child: pw.Image(
                            huellita,
                            width: 90,
                          )),
                      pw.SizedBox(height: 30)
                    ]))
          ]));
  return doc.save();
}

Future<pw.PageTheme> _mypageTheme(PdfPageFormat format) async {
  final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/Logo.png')).buffer.asUint8List());

  return pw.PageTheme(
      margin: const pw.EdgeInsets.symmetric(
          horizontal: 1 + PdfPageFormat.cm, vertical: 0.5 + PdfPageFormat.cm),
      textDirection: pw.TextDirection.ltr,
      orientation: pw.PageOrientation.portrait,
      buildBackground: (final context) => pw.FullPage(
          ignoreMargins: true,
          child: pw.Watermark(
              angle: 0,
              child: pw.Opacity(
                  opacity: 0.2,
                  child: pw.Image(
                      alignment: pw.Alignment.center,
                      logoImage,
                      fit: pw.BoxFit.cover)))));
}

Future<void> saveAsFile(
  final BuildContext context,
  final LayoutCallback build,
  final PdfPageFormat pageFormat,
) async {
  final bytes = await build(pageFormat);

  final appDocDir = await getApplicationDocumentsDirectory();
  final appDocPath = appDocDir.path;
  final file = File('$appDocPath/acta_nacimiento.pdf');

  print('Guardar como archivo ${file.path}...');

  await file.writeAsBytes(bytes);
  await OpenFile.open(file.path);
}

void showPrintedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Documento impreso con éxito')));
}

void showSharedToast(final BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Documento compartido con éxito')));
}
