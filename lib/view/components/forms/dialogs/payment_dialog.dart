import 'package:delivery/controller/categories/categories_controller.dart';
import 'package:delivery/controller/products/products_controller.dart';
import 'package:delivery/controller/profiles/profile_controller.dart';
import 'package:delivery/model/api/generated/katte.swagger.dart';
import 'package:delivery/model/db/shop_card_entity.dart';
import 'package:delivery/model/globals/globals.dart';
import 'package:delivery/view/components/forms/dialogs/address_dialog.dart';
import 'package:delivery/view/components/forms/my_divider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:delivery/controller/addresses/address_controller.dart'
    as a_controller;

class MyPaymentDialog extends StatefulWidget {
  final List<ShopCardEntity> shops;
  List<AddressDto> addresses;
  MyPaymentDialog({
    Key? key,
    required this.shops,
    required this.addresses,
  }) : super(key: key);

  @override
  State<MyPaymentDialog> createState() => _MyPaymentDialogState();
}

List<String> options = ['درب منزل', 'آنلاین'];

class _MyPaymentDialogState extends State<MyPaymentDialog> {
  String currentOption = options[1];
  @override
  void initState() {
    super.initState();
    getAllProducts(context: context);
    getCategories(context: context);
    getProfile(context: context);
    getAddresses();
  }

  getAddresses() {
    a_controller.getAddresses().then((value) {
      setState(() {
        widget.addresses = value.data!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 400,
        height: 500,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                  width: 320,
                  height: 200,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      for (int index = 0; index < widget.shops.length; index++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  widget.shops[index].producyName,
                                  style: GoogleFonts.dosis(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              const MyDivider(
                                  thickness: 0.5,
                                  horizontalPadding: 10,
                                  dividerColor: Colors.grey),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "${widget.shops[index].productCount}",
                                  style: GoogleFonts.dosis(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              const MyDivider(
                                  thickness: 0.5,
                                  horizontalPadding: 10,
                                  dividerColor: Colors.grey),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  widget.shops[index].productPrice,
                                  style: GoogleFonts.notoNaskhArabic(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      for (int index = 0; index < widget.shops.length; index++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  widget.shops[index].productPrice.toString(),
                                  style: GoogleFonts.dosis(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  '  : جمع کل ',
                                  style: GoogleFonts.notoNaskhArabic(
                                      color: Colors.grey.shade900,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
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
              for (int index = 0; index < widget.addresses.length; index++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 31),
                  child: Text(
                    textDirection: TextDirection.rtl,
                    //'shiraz - blv ',
                    '${widget.addresses[index].location}',
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
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog<Dialog>(
                          context: context,
                          builder: (BuildContext context) => MyAddressDialog(
                            shops: [],
                            visible: true,
                            address: 'شیراز خیابان شهید اقایی',
                            postalCode: '88888888888',
                          ),
                        ).asStream();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        width: 71,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 5, top: 2, bottom: 2),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Text(
                            '3532489526',
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
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      ' : نحوه تحویل',
                      style: GoogleFonts.notoNaskhArabic(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: [
                      Radio(
                        activeColor: secondColor,
                        value: options[0],
                        groupValue: currentOption,
                        onChanged: (value) {
                          setState(() {
                            currentOption = value.toString();
                          });
                        },
                      ),
                      Text(
                        'آنلاین',
                        style: GoogleFonts.notoNaskhArabic(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                            fontSize: 14.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: secondColor,
                        value: options[1],
                        groupValue: currentOption,
                        onChanged: (value) {
                          setState(() {
                            currentOption = value.toString();
                          });
                        },
                      ),
                      Text(
                        'درب منزل',
                        style: GoogleFonts.notoNaskhArabic(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade800,
                            fontSize: 14.5),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const MyDivider(
                      thickness: 0.5,
                      horizontalPadding: 10,
                      dividerColor: Colors.grey),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: secondColor),
                      child: Center(
                        child: Text(
                          'پرداخت',
                          style: GoogleFonts.notoNaskhArabic(
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const MyDivider(
                      thickness: 0.5,
                      horizontalPadding: 10,
                      dividerColor: Colors.grey),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
