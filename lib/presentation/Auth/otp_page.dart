import 'package:ecomm_bloc/presentation/Auth/resetpassword_page.dart';
import 'package:ecomm_bloc/presentation/common/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Constants/color.dart';
import '../../bloc/authbloc/auth_bloc.dart';
import '../custom/custometimer.dart';
import '../custom/custome_button.dart';

class OtpPage extends StatelessWidget {
  String id;
  String email;
  OtpPage({Key? key, required this.id, required this.email}) : super(key: key);
  final TextEditingController _first = TextEditingController();
  final TextEditingController _seconde = TextEditingController();
  final TextEditingController _three = TextEditingController();
  final TextEditingController _fourth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OtpverifyLoading) {
          ProgressDialog.show(context);
        } else if (state is OtpverifySuccess) {
          Fluttertoast.showToast(
              msg: "OTP verify Succesfully",
              textColor: Colors.black,
              backgroundColor: Colors.white.withOpacity(0.7));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ResetpasswordPage(
                        id: state.loginModel.id.toString(),
                      )));
        } else if (state is OtpverifyError) {
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
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 5),
                      child: Column(
                        children: [
                          Text(
                            "Enter code",
                            style: TextStyle(
                                fontSize: 32,
                                color: AppColors.commenTextColor,
                                fontFamily:
                                    'assets/fonts/RedHatDisplay-Medium.ttf'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "We send it to the Email",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black38,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _textFieldOTP(
                                  first: true, last: false, controller: _first),
                              _textFieldOTP(
                                  first: false,
                                  last: false,
                                  controller: _seconde),
                              _textFieldOTP(
                                  first: false,
                                  last: false,
                                  controller: _three),
                              _textFieldOTP(
                                  first: false,
                                  last: true,
                                  controller: _fourth),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                              title: "Verify",
                              tapActivity: () {
                                int otp = int.parse(_first.text +
                                    _seconde.text +
                                    _three.text +
                                    _fourth.text);
                                AuthBloc otpverify =
                                    BlocProvider.of<AuthBloc>(context);
                                otpverify.add(OtpverifyEvent(id, otp));
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomeTimer(
                            label: "Resend Code",
                            timeOutInSeconds: 60,
                            onPressed: () {
                              AuthBloc loginBloc =
                                  BlocProvider.of<AuthBloc>(context);
                              loginBloc.add(ForgotPasswordEvent(email));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class _textFieldOTP extends StatelessWidget {
  _textFieldOTP(
      {Key? key,
      required TextEditingController controller,
      required this.first,
      required this.last})
      : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  bool first, last;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: _controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: true,
          cursorColor: AppColors.commenTextColor,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: AppColors.commenTextColor),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: AppColors.commenTextColor),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
