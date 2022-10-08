import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:poll_app/blocs/login/login_cubit.dart';
import 'package:poll_app/core/utils/navigation.dart';
import 'package:poll_app/views/poll/poll_screen.dart';

import '../../Models/user.dart';
import '../../core/components/default_button.dart';
import '../../core/components/default_text_form_field.dart';
import '../../core/styles/texts/app_text_styles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "User name",
                    style: AppTextStyle.bodyText(),
                  ),
                  DefaultTextFormField(
                    textInputType: TextInputType.name,
                    controller: userNameController,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Password",
                    style: AppTextStyle.bodyText(),
                  ),
                  DefaultTextFormField(
                    textInputType: TextInputType.visiblePassword,
                    controller: passwordController,
                    isPassword: true,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      // TODO: implement listener
                      if (state is LoginErrorState) {
                        Fluttertoast.showToast(
                            msg: "An Error has occured",
                            backgroundColor: Colors.black54);
                      } else if (state is LoginSuccessfulState) {
                        NavigationUtils.navigateTo(
                            context: context, destinationScreen: PollScreen());
                      }
                    },
                    builder: (context, state) {
                      return (state is LoginLoadingState)
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : DefaultButton(
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  User user = User(
                                      username: userNameController.text,
                                      password: passwordController.text);
                                  LoginCubit.get(context).login(user);
                                }
                              },
                              text: "Login");
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
