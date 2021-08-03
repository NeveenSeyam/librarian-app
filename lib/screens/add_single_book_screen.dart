import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'package:librarian_app/screens/home_page_screen.dart';
import 'dart:io';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

import 'package:path/path.dart';

class AddSingleBokScreen extends StatefulWidget {
  static final routname = "AddSingleBokScreen";

  @override
  _AddSingleBokScreenState createState() => _AddSingleBokScreenState();
}

class _AddSingleBokScreenState extends State<AddSingleBokScreen> {
  final books = FirebaseFirestore.instance;
  File _imageFile;
  String _url;
  final author = TextEditingController();
  final publishing = TextEditingController();
  final bookTitle = TextEditingController();
  final barCode = TextEditingController();
  final aboutBook = TextEditingController();

  Future pickImage() async {
    final pickedFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (pickedFile == null) {
      return;
    }
    print(path.basename(pickedFile.path));
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  String _scanBarcode = 'Unknown';

  Future<void> addBooks(Map<String, dynamic> data, BuildContext context) {
    return books.collection('books').add(data).then((value) {
      print("books Added");
      Navigator.of(context).pushNamed(HomePageScreen.routname);
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future uploadImageToFirebase(File _imageFile, BuildContext context) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("books" + DateTime.now().toString());
    UploadTask uploadTask = ref.putFile(_imageFile);
    uploadTask.then((res) {
      res.ref.getDownloadURL().then((value) {
        print("value : " + value.toString());
        _url = value;
        final data = {
          'about_book': aboutBook.text.toString(),
          'bar_code': _scanBarcode.toString(),
          'book_pic': _url,
          'title': bookTitle.text.toString(),
          'author': author.text.toString(),
          'publishing_house': publishing.text.toString()
        };
        addBooks(data, context);
      });
    });
  }

  final _form = GlobalKey<FormState>();
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      if (barcodeScanRes == "-1") {
        _scanBarcode = 'Unknown';
      } else {
        _scanBarcode = barcodeScanRes;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add New Book",
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                SizedBox(
                  height: 15.0,
                ),
                GestureDetector(
                  onTap: () {
                    pickImage();
                  },
                  child: Container(
                    width: size.width * 0.3,
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: _imageFile == null
                        ? Image.asset(
                            'assets/images/img_popular_book1.png',
                            fit: BoxFit.cover,
                          )
                        : Image.file(_imageFile),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: bookTitle,
                          decoration: InputDecoration(
                            labelText: "Book Title",
                            border: InputBorder.none,
                            labelStyle: TextStyle(fontSize: 15),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          style: TextStyle(fontSize: 15),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a valid name';
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: author,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            labelText: "Author Name",
                            labelStyle: TextStyle(fontSize: 15),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          style: TextStyle(fontSize: 15),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a valid name';
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: publishing,
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            labelText: "Publishing House",
                            labelStyle: TextStyle(fontSize: 15),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          style: TextStyle(fontSize: 15),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a valid name';
                            }

                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          controller: aboutBook,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "About Book",
                            labelStyle: TextStyle(fontSize: 15),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          style: TextStyle(fontSize: 15),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please fill in this field';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextFormField(
                                controller: barCode,
                                enableInteractiveSelection:
                                    false, // will disable paste operation
                                focusNode: new AlwaysDisabledFocusNode(),

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: _scanBarcode == "Unknown"
                                      ? "Scan Bar Code"
                                      : _scanBarcode,
                                  labelStyle: TextStyle(fontSize: 15),
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 10),
                                ),
                                style: TextStyle(fontSize: 15),
                                validator: (value) {
                                  if (_scanBarcode == "Unknown") {
                                    return 'You must take barCode';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.qr_code_scanner),
                              color: Colors.black,
                              iconSize: 27,
                              onPressed: () {
                                scanBarcodeNormal();
                              },
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      RaisedButton(
                        onPressed: () {
                          //  Navigator.of(context).p
                        },
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: GestureDetector(
                          onTap: () {
                            final isValid = _form.currentState.validate();
                            if (!isValid) {
                              return;
                            }
                            _form.currentState.save();

                            if (isValid == true) {
                              if (_imageFile != Null &&
                                  _scanBarcode != "Unknown") {
                                uploadImageToFirebase(_imageFile, context);
                              }
                            }
                          },
                          child: Container(
                            height: 50.0,
                            child: Center(
                              child: Text(
                                "Add New Book",
                                style: TextStyle(
                                  fontSize: 19.0,
                                  fontFamily: "Schyler",
                                ),
                              ),
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
