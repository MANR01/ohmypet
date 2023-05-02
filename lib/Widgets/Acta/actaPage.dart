// ignore_for_file: file_names, camel_case_types, no_logic_in_create_state, avoid_unnecessary_containers, unused_local_variable, prefer_const_constructors_in_immutables, invalid_use_of_visible_for_testing_member, non_constant_identifier_names, unused_import, avoid_web_libraries_in_flutter, use_build_context_synchronously, unnecessary_null_comparison, must_be_immutable, prefer_const_declarations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:ohmypet_res/Clases/Mascots.dart';
import 'package:ohmypet_res/Services/Firebase/firebase_auth_methods.dart';
import 'package:ohmypet_res/Services/Provider/imageProvider.dart';
import 'package:ohmypet_res/Services/SQLite/sqlite_mascots.dart';
import 'dart:async';

import 'package:ohmypet_res/Widgets/pdf/pdfPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../comp_MenuLat/_inputForm.dart';
import '../login/loginPage.dart';
import 'camp_Acta/acta_Titulo.dart';
import 'camp_Acta/acta_Header.dart';
import 'camp_Acta/setHuella.dart';
import 'camp_Acta/datos_Acta/cabezeraDatos.dart';
import 'camp_Acta/datos_Acta/setDatosMascota.dart';
import 'camp_Acta/datos_Acta/cabezeraPadres.dart';
import 'camp_Acta/datos_Acta/setDatosPadres.dart';
import 'camp_Acta/datos_Acta/cabezeraHuella.dart';

import '../comp_MenuLat/_inputInicio.dart';
import '../comp_MenuLat/_inputCV.dart';
import '../comp_MenuLat/_inputANace.dart';
import '../comp_MenuLat/_inputSOS.dart';
import '../comp_MenuLat/_inputUserIMG.dart';

class actaPage extends StatefulWidget {
  actaPage({super.key});

  @override
  State<actaPage> createState() => _actaPageState();
}

class _actaPageState extends State<actaPage> {
  File? photo;

  List<Mascots> mascots = [];

  final elevatedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color.fromRGBO(240, 144, 36, 6),
      shape: const StadiumBorder());

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Fondo.png'), fit: BoxFit.cover)),
        child: Scaffold(
          drawer: Drawer(
            child: Container(
              color: const Color.fromRGBO(195, 204, 115, 1),
              child: Column(
                children: [
                  const comp_UserIMG(),
                  const Text("Bienvenido de vuelta",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 12),
                  const comp_Inicio(),
                  const SizedBox(
                    height: 12,
                  ),
                  const comp_Form(),
                  const SizedBox(
                    height: 12,
                  ),
                  const comp_ANace(),
                  const SizedBox(
                    height: 12,
                  ),
                  const comp_CV(),
                  const SizedBox(
                    height: 12,
                  ),
                  const comp_SOS(),
                  Expanded(child: Container()),
                  Container(
                      padding: const EdgeInsets.all(2),
                      width: double.infinity,
                      color: const Color.fromARGB(216, 240, 145, 36),
                      child: IconButton(
                          onPressed: () {
                            final snackBar = const SnackBar(
                              backgroundColor:
                                  Color.fromARGB(216, 240, 145, 36),
                              content: Text(
                                'Se cerro la Sesión',
                                style: TextStyle(color: Colors.white),
                              ),
                              duration: Duration(seconds: 2),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            signOut();
                          },
                          icon: const Icon(Icons.logout_outlined))),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            // ignore: prefer_const_literals_to_create_immutables
            backgroundColor: const Color.fromRGBO(195, 204, 115, 1),
            bottomOpacity: 0,
            elevation: 0,
            title: const Text(''),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.527),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Column(children: [
                    const header(),
                    const SizedBox(
                      height: 20,
                    ),
                    if (photo == null)
                      Column()
                    else
                      Image.file(
                        photo!,
                        width: 100,
                        height: 150,
                      ),
                    const SizedBox(
                      height: 20,
                    ),
                    const actaTitulo(),
                    const SizedBox(height: 20),
                    const cabezeraDatos(),
                    const SizedBox(
                      height: 3,
                    ),
                    const datosMascota(),
                    const SizedBox(height: 8),
                    const cabezeraPadres(),
                    const SizedBox(height: 3),
                    const datosPadres(),
                    const SizedBox(
                      height: 20,
                    ),
                    const cabezeraHuella(),
                    const SizedBox(
                      height: 3,
                    ),
                    const sethuella(),
                    const SizedBox(
                      height: 30,
                    )
                  ]),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          floatingActionButton: Row(
            children: [
              const SizedBox(
                width: 300,
              ),
              Column(
                children: [
                  Expanded(child: Container()),
                  FloatingActionButton(
                    heroTag: 'añadir_foto',
                    backgroundColor: const Color.fromRGBO(240, 144, 36, 6),
                    onPressed: _optionsDialogBox,
                    child: const Icon(Icons.add_a_photo_rounded),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FloatingActionButton(
                    heroTag: 'ruta_pdf',
                    backgroundColor: const Color.fromRGBO(240, 144, 36, 6),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const pdfPage()));
                    },
                    child: const Icon(Icons.download),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(174, 240, 145, 36),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: _openCamera,
                  child: const Text('Tomar Foto',
                      style:
                          TextStyle(color: Color.fromRGBO(195, 204, 115, 1))),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                GestureDetector(
                  onTap: _openGallery,
                  child: const Text('Seleccionar Foto',
                      style:
                          TextStyle(color: Color.fromRGBO(195, 204, 115, 1))),
                ),
              ],
            )),
          );
        });
  }

  Future _openCamera() async {
    PickedFile? pickerFile;
    pickerFile =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickerFile != null) {
        photo = File(pickerFile.path);
        //context.read<imageProvider>().setImage(pickedFile: pickerFile);
      }
    });
  }

  Future _openGallery() async {
    PickedFile? pickerFile;
    pickerFile =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickerFile != null) {
        photo = File(pickerFile.path);
        //context.read<imageProvider>().setImage(pickedFile: pickerFile);
      }
    });

    final directory = await getApplicationDocumentsDirectory();
    final name = '${DateTime.now()}.png';
    final path = '${directory.path}/$name';

    await photo!.copy(path);
  }

  void signOut() {
    Navigator.pop(context);
    FirebaseAuthMethods(FirebaseAuth.instance).signOut(context);
  }
}
