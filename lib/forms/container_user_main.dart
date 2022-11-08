import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttersupabase/pages_user_main/user_image_text.dart';
import 'package:fluttersupabase/pages_user_main/user_new_note.dart';
import 'package:fluttersupabase/pages_user_main/user_read_qr_android.dart';
import 'package:fluttersupabase/pages_user_main/user_read_qr_ios.dart';
import 'package:fluttersupabase/pages_user_main/user_translate.dart';

class ContainerUserMain extends StatefulWidget {
  const ContainerUserMain({super.key});

  @override
  State<ContainerUserMain> createState() => _ContainerUserMainState();
}

class _ContainerUserMainState extends State<ContainerUserMain> {
  Future<void> _newNote(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const NewNote(),
        ));
  }

  Future<void> _scannerQRIOS(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ReadQRIOS(),
        ));
  }
Future<void> _translate(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Translate(),
        ));
  }
  Future<void> _scannerQRANDROID(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ReadQRANDROID(),
        ));
  }
Future<void> _textImage(BuildContext context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TextImage(),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.2),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  child: GestureDetector(
                    onTap: () {
                      _newNote(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white),
                      height: 100,
                      child: Row(
                        children: const [
                          Image(
                            image: AssetImage('images/notes.png'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'LISTA DE NOTAS',
                            style: TextStyle(fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  child: GestureDetector(
                    onTap: () {
                      if (Platform.isAndroid) {
                        _scannerQRANDROID(context);
                      } else {
                        _scannerQRIOS(context);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white),
                      height: 100,
                      child: Row(
                        children: const [
                          Image(
                            image: AssetImage('images/qr.png'),
                          ),
                          Text(
                            'LECTOR DE CÓDIGO QR\nY CÓDIGO DE BARRAS',
                            style: TextStyle(fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  child: GestureDetector(
                    onTap: () {
                      _translate(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white),
                      height: 100,
                      child: Row(
                        children: const [
                          Image(
                            image: AssetImage('images/translate.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'TRADUCTOR DE TEXTO',
                            style: TextStyle(fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  child: GestureDetector(
                    onTap: () {
                      _textImage(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white),
                      height: 100,
                      child: Row(
                        children: const [
                          Image(
                            image: AssetImage('images/capturetext.png'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'TEXTO EN IMAGEN',
                            style: TextStyle(fontSize: 22),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
