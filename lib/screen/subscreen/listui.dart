import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project/db/functions/db_functions.dart';
import 'package:project/db/model/data_model.dart';
import 'package:project/screen/subscreen/edit_student.dart';
import 'package:project/screen/subscreen/view_student.dart';
class ListUi extends StatefulWidget {
  const ListUi({super.key});
  @override
  State<ListUi> createState() => _ListUiState();
}
class _ListUiState extends State<ListUi> {
  final _searchController = TextEditingController();
  String search = '';
  bool isDeleted = false;
  @override
  Widget build(BuildContext context) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 30, right: 30, bottom: 5),
                  child: TextFormField(
                    controller: _searchController,
                    onChanged: (String? value) {
                      setState(() {
                        search = value.toString();
                      });
                    },
                    style: const TextStyle(
                        color: Color.fromARGB(255, 10, 10, 10)),
                    cursorColor: const Color.fromARGB(255, 10, 10, 10),
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Search',
                        labelStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                  ),
                ),
                Expanded(
                  child: ValueListenableBuilder(valueListenable: studentListNotifier,         
                    builder: (context,List<StudentModel>studentlist,child) {
                      return ListView.builder(
                        itemCount: studentlist.length,
                        itemBuilder: (context, index) {
                          final data =
                              studentlist[index];
                          late String nameList = data.name.toString();
                          late String ageList = data.age.toString();
                          if (_searchController.text.isEmpty) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ViewStudentScreen(
                                          name: data.name!,
                                          age: data.age.toString(),
                                          place: data.place,
                                          phone: data.phone.toString(),
                                          imagePath: data.image!,
                                        )));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                    backgroundImage: data.image != null
                                        ? FileImage(File(data.image!))
                                        : const AssetImage(
                                                'assets/images/avatar.png')
                                            as ImageProvider),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditScreen(
                                                        index: index,
                                                        name: data.name!,
                                                        age: data.age,
                                                        phone: data.phone,
                                                        place: data.place,
                                                        imagePath: data.image,
                                                      )));
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Color.fromARGB(
                                              255, 10, 10, 10),
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              useSafeArea: true,
                                              builder: (context) =>
                                                  AlertDialog(
                                                    scrollable: true,
                                                    title:
                                                        const Text('Delete'),
                                                    content: const Text(
                                                        'Are you sure?'),
                                                    actions: [
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .redAccent),
                                                          onPressed: () {
                                                            deleteStudent(
                                                                index);
                                                            print('delete');
                                                            isDeleted = true;
                                                            if (isDeleted ==
                                                                true) {
                                                              Navigator.pop(
                                                                  context);
                                                            }
                                                          },
                                                          child: const Text(
                                                            "Delete",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                            'Cancel',
                                                            style: TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                       255, 10, 10, 10)),
                                                          ))
                                                    ],
                                                  ));
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Color.fromARGB(255, 9, 8, 8),
                                        )),
                                  ],
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(data.name!),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('age: ${data.age.toString()}'),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else if (nameList.toLowerCase().contains(
                              _searchController.text.toLowerCase())||ageList.toLowerCase().contains(
                              _searchController.text.toLowerCase())) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ViewStudentScreen(
                                          name: data.name!,
                                          age: data.age.toString(),
                                          place: data.place,
                                          phone: data.phone.toString(),
                                          imagePath: data.image!,
                                        )));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                    backgroundImage: data.image != null
                                        ? FileImage(File(data.image!))
                                        : const AssetImage(
                                                'assets/images/avatar.png')
                                            as ImageProvider),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditScreen(
                                                        index: index,
                                                        name: data.name!,
                                                        age: data.age,
                                                        phone: data.phone,
                                                        place: data.place,
                                                        imagePath: data.image,
                                                      )));
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Color.fromARGB(
                                              255, 10, 10, 10),
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              useSafeArea: true,
                                              builder: (context) =>
                                                  AlertDialog(
                                                    scrollable: true,
                                                    title:
                                                        const Text('Delete'),
                                                    content: const Text(
                                                        'Are you sure?'),
                                                    actions: [
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      const Color.fromARGB(255, 0, 0, 0)),
                                                          onPressed: () {
                                                            deleteStudent(
                                                                index);
                                                            print('delete');
                                                            isDeleted = true;
                                                            if (isDeleted ==
                                                                true) {
                                                              Navigator.pop(
                                                                  context);
                                                            }
                                                          },
                                                          child: const Text(
                                                            "Delete",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          )),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Text(
                                                              'Cancel'))
                                                    ],
                                                  ));
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Color.fromARGB(255, 8, 6, 6),
                                        )),
                                  ],
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(nameList),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('age: ${data.age.toString()}'),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    }
                  ),
                ),
              ],
            );     
  }
}