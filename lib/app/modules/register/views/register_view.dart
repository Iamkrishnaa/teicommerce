import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_styles.dart';
import '../../../widgets/buttons/custom_rounded_button.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  final RegisterController registerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.adb_rounded,
                      size: 50,
                      color: AppColors.colorPaletteA,
                    ),
                    Text(
                      "Teicommerce",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Shop without limits",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  child: Text(
                    "Your full name",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                TextFormField(
                  controller: registerController.fullNameController,
                  decoration: InputDecoration(
                    border: kRoundedTextFormFieldBorder,
                    focusedBorder: kRoundedTextFormFieldBorder,
                    enabledBorder: kRoundedTextFormFieldBorder,
                    hintText: "Full Name",
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 20,
                    ),
                    // prefixIcon: const Icon(
                    //   Icons.email,
                    // ),

                    // suffixIcon: Icon(
                    //   Icons.check,
                    // ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  child: Text(
                    "Your email address",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                TextFormField(
                  controller: registerController.emailController,
                  decoration: InputDecoration(
                    border: kRoundedTextFormFieldBorder,
                    focusedBorder: kRoundedTextFormFieldBorder,
                    enabledBorder: kRoundedTextFormFieldBorder,
                    hintText: "Email",
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 20,
                    ),
                    // prefixIcon: const Icon(
                    //   Icons.email,
                    // ),

                    // suffixIcon: Icon(
                    //   Icons.check,
                    // ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  child: Text(
                    "Enter new username",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                TextFormField(
                  controller: registerController.emailController,
                  decoration: InputDecoration(
                    border: kRoundedTextFormFieldBorder,
                    focusedBorder: kRoundedTextFormFieldBorder,
                    enabledBorder: kRoundedTextFormFieldBorder,
                    hintText: "Email",
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 20,
                    ),
                    // prefixIcon: const Icon(
                    //   Icons.email,
                    // ),

                    // suffixIcon: Icon(
                    //   Icons.check,
                    // ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  child: Text(
                    "Your password",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                TextFormField(
                  controller: registerController.passwordController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    border: kRoundedTextFormFieldBorder,
                    focusedBorder: kRoundedTextFormFieldBorder,
                    enabledBorder: kRoundedTextFormFieldBorder,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 20,
                    ),
                    hintText: "Password",
                    // prefixIcon: Icon(
                    //   Icons.password,
                    // ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomRoundedButton(
                  color: Colors.grey.shade300,
                  onTap: () {
                    // LoginRequest loginRequest = LoginRequest(
                    //   email: loginController.emailController.text,
                    //   password: loginController.passwordController.text,
                    // );
                    // Get.showOverlay(
                    //   asyncFunction: () async {
                    //     await loginController.loginUser(loginRequest);
                    //   },
                    //   loadingWidget: const Center(
                    //     child: CircularProgressIndicator(),
                    //   ),
                    // );
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Continue",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    TextButton(
                      onPressed: () {
                        Get.toNamed("login");
                      },
                      child: const Text("Login"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
