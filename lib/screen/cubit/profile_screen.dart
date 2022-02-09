import 'dart:io';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:school_bus/helper/componanets.dart';
import 'package:school_bus/register.dart/cubit.dart';
import 'package:school_bus/register.dart/state.dart';
import 'package:school_bus/school_bus/cubit/schoollogin_cubit.dart';
import 'package:school_bus/school_bus/cubit/schoollogin_state.dart';

class HomeScreen extends StatelessWidget {
  var childNameController = TextEditingController();
  var addressController = TextEditingController();
  var schoolNameController = TextEditingController();
  var phoneController = TextEditingController();
  var schoollAddressController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SchoolLoginCubit(),
      child: BlocConsumer<SchoolLoginCubit, SchoolLoginState>(
        listener: (context, state) {
          if (state is SchoolCreateSuccessState) {}
        },
        builder: (context, state) {
          var userModel = SchoolLoginCubit.get(context).model;
          var profileImage = SchoolLoginCubit.get(context).profileImage;
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                height: size.height,
                width: size.width,
                color: Color(0XFFFFAB4C),
                child: Form(
                  key: formKey,
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: size.height * .64,
                            width: size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 150),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "profile",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 40,
                                              ),
                                            ),
                                            Text(
                                              ('name of parent'),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.height * .20,
                                        height: size.height * .20,
                                        child: Image.asset(
                                          "assets/image/idealogo3.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * .35),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Stack(
                            children: [
                              Container(
                                height: size.height,
                                width: size.width,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 20, left: 20),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            CircleAvatar(
                                              radius: 50,
                                              backgroundColor:
                                                  Color(0XFFFFAB4C),
                                              child: CircleAvatar(
                                                radius: 45.0,
                                                backgroundImage: profileImage ==
                                                        null
                                                    ? AssetImage(
                                                        'assets/image/idealogo3.png')
                                                    : FileImage(profileImage),
                                              ),
                                            ),
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: IconButton(
                                                  icon: Icon(
                                                    Icons.linked_camera,
                                                    size: 25,
                                                    color: Color(0XFFFFAB4C),
                                                  ),
                                                  onPressed: () {
                                                    SchoolLoginCubit.get(
                                                            context)
                                                        .getProfileImage();
                                                  }),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 55,
                                        child: defaultFormField(
                                          controller: childNameController,
                                          type: TextInputType.name,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'please enter your name address';
                                            }
                                          },
                                          label: 'child name',
                                          prefix: Icons.person,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Container(
                                        height: 55,
                                        child: defaultFormField(
                                            controller: addressController,
                                            type: TextInputType.name,
                                            validate: (String value) {
                                              if (value.isEmpty) {
                                                return 'please enter your address';
                                              }
                                            },
                                            label: 'address',
                                            prefix: Icons.location_pin),
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Container(
                                        height: 55,
                                        child: defaultFormField(
                                          controller: phoneController,
                                          type: TextInputType.phone,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'please enter your phone address';
                                            }
                                          },
                                          label: 'Phone',
                                          prefix: Icons.phone,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Container(
                                        height: 55,
                                        child: defaultFormField(
                                          controller: schoolNameController,
                                          type: TextInputType.visiblePassword,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'please enter your school name';
                                            }
                                          },
                                          label: 'school name',
                                          prefix: Icons.school_sharp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Container(
                                        height: 55,
                                        child: defaultFormField(
                                          controller: schoollAddressController,
                                          type: TextInputType.visiblePassword,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'please enter your school address';
                                            }
                                          },
                                          label: 'school address',
                                          prefix: Icons.location_pin,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Container(
                                        width: 150,
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: ConditionalBuilder(
                                            condition: state
                                                is! SchoolRegisterLoadingState,
                                            builder: (context) => defaultButton(
                                              function: () {
                                                SchoolLoginCubit.get(context)
                                                    .uploadProfileImage();
                                              },
                                              text: 'Save ',
                                              isUpperCase: true,
                                            ),
                                            fallback: (context) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
