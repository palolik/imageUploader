import 'package:flutter/material.dart';
import 'package:icrud/firebase_operation/home.dart';
import 'package:icrud/firebase_operation/add.dart';

import 'package:icrud/firebase_operation/update.dart';

import 'package:icrud/firebase_operation/delete.dart';

class Crud extends StatelessWidget {
  const Crud({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddStudentPage()));
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.deepPurple,
            child: Text(
              "add products",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => UpdatePage()));
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.deepPurple,
            child: Text(
              "update products",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => DeletePage()));
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.deepPurple,
            child: Text(
              "delete products",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => AddfdPage()));
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.deepPurple,
            child: Text(
              "Add products",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    ));
  }
}
