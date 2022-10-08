import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_app/blocs/main/main_cubit.dart';
import 'package:poll_app/core/components/default_button.dart';
import 'package:poll_app/views/poll/candidate_item.dart';

import '../../core/styles/texts/app_text_styles.dart';

class PollScreen extends StatelessWidget {
  const PollScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocConsumer<MainCubit, MainState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = MainCubit.get(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "President",
                    style: AppTextStyle.headLine(),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => CandidateItem(
                              index: index,
                              text: cubit.candidates[index],
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                        itemCount: cubit.candidates.length),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  DefaultButton(onPress: () {}, text: "Vote")
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
