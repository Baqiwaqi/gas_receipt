import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../config/themes/constants.dart';
import '../cubit/auth_screen_cubit.dart';
import '../model/login_model.dart';

class RegisterView extends StatelessWidget {
  RegisterView({
    Key? key,
    required this.register,
    required this.isVisible,
    this.errorMessage,
  }) : super(key: key);

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final RegisterModel? register;
  final bool isVisible;
  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Get Started with W.any",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Login to start building your workout sessions.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<AuthScreenCubit>().logInWithGoogle();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // google logo asset
                  Image.asset(
                    'assets/icons/google-logo.png',
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Sign Up with Google",
                    style: TextStyle(color: Colors.grey[800], letterSpacing: 1),
                  ),
                ],
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
            const SizedBox(height: 32),
            // divider with text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.grey[500],
                  height: 1,
                  width: 90,
                ),
                const Spacer(),
                Text(
                  "Or Sign Up with email",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                Container(
                  color: Colors.grey[500],
                  height: 1,
                  width: 90,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // form
            FormBuilder(
                key: _fbKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email address",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FormBuilderTextField(
                      name: "email",
                      initialValue: register!.email ?? "",
                      decoration: const InputDecoration(hintText: "joanne@gmail.com", prefixIcon: Icon(Icons.mail_outline)),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                      onChanged: (value) => register!.email = value!,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FormBuilderTextField(
                      name: "password",
                      initialValue: register!.password ?? "",
                      decoration: const InputDecoration(
                        hintText: "*********",
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      obscureText: isVisible,
                      onChanged: (value) => register!.password = value!,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FormBuilderTextField(
                      name: "repeat password",
                      initialValue: register!.passwordRepeat ?? "",
                      decoration: InputDecoration(
                          hintText: "*********",
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: isVisible ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                            onPressed: () {
                              // toggle password visibility
                              context.read<AuthScreenCubit>().togglePasswordVisibilityRegister(register, !isVisible);
                            },
                          )),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        (value) {
                          if (value != register!.password) {
                            return "Passwords must match";
                          }
                          return null;
                        },
                      ]),
                      obscureText: isVisible,
                      onChanged: (value) => register!.passwordRepeat = value!,
                    )
                  ],
                )),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_fbKey.currentState!.saveAndValidate()) {
                  context.read<AuthScreenCubit>().signUpWithCredentials(register!);
                }
              },
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.grey[300], letterSpacing: 1),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
            ),
            // error message
            if (errorMessage != null) ...[const SizedBox(height: 16), Text(errorMessage!, style: const TextStyle(color: Colors.red))],
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                TextButton(
                  child: Text("Login",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.grey[800],
                      )),
                  onPressed: () => context.read<AuthScreenCubit>().login(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
