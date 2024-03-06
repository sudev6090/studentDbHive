import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/db/functions/db_functions.dart';
import 'package:project/db/model/data_model.dart';
// ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  EditScreen(
      {super.key,
      required this.name,
      required this.age,
      required this.phone,
      required this.place,
      required this.index,
      this.imagePath});
  final String name;
  final int age;
  final int phone;
  final String place;
  final int index;
  dynamic imagePath;
  @override
  State<EditScreen> createState() => _EditScreenState();
}
class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();
  final myColor =
      MaterialStateProperty.all(Color.fromARGB(255, 10, 10, 10));
  final _namecontrol = TextEditingController();
  final _agecontrol = TextEditingController();
  final _phonecontrol = TextEditingController();
  final _placecontrol = TextEditingController();
  File? _imagePick;
  @override
  void initState() {
    _namecontrol.text = widget.name;
    _agecontrol.text = widget.age.toString();
    _phonecontrol.text = widget.phone.toString();
    _placecontrol.text = widget.place;
    _imagePick = widget.imagePath != '' ? File(widget.imagePath) : null;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 158, 158, 167),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("EDIT DETAILS"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 10, 8, 10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Color.fromARGB(255, 7, 6, 7),
                  backgroundImage: _imagePick != null
                      ? FileImage(_imagePick!)
                      : null,
                ),
              ),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: myColor,
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)))),
                    onPressed: () {
                      _openImagePicker();
                    },
                    child: const Text("Add Image")),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  cursorColor: Color.fromARGB(255, 9, 7, 9),
                  controller: _namecontrol,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 96, 92, 92))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Color.fromARGB(255, 8, 7, 8))),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a Name';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  cursorColor: const Color.fromARGB(255, 10, 9, 10),
                  controller: _agecontrol,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Age',
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 96, 92, 92))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Color.fromARGB(255, 7, 6, 7))),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a Age';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  cursorColor: Color.fromARGB(255, 7, 6, 7),
                  controller: _phonecontrol,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Phone Number',
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 96, 92, 92))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Color.fromARGB(255, 8, 7, 8))),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a phone number';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  cursorColor: Color.fromARGB(255, 10, 9, 11),
                  controller: _placecontrol,
                  decoration: const InputDecoration(
                    hintText: 'Address',
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 96, 92, 92))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Color.fromARGB(255, 10, 8, 10))),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter the address';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: myColor,
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        updateall();
                        print("update");
                        clearText();
                      }
                    },
                    child: const Text('Apply Changes')),
              )
            ],
          ),
        )),
      ),
    );
  }
  void clearText() {
    _namecontrol.clear();
    _agecontrol.clear();
    _phonecontrol.clear();
    _placecontrol.clear();
    setState(() {
      _imagePick = null;
    });
  }
  Future<void> updateall() async {
    final newname = _namecontrol.text.trim();
    final newage = _agecontrol.text.trim();
    final newplace = _placecontrol.text.trim();
    final newphone = _phonecontrol.text.trim();
    final newimage = _imagePick!.path;
    if (newname.isEmpty ||
        newage.isEmpty ||
        newplace.isEmpty ||
        newphone.isEmpty ||
        newimage.isEmpty) {
      return;
    } else {
      final update = StudentModel(
          name: newname,
          age: int.parse(newage),
          place: newplace,
          phone: int.parse(newphone),
          image: newimage);
      editstudent(widget.index, update);
      showDialog(
          context: context,
          useSafeArea: true,
          builder: (context) => AlertDialog(
                scrollable: true,
                content: const Text('Changes Applied!'),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color.fromARGB(255, 6, 5, 6),
                          textStyle: const TextStyle(color: Colors.white)),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Text('OK'))
                ],
              ));
    }
  }
  void _openImagePicker() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicker =
        await picker.pickImage(source: ImageSource.gallery);
    if (imagePicker == null) return;
    setState(() {
      _imagePick = File(imagePicker.path);
    });
  }
}