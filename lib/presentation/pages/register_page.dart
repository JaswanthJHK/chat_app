import 'package:chat_app/constands/sizes.dart';
import 'package:chat_app/presentation/widgets/custom_button.dart';
import 'package:chat_app/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  RegisterPage({super.key, required this.onTap});
  final void Function()? onTap;

  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            Appsizes.sizeFifty,
            Text(
              "Let's create an account for you!",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            Appsizes.sizeTwentyFive,
            CustomTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
              icon: const Icon(Icons.email_outlined),
            ),
            Appsizes.sizeTen,
            CustomTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _passwordController,
              icon: const Icon(Icons.password),
            ),
            Appsizes.sizeTen,
            CustomTextfield(
              hintText: "Confirm password",
              obscureText: true,
              controller: _confirmPasswordController,
              icon: const Icon(Icons.password),
            ),
            Appsizes.sizeTwentyFive,
            CustomButton(
              ontap: register,
              buttonText: "Register",
            ),
            Appsizes.sizeTwentyFive,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                InkWell(
                  onTap: onTap,
                  child: Text(
                    " Login now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        //fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
