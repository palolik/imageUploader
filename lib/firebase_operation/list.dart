import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:/update.dart';
//import 'package:webcheck2/pages/coachingpages/add_coaching_page.dart';

class addstudent extends StatefulWidget {
  const addstudent({super.key});

  @override
  State<addstudent> createState() => _addstudentState();
}

class _addstudentState extends State<addstudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //    body: AddStudentPage(),
        );
  }
}

class ListStudentPage extends StatefulWidget {
  const ListStudentPage({Key? key}) : super(key: key);

  @override
  _ListStudentPageState createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
  final Stream<QuerySnapshot> studentsStream = FirebaseFirestore.instance
      .collection('coachings')
      .snapshots(); //the collection name goes here

  // For Deleting User
  CollectionReference coachinglist = FirebaseFirestore.instance
      .collection('coachings'); // collection name goes here
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return coachinglist
        .doc(id)
        .delete()
        // ignore: avoid_print
        .then((value) => print('User Deleted'))
        // ignore: avoid_print
        .catchError((error) => print('Failed to Delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            // ignore: avoid_print
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id; // calls by the id of the data table
          }).toList();

          return Material(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    1: FixedColumnWidth(140),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      // refers to the row  just as html
                      children: [
                        TableCell(
                          // refers to the cell of  that row
                          child: Container(
                            color: Colors.redAccent,
                            child: const Center(
                              child: Text(
                                'Coaching',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          // extra added column
                          child: Container(
                            color: Colors.redAccent,
                            child: const Center(
                              child: Text(
                                'classes',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            color: Colors.redAccent,
                            child: const Center(
                              child: Text(
                                'subject',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            color: Colors.redAccent,
                            child: const Center(
                              child: Text(
                                'Address',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            color: Colors.redAccent,
                            child: const Center(
                              child: Text(
                                'Action',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ), //the first header row ends here
                    for (var i = 0; i < storedocs.length; i++) ...[
                      // it sets the number of rows , the more data is added the more rows are shown
                      TableRow(children: [
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['coaching'],
                                  style: const TextStyle(fontSize: 12.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['class'],
                                  style: const TextStyle(fontSize: 12.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['subject'],
                                  style: const TextStyle(fontSize: 12.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text(storedocs[i]['address'],
                                  style: const TextStyle(fontSize: 12.0))),
                        ),
                        //   TableCell(
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         IconButton(
                        //           onPressed: () => {
                        //             Navigator.push(
                        //               context,
                        //               // MaterialPageRoute(
                        //               //   builder: (context) => UpdateStudentPage(
                        //               //       id: storedocs[i]['id']),
                        //               // ),
                        //             // )
                        //           // },
                        //           icon: const Icon(
                        //             Icons.edit,
                        //             color: Colors.red,
                        //           ),
                        //         ),
                        //         IconButton(
                        //           onPressed: () => {
                        //             deleteUser(storedocs[i]['id'])
                        //           }, // this one delets the user from the datatable
                        //           icon: const Icon(
                        //             Icons.delete,
                        //             color: Colors.red,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                      ]),
                    ],
                  ],
                ),
              ),
            ),
          );
        });
  }
}
