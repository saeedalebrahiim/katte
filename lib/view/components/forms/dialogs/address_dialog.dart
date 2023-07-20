import 'package:delivery/model/api/generated/katte.swagger.dart';
import 'package:delivery/model/db/shop_card_entity.dart';
import 'package:delivery/model/globals/globals.dart';
import 'package:delivery/view/components/forms/my_divider.dart';
import 'package:delivery/view/components/forms/my_map.dart';
import 'package:delivery/view/pages/auth/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delivery/controller/addresses/address_controller.dart'
    as address_controller;

class MyAddressDialog extends StatefulWidget {
  MyAddressDialog(
      {Key? key,
      required this.shops,
      required this.visible,
      required this.address,
      required this.postalCode,
      this.addressController,
      this.postalCodeController})
      : super(key: key);
  bool visible = false;
  final List<ShopCardEntity> shops;
  final String address;
  final String postalCode;
  TextEditingController? addressController = TextEditingController();
  TextEditingController? postalCodeController = TextEditingController();
  @override
  State<MyAddressDialog> createState() => _MyAddressDialogState();
}

class _MyAddressDialogState extends State<MyAddressDialog> {
  List<AddressDto> myList = [];

  @override
  void initState() {
    super.initState();
    getAddressesFromAPI();
  }

  getAddressesFromAPI() {
    address_controller.getAddresses().then((value) {
      setState(() {
        myList = value.data!;
        print('succccccess........');
      });
    });
  }

  addAddresses(AddressDto addressDto) {
    address_controller
        .addAddresses(context: context, body: addressDto)
        .then((value) {
      if (value.statusCode == 200) {
        setState(() {
          myList.add(addressDto);
          print('add addressDto to myList');
        });
      } else {
        print('adding failed');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Visibility(
        visible: widget.visible,
        replacement: Container(
          width: 400,
          height: 500,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(0.1)),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MyMap(
                height: 180,
                width: double.infinity,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          ' : آدرس',
                          style: GoogleFonts.notoNaskhArabic(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  for (int index = 0; index < myList.length; index++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        textDirection: TextDirection.rtl,
                        myList[index].location.toString(),
                        style: GoogleFonts.notoNaskhArabic(
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        for (int index = 0; index < myList.length; index++)
                          Padding(
                            padding: const EdgeInsets.only(top: 1),
                            child: Text(
                              myList[index].postalCode.toString(),
                              style: GoogleFonts.dosis(
                                  color: Colors.grey.shade900,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.5),
                            ),
                          ),
                        Text(
                          '   : کد پستی',
                          style: GoogleFonts.notoNaskhArabic(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.visible = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      width: 71,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 5, top: 2, bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_pin,
                              size: 17,
                              color: secondColor,
                            ),
                            Text(
                              'تغییر آدرس',
                              style: GoogleFonts.notoNaskhArabic(
                                  color: secondColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      MyDivider(
                          thickness: 0.5,
                          horizontalPadding: 30,
                          dividerColor: Colors.grey),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        addAddresses(AddressDto(
                            clientId: "64c10c05-b718-ee11-a9d3-d14d2a92f4c0",
                            location: 'shiraz-poaskpkaspxkaxnasnx',
                            postalCode: '8498416666666',
                            clientFname: 'reza',
                            clientLname: 'mohammady',
                            clientPhoneNumber: '09387285366'));
                        print('add addresses');
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                          color: primaryColor,
                          boxShadow: const [
                            BoxShadow(
                                spreadRadius: 0.5,
                                blurRadius: 5,
                                color: Colors.grey)
                          ],
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 1.5, color: secondColor)),
                      child: Center(
                        child: Text(
                          'تایید',
                          style: GoogleFonts.notoNaskhArabic(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        child: Container(
          width: 400,
          height: 500,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(.1)),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MyMap(
                height: 180,
                width: double.infinity,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'لطفا آدرس خود را بر روی نقشه انتخاب کنید',
                style: GoogleFonts.notoNaskhArabic(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              const SizedBox(
                height: 34,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 60,
                  width: 250,
                  child: TextFormField(
                      controller: widget.addressController,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          hintText: '',
                          labelText: 'آدرس را وارد کنید',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          floatingLabelStyle: GoogleFonts.notoNaskhArabic(
                              color: secondColor,
                              fontSize: 19,
                              fontWeight: FontWeight.w600),
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                          labelStyle: GoogleFonts.notoNaskhArabic(
                              color: Colors.grey.shade900,
                              fontSize: 17,
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 40,
                  width: 250,
                  child: TextFormField(
                    controller: widget.postalCodeController,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        hintText: '- - - - - - - - - -',
                        labelText: 'کد پستی',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        floatingLabelStyle: GoogleFonts.notoNaskhArabic(
                            color: secondColor,
                            fontSize: 19,
                            fontWeight: FontWeight.w600),
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        labelStyle: GoogleFonts.notoNaskhArabic(
                            color: Colors.grey.shade900,
                            fontSize: 17,
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
                height: 18,
              ),
              const Row(
                children: [
                  MyDivider(
                      thickness: 0.5,
                      horizontalPadding: 30,
                      dividerColor: Colors.grey),
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.visible = false;
                    addAddresses(AddressDto(
                        clientId: "64c10c05-b718-ee11-a9d3-d14d2a92f4c0",
                        location: widget.addressController!.text,
                        postalCode: widget.postalCodeController!.text));
                    print('succsess');
                  });

                  Navigator.pop(context);
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (_) => LoginScreen()),
                  // );
                },
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0.5,
                            blurRadius: 5,
                            color: Colors.grey)
                      ],
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 1.5, color: secondColor)),
                  child: Center(
                    child: Text(
                      'ثبت',
                      style: GoogleFonts.notoNaskhArabic(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
