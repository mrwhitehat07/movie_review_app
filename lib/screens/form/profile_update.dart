import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            EvaIcons.arrowIosBack,
            // color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
              // color: Colors.black,
              ),
        ),
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
                      ? const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(
                            "assets/images/profile.jpg",
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
                      backgroundColor: Colors.black87,
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
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    pickPhoto(
                                                        ImageSource.camera);
                                                  },
                                                  icon: const Icon(
                                                    Icons.camera_alt,
                                                  ),
                                                  iconSize: 40.0,
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Container(
                                                  width: size.width,
                                                  alignment: Alignment.center,
                                                  child: const Text("Camera"),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    pickPhoto(
                                                        ImageSource.gallery);
                                                  },
                                                  icon: const Icon(
                                                    Icons.photo_album_outlined,
                                                  ),
                                                  iconSize: 40.0,
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Container(
                                                  width: size.width,
                                                  alignment: Alignment.center,
                                                  child: const Text("Gallery"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
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
                    hint: "Firstname",
                    controller: _fnameController,
                  ),
                  const SizedBox(height: 15),
                  CustomInputBox(
                    fieldName: "Lastname",
                    hint: "Lastname",
                    controller: _lnameController,
                  ),
                  const SizedBox(height: 15),
                  CustomInputBox(
                    fieldName: "Phone",
                    hint: "Phone",
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
                onTap: () {},
                child: Container(
                  width: size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: MyColors.primaryButtonColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: Text(
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
  }
}
