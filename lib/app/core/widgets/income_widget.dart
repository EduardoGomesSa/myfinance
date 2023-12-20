import 'package:flutter/material.dart';
import 'package:myfinance/app/core/config/app_colors.dart';
import 'package:myfinance/app/models/income_model.dart';
import 'package:myfinance/app/pages/income/income_info_page.dart';

class IncomeWidget extends StatelessWidget{
  const IncomeWidget({
    super.key,
    required this.model
  });

  final IncomeModel model;

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => IncomeInfoPage(income: model)
          )
        );
      },

      child: Card(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.backgroundComponent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    "${model.title}",
                    style: const TextStyle(
                      fontSize: 14, color: AppColors.primaryText
                    ),
                  ),

                  const SizedBox(height: 4),
                  Text(
                    "${model.value}",
                    style: const TextStyle(
                      fontSize: 14, color: AppColors.primaryText
                    ),
                  ),

                  const SizedBox(height: 3),
                  Text(
                    "${model.remained}",
                    style: const TextStyle(
                      fontSize: 10, color: AppColors.secundaryText
                    )
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}