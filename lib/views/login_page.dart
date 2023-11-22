import 'dart:developer';

import 'package:btl/cubit/user_cubit.dart';
import 'package:btl/data/login_request.dart';
import 'package:btl/data/user_response.dart';
import 'package:btl/views/component/button_signup.dart';
import 'package:btl/views/component/logo.dart';
import 'package:btl/views/component/text_field.dart';
import 'package:btl/views/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:btl/views/sign_in.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();
    final UserCubit userCubit = UserCubit();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: BlocProvider(
        create: (context) => userCubit,
        child: BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state is LoginAdminSuccess || state is LoginUserSuccess) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ));
            } else {
              log(state.toString());
            }
          },
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Welcome back you've been missed!",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                    hintText: "Username",
                    obscureText: false,
                    controller: userNameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextField(
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true),
                  const SizedBox(height: 10),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButton(onTap: () async {
                    userCubit.loginRequest(LoginRequest(
                        username: userNameController.text.trim(),
                        password: passwordController.text.trim()));
                  }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const MainPage(),
                      //     ));

                      ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Or continue with",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey.shade700),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MySquare(imagePath: "asset/images/apple.png"),
                      SizedBox(
                        width: 20,
                      ),
                      MySquare(imagePath: "asset/images/google.png")
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Chưa có tài khoản ? ",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInPage(),
                              ));
                        },
                        child: Text(
                          "Đăng kí ngay",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
