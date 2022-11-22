import 'package:ecomm_bloc/bloc/authbloc/auth_bloc.dart';
import 'package:ecomm_bloc/presentation/Auth/signup_page.dart';
import 'package:ecomm_bloc/presentation/common/progress_dialog.dart';
import 'package:ecomm_bloc/presentation/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../constants/color.dart';
import '../../constants/images.dart';
import '../custom/custom_form_field.dart';
import '../custom/custome_button.dart';
import 'forgotpassword_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            ProgressDialog.show(context);
          } else if (state is LoginSuccess) {
            ProgressDialog.hide(context);
            Fluttertoast.showToast(
                msg: "Login Successfull",
                textColor: Colors.black,
                backgroundColor: Colors.white.withOpacity(0.7));

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const DashboardPage()));
          } else if (state is LoginError) {
            ProgressDialog.hide(context);
            Fluttertoast.showToast(
                msg: state.exception.toString(),
                backgroundColor: AppColors.redcommen);
          }
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 99.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? AppColors.simplewhite
                              : AppColors.commenTextColor,
                          fontSize: 31),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    CustomFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        inputAction: TextInputAction.done,
                        hint: "Email",
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Required *'),
                          EmailValidator(errorText: "Not a valid email"),
                        ])),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomFormField(
                        isObscure: _isObscure,
                        postIconBtn: IconButton(
                            icon: Icon(
                                color: isDarkMode
                                    ? AppColors.subtextdark
                                    : AppColors.subtextlight,
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        controller: _passwordController,
                        keyboardType: TextInputType.emailAddress,
                        inputAction: TextInputAction.done,
                        hint: "Password",
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Required *'),
                          MinLengthValidator(6,
                              errorText: "Should Be at least 6 character"),
                          MaxLengthValidator(14,
                              errorText: "Should be atmost 14 character")
                        ])),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ForgotpasswordPage()));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: AppColors.redcommen,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        title: "Login",
                        tapActivity: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            AuthBloc loginBloc =
                                BlocProvider.of<AuthBloc>(context);
                            loginBloc.add(LoginEvent(_emailController.text,
                                _passwordController.text));
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: isDarkMode
                                  ? AppColors.subtextdark
                                  : AppColors.subtextlight),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SignupPage()));
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: AppColors.redcommen,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Or",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black38),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textbtn(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textbtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("facebook login");
      },
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: AppColors.fbbtnborder)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImageName.fb,
              width: 12,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              "Login with facebook",
              style: TextStyle(
                  fontSize: 18,
                  color: AppColors.fbcolor,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
