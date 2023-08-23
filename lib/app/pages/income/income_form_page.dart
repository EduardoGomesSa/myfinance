import 'package:flutter/material.dart';

class IncomeFormPage extends StatelessWidget{
  IncomeFormPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Text("Income Form Page"),
    );
  }
}