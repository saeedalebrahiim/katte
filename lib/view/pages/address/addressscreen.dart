// import 'package:delivery/model/api/generated/katte.swagger.dart';
// import 'package:delivery/model/globals/globals.dart';
// import 'package:delivery/view/components/my_drawer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:delivery/controller/addresses/address_controller_dont_touch.dart'
//     as address_controller;

// class MyAddressScreen extends StatefulWidget {
//   const MyAddressScreen({super.key});

//   @override
//   State<MyAddressScreen> createState() => _MyAddressScreenState();
// }

// class _MyAddressScreenState extends State<MyAddressScreen> {
//   bool visible = false;
//   List<AddressDto> myList = [];
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   getData() {
//     address_controller.getAddresses().then((value) {
//       setState(() {
//         myList = value.data!;
//       });
//     });
//   }

//   addAddresses(String address, String postalCode) {
//     address_controller
//         .addAddresses(
//             context: context,
//             body: AddressDto(location: address, postalCode: postalCode))
//         .then((value) => getData());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       endDrawer: const MyDrawer(),
//       appBar: AppBar(
//         leadingWidth: 40,
//         scrolledUnderElevation: 1.5,
//         toolbarHeight: 50,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.home_outlined,
//             size: 28,
//           ),
//           onPressed: () {
//             Navigator.of(context)
//                 .pushNamedAndRemoveUntil("indexScreen", (route) => false);
//           },
//         ),
//         shadowColor: Colors.grey.shade800,
//         iconTheme: IconThemeData(color: Colors.grey.shade900),
//         backgroundColor: primaryColor,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: Center(
//           child: Text(
//             'Katté',
//             style: GoogleFonts.dosis(
//                 color: secondColor, fontSize: 32, fontWeight: FontWeight.w900),
//           ),
//         ),
//       ),
//       backgroundColor: primaryColor,
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               AnimationLimiter(
//                 child: Column(
//                   children: AnimationConfiguration.toStaggeredList(
//                     duration: const Duration(milliseconds: 500),
//                     childAnimationBuilder: (widget) => SlideAnimation(
//                         horizontalOffset: 50.0,
//                         child: FadeInAnimation(child: widget)),
//                     children: [
//                       for (int index = 0; index < myList.length; index++)
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text('${myList[index].location}'),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
