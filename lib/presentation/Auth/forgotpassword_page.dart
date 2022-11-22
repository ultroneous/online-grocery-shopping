import 'package:ecomm_bloc/bloc/authbloc/auth_bloc.dart';
import 'package:ecomm_bloc/presentation/Auth/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../Constants/color.dart';
import '../common/progress_dialog.dart';
import '../custom/custom_form_field.dart';
import '../custom/custome_button.dart';

class ForgotpasswordPage extends StatelessWidget {
  ForgotpasswordPage({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ForgotLoading) {
            ProgressDialog.show(context);
          } else if (state is ForgotSuccess) {
            ProgressDialog.hide(context);
            Fluttertoast.showToast(
                msg: "Email sent to the registered email",
                textColor: Colors.black,
                backgroundColor: Colors.white.withOpacity(0.7));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => OtpPage(
                          id: state.loginModel.id.toString(),
                          email: _emailController.text,
                        )));
          } else if (state is ForgotError) {
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
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
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
                          "Forgot Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.commenTextColor,
                              fontSize: 31),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Column(
                          children: const [
                            Text(
                              "Enter your registered email below to",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black38),
                            ),
                            Text(
                              "receive password reset instructions",
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
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.done,
                          hint: "Email",
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Email ID cannot be empty"),
                            EmailValidator(errorText: "Not a valid email")
                          ]),
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                        CustomButton(
                            title: "Submit",
                            tapActivity: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                AuthBloc loginBloc =
                                    BlocProvider.of<AuthBloc>(context);
                                loginBloc.add(
                                    ForgotPasswordEvent(_emailController.text));
                              }
                              //controller.forgot(_emailController.text);
                            }),
                        const SizedBox(
                          height: 99,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Back to Login",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  color: Colors.black38),
                            ))
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
