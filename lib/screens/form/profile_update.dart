import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_review/bloc/auth_bloc/auth_bloc.dart';
import 'package:movie_review/data/models/user_model.dart';
import 'package:movie_review/utils/apis/apis.dart';
import 'package:movie_review/utils/colors/colors.dart';
import 'package:movie_review/widgets/custom_input_box.dart';

class ProfileUpdateForm extends StatefulWidget {
  const ProfileUpdateForm({Key? key}) : super(key: key);

  @override
  _ProfileUpdateFormState createState() => _ProfileUpdateFormState();
}

class _ProfileUpdateFormState extends State<ProfileUpdateForm> {
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _phoneController = TextEditingController();
  File? _pickedImage;

  final _imagePicker = ImagePicker();

  Future pickPhoto(ImageSource source) async {
    final _pickImage = await _imagePicker.pickImage(source: source);
    setState(() {
      _pickedImage = File(_pickImage!.path);
    });
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthBloc()..add(GetUser()),
      child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is AuthSuccess) {
              final user = state.user;
              return Scaffold(
                backgroundColor: Colors.black,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: const Text("Profile"),
                ),
                body: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            (_pickedImage == null)
                                ? CircleAvatar(
                                    radius: 60,
                                    backgroundImage: NetworkImage(
                                      API.baseUrl + user.avatar!,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 60,
                                    backgroundImage: FileImage(
                                      File(_pickedImage!.path),
                                    ),
                                  ),
                            Positioned(
                              bottom: -10,
                              right: -10,
                              child: CircleAvatar(
                                backgroundColor: MyColors.secondaryBackground,
                                child: IconButton(
                                  icon: const Icon(
                                    EvaIcons.edit2Outline,
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: 200,
                                            padding: const EdgeInsets.all(20.0),
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "Select One",
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20.0,
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    await pickPhoto(
                                                        ImageSource.camera);
                                                  },
                                                  child: SizedBox(
                                                    height: 40,
                                                    child: Row(
                                                      children: const [
                                                        Icon(
                                                          Icons.camera_alt,
                                                          size: 20.0,
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text("Camera"),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    await pickPhoto(
                                                        ImageSource.gallery);
                                                  },
                                                  child: SizedBox(
                                                    height: 40,
                                                    child: Row(
                                                      children: const [
                                                        Icon(
                                                          Icons
                                                              .photo_album_outlined,
                                                          size: 22.0,
                                                        ),
                                                        SizedBox(
                                                          width: 10.0,
                                                        ),
                                                        Text("Gallery"),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 20.0,
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "personal details".toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Column(
                          children: [
                            CustomInputBox(
                              fieldName: "Firstname",
                              hint: user.fname!,
                              controller: _fnameController,
                            ),
                            const SizedBox(height: 15),
                            CustomInputBox(
                              fieldName: "Lastname",
                              hint: user.lname!,
                              controller: _lnameController,
                            ),
                            const SizedBox(height: 15),
                            CustomInputBox(
                              fieldName: "Phone",
                              hint: "${user.phone}",
                              controller: _phoneController,
                              inputType: TextInputType.phone,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: InkWell(
                          onTap: () {
                            if (_fnameController.text.isNotEmpty ||
                                _lnameController.text.isNotEmpty ||
                                _phoneController.text.isNotEmpty ||
                                _pickedImage != null) {
                              BlocProvider.of<AuthBloc>(context).add(
                                UpdateUser(
                                  fname: _fnameController.text,
                                  lname: _lnameController.text,
                                  phone: (_phoneController.text != "")
                                      ? int.parse(_phoneController.text)
                                      : 0,
                                  image: _pickedImage,
                                ),
                              );
                            } else {
                              Get.snackbar(
                                "Error",
                                "Input field's can't be empty",
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: Colors.red,
                                duration: const Duration(seconds: 1),
                                backgroundColor: Colors.white,
                              );
                            }
                          },
                          child: Container(
                            width: size.width,
                            height: 40,
                            decoration: BoxDecoration(
                              color: MyColors.primaryButtonColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            alignment: Alignment.center,
                            child: (state is AuthLoading)
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 1, color: Colors.black),
                                  )
                                : Text(
                                    "save details".toUpperCase(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                  child: CircularProgressIndicator(
                    color: MyColors.primary,
                    strokeWidth: 2,
                  ),
                ),
              );
            }
          }),
    );
  }
}
