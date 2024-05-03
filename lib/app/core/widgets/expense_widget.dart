import 'package:flutter/material.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/models/expense_model.dart';

class ExpenseWidget extends StatelessWidget {
  const ExpenseWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ExpenseModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.backgroundComponent,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${model.bill?.name}",
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryText,
              ),
            ),
            const SizedBox(width: 8), // Adiciona um espaço entre os textos
            Text(
              "${model.value}",
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
