import 'package:delivery/model/api/generated/katte.swagger.dart';
import 'package:delivery/model/globals/globals.dart';
import 'package:delivery/view/components/forms/my_divider.dart';
import 'package:delivery/view/pages/auth/LoginScreenOTP.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delivery/controller/authentication/auth_controller.dart'
    as auth_controller;
import 'package:uuid/uuid.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final familyController = TextEditingController();
  final phonumberController = TextEditingController();

  final GlobalKey<ScaffoldState> fromScaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: fromScaffold,
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    SizedBox(
                        width: 110,
                        height: 110,
                        child: Image(
                          image: const AssetImage('lib/assets/images/chef.png'),
                          color: secondColor,
                        )),
                    Text(
                      'Katté',
                      style: GoogleFonts.dosis(
                          color: secondColor,
                          fontSize: 43,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'جهت ثبت نام , موارد زیر را وارد کنید',
                  style: GoogleFonts.notoNaskhArabic(
                      color: Colors.grey.shade900,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: TextFormField(
                        controller: nameController,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            labelText: 'نام',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            floatingLabelStyle: GoogleFonts.notoNaskhArabic(
                                color: secondColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                            labelStyle: GoogleFonts.notoNaskhArabic(
                                color: Colors.grey.shade900,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: secondColor, width: 0.7)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: secondColor, width: 0.7)),
                            fillColor: primaryColor,
                            filled: true)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: TextFormField(
                        controller: familyController,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            labelText: 'نام خانوادگی',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            floatingLabelStyle: GoogleFonts.notoNaskhArabic(
                                color: secondColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                            labelStyle: GoogleFonts.notoNaskhArabic(
                                color: Colors.grey.shade900,
                                fontSize: 19,
                                fontWeight: FontWeight.w600),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: secondColor, width: 0.7)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    BorderSide(color: secondColor, width: 0.7)),
                            fillColor: primaryColor,
                            filled: true)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: TextFormField(
                      controller: phonumberController,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          hintText: '- - - - - - - - - - -',
                          labelText: 'شماره تلفن',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          floatingLabelStyle: GoogleFonts.notoNaskhArabic(
                              color: secondColor,
                              fontSize: 19,
                              fontWeight: FontWeight.w600),
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                          labelStyle: GoogleFonts.notoNaskhArabic(
                              color: Colors.grey.shade900,
                              fontSize: 19,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: secondColor, width: 0.7)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(color: secondColor, width: 0.7)),
                          fillColor: primaryColor,
                          filled: true),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    MyDivider(
                        thickness: 0.3,
                        horizontalPadding: 20,
                        dividerColor: secondColor),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          auth_controller
                              .signup(
                            context: context,
                            body: SignUpDto(
                              fName: nameController.text,
                              lName: familyController.text,
                              phoneNumber: phonumberController.text,
                              otp: 0,
                              id: const Uuid().v1(),
                            ),
                          )
                              .then((value) {
                            if (value.isSuccess!) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LoginScreenOTP(
                                    phoneNumber: phonumberController.text,
                                  ),
                                ),
                              );
                            } else {
                              print("error");
                            }
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              boxShadow: const [
                                BoxShadow(
                                    spreadRadius: 0.5,
                                    blurRadius: 5,
                                    color: Colors.grey)
                              ],
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(width: 3, color: secondColor)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: Text(
                                'تایید',
                                style: GoogleFonts.notoKufiArabic(
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    MyDivider(
                        thickness: 0.3,
                        horizontalPadding: 20,
                        dividerColor: secondColor),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
