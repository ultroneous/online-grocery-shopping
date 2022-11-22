import 'package:ecomm_bloc/bloc/authbloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../Constants/color.dart';
import '../common/progress_dialog.dart';
import '../custom/custom_form_field.dart';
import '../custom/custome_button.dart';

class ChangepasswordPage extends StatefulWidget {
  const ChangepasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangepasswordPage> createState() => _ChangepasswordPageState();
}

class _ChangepasswordPageState extends State<ChangepasswordPage> {
  final TextEditingController _oldpasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ChangepassLoading) {
            ProgressDialog.show(context);
          } else if (state is ChangepassSuccess) {
            ProgressDialog.hide(context);
            Fluttertoast.showToast(
                msg: "Change Password Successfull",
                textColor: Colors.black,
                backgroundColor: Colors.white.withOpacity(0.7));

            Navigator.pop(context);
          } else if (state is ChangepassError) {
            ProgressDialog.hide(context);
            Fluttertoast.showToast(
                msg: state.exception.toString(),
                backgroundColor: AppColors.redcommen);
          }
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: ExactAssetImage('assets/images/img.png'),
                  fit: BoxFit.cover,
                )),
              ),
              SafeArea(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      "Change Password",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.commenTextColor),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 99),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 66,
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
                            controller: _oldpasswordController,
                            keyboardType: TextInputType.emailAddress,
                            inputAction: TextInputAction.done,
                            hint: "Old Password",
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
                            hint: "New Password",
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
                          height: 99,
                        ),
                        CustomButton(
                            title: "Verify",
                            tapActivity: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                AuthBloc loginBloc =
                                    BlocProvider.of<AuthBloc>(context);
                                loginBloc.add(ChangePasswordEvent(
                                    _oldpasswordController.text,
                                    _passwordController.text,
                                    _cpasswordController.text));
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
