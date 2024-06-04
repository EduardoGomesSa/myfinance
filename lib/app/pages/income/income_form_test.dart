import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myfinance/app/core/widgets/text_field_widget.dart';

class IncomeFormTest extends StatelessWidget {
  const IncomeFormTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Card(
        child: Column(
          children: [
            TextFieldWidget(
              icon: Icons.title,
              label: "Título",
            ),
            TextFieldWidget(
              icon: Icons.money,
              label: "Ganho",
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
