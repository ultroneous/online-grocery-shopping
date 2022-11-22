import 'dart:io';

import 'package:ecomm_bloc/Constants/color.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/images.dart';
import '../custom/custom_form_field.dart';
import '../custom/custome_button.dart';

class EditprofilePage extends StatefulWidget {
  const EditprofilePage({Key? key}) : super(key: key);

  @override
  State<EditprofilePage> createState() => _EditprofilePageState();
}

class _EditprofilePageState extends State<EditprofilePage> {
  final TextEditingController _firstController = TextEditingController();

  final TextEditingController _lastController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  Future uploadImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: 80,
      maxHeight: 80,
      imageQuality: 10,
    );
    imageFile = pickedFile != null ? File(pickedFile.path) : null;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: isDarkMode
                            ? AppColors.simplewhite
                            : AppColors.commenTextColor,
                      )),
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode
                            ? AppColors.simplewhite
                            : AppColors.commenTextColor),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
            SafeArea(
                child: Stack(
              children: [
                SizedBox(
                  //  margin: const EdgeInsets.only(left: 10),
                  height: 146.17,
                  width: 146.17,
                  child: ClipOval(
                    child: Image.asset(
                      ImageName.user,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 6,
                    right: 2,
                    child: GestureDetector(
                      onTap: () {
                        uploadImage(ImageSource.camera);
                      },
                      child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: AppColors.redcommen,
                              borderRadius: BorderRadius.circular(25)),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: AppColors.simplewhite,
                          )),
                    ))
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomFormField(
                      controller: _firstController,
                      keyboardType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                      hint: "First Name",
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: "First Name cannot be empty")
                      ]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomFormField(
                      controller: _lastController,
                      keyboardType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                      hint: "Last Name",
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: "Last Name cannot be empty")
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
                        RequiredValidator(
                            errorText: "Email ID cannot be empty"),
                        EmailValidator(errorText: "Not a valid email")
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
                        PatternValidator(r'^(?:[+0]9)?[0-9]{10}$',
                            errorText: 'Enter Mobile Number valid')
                      ]),
                      // validator: (value) {
                      //   Validator.emailValidation(
                      //     emailID: value,
                      //   );
                      //   _email = value;
                      // }
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    CustomButton(
                        title: "Save",
                        tapActivity: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
