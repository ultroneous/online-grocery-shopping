import 'package:ecomm_bloc/presentation/Auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../Constants/color.dart';
import '../../bloc/authbloc/auth_bloc.dart';
import '../common/progress_dialog.dart';
import '../custom/custom_form_field.dart';
import '../custom/custome_button.dart';

class ResetpasswordPage extends StatefulWidget {
  ResetpasswordPage({Key? key, required this.id}) : super(key: key);
  String id;
  @override
  State<ResetpasswordPage> createState() => _ResetpasswordPageState();
}

class _ResetpasswordPageState extends State<ResetpasswordPage> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _cpasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  bool _isObscure1 = true;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ResetLoading) {
            ProgressDialog.show(context);
          } else if (state is ResetSuccess) {
            ProgressDialog.hide(context);
            Fluttertoast.showToast(
                msg: "Password Reset Succesfully",
                textColor: Colors.black,
                backgroundColor: Colors.white.withOpacity(0.7));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const LoginPage()));
          } else if (state is ResetError) {
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
                        Text(
                          "Reset Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.commenTextColor,
                              fontSize: 31),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Your new password must be different",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black38),
                            ),
                            Text(
                              "from previously used password.",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black38),
                            )
                          ],
                        ),
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
                          height: 99,
                        ),
                        CustomButton(
                            title: "Login",
                            tapActivity: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                AuthBloc loginBloc =
                                    BlocProvider.of<AuthBloc>(context);
                                loginBloc.add(ResetPasswordEvent(
                                    widget.id,
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
