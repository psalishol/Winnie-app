import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:winnie_user/screens/auth/signup_page.dart';
import 'package:winnie_user/screens/home_screen/custom_home_screen.dart';

import '/constants/constants.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool obscureText = true;
  bool processing = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: AppColors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(children: [
              SizedBox(height: size.height * 0.13),
              Text(
                "Welcome to Winnie",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: AppColors.darkblue),
              ),
              const SizedBox(height: 5),
              Text(
                "Sign in to continue",
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(height: 30),
              _buildTextField(
                  controller: _emailController,
                  hint: "Your Email",
                  icon: Icons.email_outlined,
                  isPassword: false),
              const SizedBox(
                height: 10,
              ),
              _buildTextField(
                  controller: _passwordController,
                  hint: "Password",
                  icon: Icons.lock_outline,
                  isPassword: true,
                  obscureText: obscureText,
                  onpressed: () => setState(() => obscureText = !obscureText),
                  suffixColor: obscureText ? AppColors.grey : AppColors.blue),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: signInUser,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  // margin: const EdgeInsets.symmetric(horizontal: 15),
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
                      child: processing
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ))
                          : Text(
                              "Sign In",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: AppColors.white),
                            )),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Divider(
                    // height: 10,
                    // thickness: 20,
                    color: AppColors.grey,
                  ),
                  Text("OR",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: AppColors.grey)),
                  Divider(color: AppColors.grey)
                ],
              ),
              SizedBox(height: size.height * 0.03),
              _buildAlternativeLoginContainer(
                  "images/inapp/google.jpg", "Login with Google"),
              const SizedBox(height: 10),
              _buildAlternativeLoginContainer(
                  "images/inapp/facebook.jpg", "Login with Facebook"),
              SizedBox(height: size.height * 0.08),
              Text("Forgot Password?",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: AppColors.blue)),
              const SizedBox(height: 5),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 13),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                        onTap: () {
                          _formKey.currentState!.reset();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                        },
                        child: Text(
                          "Register",
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
    );
  }

  Future<void> signInUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() => processing = true);
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.value.text,
            password: _passwordController.value.text);
        _formKey.currentState!.reset();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const CustomHomeScreen()));
      } on FirebaseAuthException catch (e) {
        print(e);
        setState(() => processing = false);
        if (e.code == 'network-request-failed') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Couldn't connect to the Internet"),
                Icon(
                  Icons.wifi_off,
                  color: AppColors.white,
                )
              ],
            ),
          )));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Unexpected Error Occured")));
        }
      }
    }
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String hint,
      required IconData icon,
      required bool isPassword,
      Color? suffixColor,
      void Function()? onpressed,
      bool? obscureText}) {
    return TextFormField(
      validator: (value) {
        if (!isPassword && value!.isEmpty) {
          return "Enter your email";
        } else if (isPassword && value!.isEmpty) {
          return "Enter your password";
        }
        return null;
      },
      controller: controller,
      obscureText: isPassword ? obscureText! : false,
      style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 15),
      decoration: InputDecoration(
        hintStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
        prefixIcon: Icon(
          icon,
          color: AppColors.grey,
        ),
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: onpressed,
                child: Icon(Icons.remove_red_eye_rounded, color: suffixColor!))
            : const SizedBox(),
        hintText: hint,
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

  Widget _buildAlternativeLoginContainer(String logoPath, String name) {
    return GestureDetector(
      onTap: () {
        print("Login with alternative clicked!");
      },
      child: Container(
        height: 54,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
            border:
                Border.all(width: 1.5, color: AppColors.grey.withOpacity(0.2))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
              height: 30,
              width: 30,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Image(
                image: AssetImage(logoPath),
                fit: BoxFit.cover,
              )),
          // const SizedBox(width: 100,),
          Text(
            name,
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
          ),
          const SizedBox(),
        ]),
      ),
    );
  }
}

// extension EmailValidator on String {
//   bool getEmailValidation() {
//     return RegExp(r'^[a-zA-Z0-9] $').hasMatch(this);
//   }
// }
