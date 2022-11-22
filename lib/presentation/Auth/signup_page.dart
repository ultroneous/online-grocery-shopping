import 'package:ecomm_bloc/bloc/authbloc/auth_bloc.dart';
import 'package:ecomm_bloc/presentation/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../constants/color.dart';
import '../common/progress_dialog.dart';
import '../custom/custom_form_field.dart';
import '../custom/custome_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _firstnameController = TextEditingController();

  final TextEditingController _lastnameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _cpasswordController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isObscure1 = true;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignupLoading) {
            ProgressDialog.show(context);
          } else if (state is SignupSuccess) {
            ProgressDialog.hide(context);
            Fluttertoast.showToast(
                msg: "Signing Successfull",
                textColor: Colors.black,
                backgroundColor: Colors.white.withOpacity(0.7));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const DashboardPage()));
          } else if (state is SignupError) {
            ProgressDialog.hide(context);
            Fluttertoast.showToast(
                msg: state.exception.toString(),
                backgroundColor: AppColors.redcommen);
          }
        },
        child: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 55.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sign up",
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
                    controller: _firstnameController,
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.done,
                    hint: "First Name",
                    validator: MultiValidator([
                      RequiredValidator(errorText: "First Name cannot be empty")
                    ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormField(
                    controller: _lastnameController,
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.done,
                    hint: "Last Name",
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Last Name cannot be empty")
                    ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.done,
                    hint: "Email",
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Email ID cannot be empty"),
                      EmailValidator(errorText: "Not a valid email")
                    ]),
                  ),
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
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormField(
                    isObscure: _isObscure1,
                    postIconBtn: IconButton(
                        icon: Icon(
                            color: isDarkMode
                                ? AppColors.subtextdark
                                : AppColors.subtextlight,
                            _isObscure1
                                ? Icons.visibility
                                : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure1 = !_isObscure1;
                          });
                        }),
                    controller: _cpasswordController,
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.done,
                    hint: "Confirm Password",
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText: "Re-Enter Password cannot be empty"),
                    ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.emailAddress,
                    inputAction: TextInputAction.done,
                    hint: "Enter Mobile Number",
                    validator: MultiValidator([
                      //  PatternValidator(r'^(?:[+0]9)?[0-9]{10}$',
                      //     errorText: 'Enter Mobile Number valid')
                    ]),
                  ),
                  const SizedBox(
                    height: 66,
                  ),
                  CustomButton(
                      title: "Sign Up",
                      tapActivity: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          AuthBloc loginBloc =
                              BlocProvider.of<AuthBloc>(context);
                          loginBloc.add(SignupEvent(
                              _firstnameController.text +
                                  _lastnameController.text,
                              _emailController.text,
                              _passwordController.text,
                              _cpasswordController.text));
                        }
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: isDarkMode
                              ? AppColors.subtextdark
                              : AppColors.subtextlight,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: AppColors.redcommen,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
            //   ],
            // ),
            ),
      ),
    );
  }
}
