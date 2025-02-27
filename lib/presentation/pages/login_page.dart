import 'package:chat_app/auth/authentication.dart';
import 'package:chat_app/constands/sizes.dart';
import 'package:chat_app/presentation/widgets/custom_button.dart';
import 'package:chat_app/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key, required this.ontap});

  final void Function()? ontap;

  void login(BuildContext context) async {
    // auth method

    final authService = AuthService();
    
    // try login
    try {
      await authService.signInWithEmailPassowrd(
          _emailController.text, _passwordController.text);

    //catch errors
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo icon
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            // sized box called from another class
            Appsizes.sizeFifty,
            // welcome text
            Text(
              "Welcome back, you've been missed!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            Appsizes.sizeTwentyFive,
            // email custome textfield
            CustomTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
              icon: const Icon(Icons.email_outlined),
            ),

            Appsizes.sizeTen,

            // password textfield
            CustomTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
              icon: const Icon(Icons.password),
            ),

            Appsizes.sizeTwentyFive,

            // custom button
            CustomButton(
              ontap: () => login(context),
              buttonText: "Login",
            ),

            Appsizes.sizeTwentyFive,

            // last text section for change to register screen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Not a member?"),
                InkWell(
                  onTap: ontap,
                  child: Text(
                    " Register now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        //fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
