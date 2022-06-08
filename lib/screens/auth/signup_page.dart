import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:winnie_user/extensions/emailvalidator.dart';

import '../../constants/constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  double xAlighment = -200;
  double yAlighment = 1;
  bool obscureFirstPassword = true;
  bool obscureSecondPassword = true;
  bool sendMessage = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  // late bool passwordMatch;

  // late String firstPassword;
  // late String secondPassword;
  // late String email;
  // late String name;

  // @override
  // void initState() {
  //   super.initState();
  //   firstPassword = '';
  //   secondPassword = '';
  //   name = '';
  //   email = '';
  //   if (firstPassword == secondPassword || secondPassword == firstPassword) {
  //     passwordMatch = true;
  //   }
  // }

  @override
  dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  onMoveContainer() {
    setState(() {
      xAlighment = 300;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: AppColors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  SizedBox(height: size.height * 0.13),
                  Text(
                    "Let's Get Started",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: AppColors.darkblue),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Create a new account",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(fontSize: 13),
                  ),
                  const SizedBox(height: 30),
                  _buildNameField(),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildEmail(),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildPassword(
                      () => setState(
                          () => obscureFirstPassword = !obscureFirstPassword),
                      obscureFirstPassword),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildConfirmPassword(
                    () => setState(
                        () => obscureSecondPassword = !obscureSecondPassword),
                    obscureSecondPassword,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      print(_emailController.value.text);
                      print(_nameController.value.text);
                      if (_formKey.currentState!.validate()) {
                        print("valid");
                      } else {
                        print("invalid");
                      }
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(2, 3),
                                color: AppColors.blue.withOpacity(0.3),
                                blurRadius: 10)
                          ]),
                      child: Center(
                          child: Text(
                        "Sign Up",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: AppColors.white),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Have an account?",
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(fontSize: 13),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Sign In",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: AppColors.blue),
                            )),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "You need to enter your name";
        }
        return null;
      },
      onChanged: (value) {},
      controller: _nameController,
      style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
        prefixIcon: Icon(
          Icons.person,
          color: AppColors.grey,
        ),
        hintText: "Full name",
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.red.withOpacity(0.5)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.red.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.blue.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.grey.withOpacity(0.3)),
        ),
      ),
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Email cannot be empty";
        } else if (value.getEmailValidation() == false) {
          return "Not a valid email";
        }
        return null;
      },
      onChanged: (value) {},
      controller: _emailController,
      style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
        prefixIcon: Icon(
          Icons.email_outlined,
          color: AppColors.grey,
        ),
        hintText: "Your email",
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.red.withOpacity(0.5)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.red.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.blue.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.grey.withOpacity(0.3)),
        ),
      ),
    );
  }

  Widget _buildPassword(void Function() onpressed, bool obscureFirstPassword) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter your password";
        }
        return null;
      },
      obscureText: obscureFirstPassword,
      onChanged: (value) {},
      controller: _passwordController,
      style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
        prefixIcon: Icon(
          Icons.email_outlined,
          color: AppColors.grey,
        ),
        suffixIcon: GestureDetector(
            onTap: onpressed,
            child: Icon(Icons.remove_red_eye_rounded,
                color: obscureFirstPassword ? AppColors.grey : AppColors.blue)),
        hintText: "Password",
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.red.withOpacity(0.5)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.red.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.blue.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.grey.withOpacity(0.3)),
        ),
      ),
    );
  }

  Widget _buildConfirmPassword(
      void Function() onpressed, bool obscureSecondPassword) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Confirm your password";
        } else if (value.isNotEmpty && _passwordController.value.text.isEmpty) {
          return "Enter first password";
        } else if (value.isNotEmpty &&
            value != _passwordController.value.text) {
          return "Password does not match";
        }
        return null;
      },
      obscureText: obscureSecondPassword,
      onChanged: (value) {},
      controller: _passwordConfirmController,
      style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
        prefixIcon: Icon(
          Icons.email_outlined,
          color: AppColors.grey,
        ),
        suffixIcon: GestureDetector(
            onTap: onpressed,
            child: Icon(Icons.remove_red_eye_rounded,
                color:
                    obscureSecondPassword ? AppColors.grey : AppColors.blue)),
        hintText: "Confirm Password",
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.red.withOpacity(0.5)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.red.withOpacity(0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.blue.withOpacity(0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
              BorderSide(width: 1.5, color: AppColors.grey.withOpacity(0.3)),
        ),
      ),
    );
  }
}

Future<void> signUpUser(
    GlobalKey<FormState> formKey, String password, String email) async {
  if (formKey.currentState!.validate()) {}
}
