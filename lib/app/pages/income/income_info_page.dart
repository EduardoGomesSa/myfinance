import 'package:flutter/material.dart';
import 'package:myfinance/app/models/income_model.dart';

class IncomeInfoPage extends StatelessWidget{
  IncomeInfoPage({Key? key, required IncomeModel this.income}) : super(key: key);

  final IncomeModel income;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Text("Tela com informações sobre os Incomes"),
    );
  }
}