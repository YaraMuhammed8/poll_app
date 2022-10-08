import 'package:custom_radio_group_list/custom_radio_group_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_app/blocs/main/main_cubit.dart';
import 'package:poll_app/core/styles/texts/app_text_styles.dart';

import '../../core/styles/colors/app_colors.dart';

class CandidateItem extends StatelessWidget {
  CandidateItem({Key? key, required this.index, required this.text})
      : super(key: key);
  int index;
  String text;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return GestureDetector(
          onTap: () {
            cubit.selectCandidate(index);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.primaryColor, width: 1)),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: AppTextStyle.title(),
                  ),
                ),
                Icon(
                  (cubit.selectedCandidate == index)
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ); //RadioGroup(
        //   radioList:cubit.candidates,
        //     selectedItem: cubit.selectedCandidate,
        //     onChanged: (value) {
        //       print('Value : ${value}');
        //       cubit.selectCandidate(value);
        //     },
        //     disabled: true);
      },
    );
  }
}
