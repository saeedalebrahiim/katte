import 'package:delivery/view/pages/auth/loginscreen.dart';
import 'package:delivery/view/pages/auth/registerscreen.dart';
import 'package:delivery/view/pages/choosedate/choosedatescreen.dart';
import 'package:delivery/view/pages/home/indexscreen.dart';
import 'package:delivery/view/pages/orders/ordersscreen.dart';
import 'package:delivery/view/pages/payment/paymentscreen.dart';
import 'package:delivery/view/pages/profile/profilescreen.dart';
import 'package:flutter/material.dart';

const String registerScreen = "registerScreen";
const String registerOtpScreen = "registerOtpScreen";
const String loginScreen = "loginScreen";
const String paymentScreen = "paymentScreen";
const String addressScreen = "addressScreen";
const String indexScreen = "indexScreen";
const String profileScreen = "profileScreen";
const String ordersScreen = "ordersScreen";
const String chooseDateScreen = "chooseDateScreen";
const String loginScreenOTP = "loginScreenOTP";
Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
  registerScreen: (context) => RegisterScreen(),
  //registerOtpScreen: (context) => RegisterOtpScreen(),
  //loginScreenOTP:(context) => LoginScreenOTP(),
  loginScreen: (context) => LoginScreen(),
  paymentScreen: (context) => const PaymentFirstScreen(),
  // addressScreen: (context) => const MyAddressScreen(),
  indexScreen: (context) => const IndexScreen(),
  profileScreen: (context) => const ProfileScreen(),
  ordersScreen: (context) => const OrdersScreen(),
  chooseDateScreen: (context) => ChooseDateScreen(),
};
