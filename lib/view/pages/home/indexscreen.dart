import 'package:delivery/model/globals/globals.dart';
import 'package:delivery/view/components/forms/my_dialog.dart';
import 'package:delivery/view/components/forms/my_divider.dart';
import 'package:delivery/view/components/forms/posts/my_foodpost.dart';
import 'package:delivery/view/components/my_drawer.dart';
import 'package:delivery/view/provider/home_index.dart';
import 'package:delivery/view/provider/index_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:delivery/controller/categories/categories_controller.dart'
    as ctg_controller;
import 'package:delivery/controller/products/products_controller.dart'
    as products_controller;
import 'package:delivery/controller/addresses/address_controller.dart'
    as address_controller;

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getAddresses();
  }

  getData() {
    ctg_controller.getCategories(context: context).then((value) {
      context.read<HomeIndexProvider>().setCategories(value.data!);
      products_controller.getAllProducts(context: context).then((products) {
        context.read<HomeIndexProvider>().setProducts(products.data!);
      });
    });
  }

  getAddresses() {
    address_controller.getAddresses(context: context).then((address) {
      // context.read<AddressIndexProvider>().getAddresses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          // getAddresses();
          address_controller.getAddresses(context: context).then(
            (value) {
              String? address;
              if (value.data!.isNotEmpty) {
                address = value.data!.last.location;
              }

              showDialog<Dialog>(
                context: context,
                builder: (BuildContext context) => MyDialog(
                  shops: [],
                  visible: false,
                  address: address,
                ),
              );
            },
          );
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              boxShadow: const [BoxShadow(spreadRadius: 0.1, blurRadius: 2)],
              color: primaryColor,
              shape: BoxShape.circle,
              border: Border.all(color: secondColor)),
          child: const Icon(
            Icons.location_pin,
            size: 26,
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          border: const Border(top: BorderSide(color: Colors.grey, width: 0.2)),
          color: primaryColor,
        ),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: Consumer<IndexCardState>(
                builder: (context, heh, child) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: IndexCardState.indexCard.length,
                  itemBuilder: (context, index) {
                    return Chip(
                      label: Text(IndexCardState.indexCard[index]),
                      deleteIcon: const Icon(Icons.delete),
                      onDeleted: () {
                        context
                            .read<IndexCardState>()
                            .removeFromList(IndexCardState.indexCard[index]);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: const MyDrawer(),
      appBar: AppBar(
        leadingWidth: 40,
        scrolledUnderElevation: 1.5,
        toolbarHeight: 50,
        leading: Badge(
          label: Text("9+"),
          alignment: Alignment.topRight,
          offset: Offset.fromDirection(-3),
          child: IconButton(
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 25,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("paymentScreen", (route) => false);
            },
          ),
        ),
        shadowColor: Colors.grey.shade800,
        iconTheme: IconThemeData(color: Colors.grey.shade900),
        backgroundColor: primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Katté',
            style: GoogleFonts.dosis(
                color: secondColor, fontSize: 32, fontWeight: FontWeight.w900),
          ),
        ),
      ),
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Consumer<HomeIndexProvider>(
              builder: (context, value, child) => Wrap(
                spacing: 115,
                runSpacing: 100,
                alignment: WrapAlignment.spaceAround,
                children: [
                  for (var index = 0;
                      index < HomeIndexProvider.allCatgeroies.length;
                      index++)
                    AnimationLimiter(
                      child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 500),
                          childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset: 50.0,
                              child: FadeInAnimation(child: widget)),
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Image(
                              image: NetworkImage(
                                HomeIndexProvider.allCatgeroies[index].imageLink
                                    .toString()
                                    .replaceAll("https://localhost:44381",
                                        "http://103.75.197.248:90"),
                              ),
                              color: Colors.grey.shade900,
                              width: 110,
                              height: 110,
                            ),
                            SizedBox(
                              width: 300,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Starters',
                                    style: GoogleFonts.dosis(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey.shade900),
                                  ),
                                  Text(
                                    HomeIndexProvider.allCatgeroies[index].name
                                        .toString(),
                                    style: GoogleFonts.notoNaskhArabic(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade900),
                                  ),
                                ],
                              ),
                            ),
                            for (var i = 0;
                                i < HomeIndexProvider.allProducts.length;
                                i++)
                              if (HomeIndexProvider
                                      .allProducts[i].categorysId ==
                                  HomeIndexProvider.allCatgeroies[index].id)
                                Column(
                                  children: [
                                    MyFoodPost(
                                      productId: HomeIndexProvider
                                          .allProducts[i].id
                                          .toString(),
                                      count: HomeIndexProvider
                                          .allProducts[index].count,
                                      foodName: HomeIndexProvider
                                          .allProducts[i].name
                                          .toString(),
                                      imagePath: HomeIndexProvider
                                          .allProducts[i].imageLink
                                          .toString()
                                          .replaceAll("https://localhost:44381",
                                              "http://103.75.197.248:90"),
                                      price: HomeIndexProvider
                                          .allProducts[i].price
                                          .toString(),
                                      onTap: () {},
                                      textDirection: i.isEven
                                          ? TextDirection.ltr
                                          : TextDirection.rtl,
                                      desc: HomeIndexProvider
                                          .allProducts[i].shortDetail
                                          .toString(),
                                      dto: HomeIndexProvider.allProducts[i],
                                    ),
                                    const SizedBox(
                                      width: 300,
                                      child: Row(
                                        children: [
                                          MyDivider(
                                              thickness: 0.2,
                                              horizontalPadding: 50,
                                              dividerColor: Colors.grey),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                          ],
                        ),
                      ),
                    ),

                  // AnimationLimiter(
                  //   child: Wrap(
                  //       direction: Axis.vertical,
                  //       crossAxisAlignment: WrapCrossAlignment.center,
                  //       children: AnimationConfiguration.toStaggeredList(
                  //         duration: const Duration(milliseconds: 500),
                  //         childAnimationBuilder: (widget) => SlideAnimation(
                  //             horizontalOffset: 50.0,
                  //             child: FadeInAnimation(child: widget)),
                  //         children: [
                  //           const SizedBox(
                  //             height: 30,
                  //           ),
                  //           Image(
                  //             image: const AssetImage(
                  //                 'lib/assets/images/dinner.png'),
                  //             color: Colors.grey.shade900,
                  //             width: 110,
                  //             height: 110,
                  //           ),
                  //           SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Main Foods',
                  //                   style: GoogleFonts.dosis(
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w700,
                  //                       color: Colors.grey.shade900),
                  //                 ),
                  //                 Text(
                  //                   'غـذای اصلی',
                  //                   style: GoogleFonts.notoNaskhArabic(
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.w600,
                  //                       color: Colors.grey.shade900),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 1,
                  //                     horizontalPadding: 0,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food1.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.ltr,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 0.2,
                  //                     horizontalPadding: 50,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food2.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.rtl,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 0.2,
                  //                     horizontalPadding: 50,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food3.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.ltr,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //         ],
                  //       )),
                  // ),
                  // AnimationLimiter(
                  //   child: Wrap(
                  //       direction: Axis.vertical,
                  //       crossAxisAlignment: WrapCrossAlignment.center,
                  //       children: AnimationConfiguration.toStaggeredList(
                  //         duration: const Duration(milliseconds: 500),
                  //         childAnimationBuilder: (widget) => SlideAnimation(
                  //             horizontalOffset: 50.0,
                  //             child: FadeInAnimation(child: widget)),
                  //         children: [
                  //           const SizedBox(
                  //             height: 30,
                  //           ),
                  //           Image(
                  //             image: const AssetImage(
                  //                 'lib/assets/images/chicken.png'),
                  //             color: Colors.grey.shade900,
                  //             width: 110,
                  //             height: 110,
                  //           ),
                  //           SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Stews',
                  //                   style: GoogleFonts.dosis(
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w700,
                  //                       color: Colors.grey.shade900),
                  //                 ),
                  //                 Text(
                  //                   'خـوراک ها',
                  //                   style: GoogleFonts.notoNaskhArabic(
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.w600,
                  //                       color: Colors.grey.shade900),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 1,
                  //                     horizontalPadding: 0,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food1.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.ltr,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 0.2,
                  //                     horizontalPadding: 50,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food2.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.rtl,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 0.2,
                  //                     horizontalPadding: 50,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food3.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.ltr,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //         ],
                  //       )),
                  // ),
                  // AnimationLimiter(
                  //   child: Wrap(
                  //       direction: Axis.vertical,
                  //       crossAxisAlignment: WrapCrossAlignment.center,
                  //       children: AnimationConfiguration.toStaggeredList(
                  //         duration: const Duration(milliseconds: 500),
                  //         childAnimationBuilder: (widget) => SlideAnimation(
                  //             horizontalOffset: 50.0,
                  //             child: FadeInAnimation(child: widget)),
                  //         children: [
                  //           const SizedBox(
                  //             height: 30,
                  //           ),
                  //           Image(
                  //             image: const AssetImage(
                  //                 'lib/assets/images/dinner.png'),
                  //             color: Colors.grey.shade900,
                  //             width: 110,
                  //             height: 110,
                  //           ),
                  //           SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Main Foods',
                  //                   style: GoogleFonts.dosis(
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w700,
                  //                       color: Colors.grey.shade900),
                  //                 ),
                  //                 Text(
                  //                   'غـذای اصلی',
                  //                   style: GoogleFonts.notoNaskhArabic(
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.w600,
                  //                       color: Colors.grey.shade900),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 1,
                  //                     horizontalPadding: 0,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food1.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.ltr,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 0.2,
                  //                     horizontalPadding: 50,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food2.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.rtl,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 0.2,
                  //                     horizontalPadding: 50,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food3.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.ltr,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //         ],
                  //       )),
                  // ),
                  // AnimationLimiter(
                  //   child: Wrap(
                  //       direction: Axis.vertical,
                  //       crossAxisAlignment: WrapCrossAlignment.center,
                  //       children: AnimationConfiguration.toStaggeredList(
                  //         duration: const Duration(milliseconds: 500),
                  //         childAnimationBuilder: (widget) => SlideAnimation(
                  //             horizontalOffset: 50.0,
                  //             child: FadeInAnimation(child: widget)),
                  //         children: [
                  //           const SizedBox(
                  //             height: 30,
                  //           ),
                  //           Image(
                  //             image:
                  //                 const AssetImage('lib/assets/images/salad.png'),
                  //             color: Colors.grey.shade900,
                  //             width: 110,
                  //             height: 110,
                  //           ),
                  //           SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Starters',
                  //                   style: GoogleFonts.dosis(
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w700,
                  //                       color: Colors.grey.shade900),
                  //                 ),
                  //                 Text(
                  //                   'پـیش غذا',
                  //                   style: GoogleFonts.notoNaskhArabic(
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.w600,
                  //                       color: Colors.grey.shade900),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 1,
                  //                     horizontalPadding: 0,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food1.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.ltr,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 0.2,
                  //                     horizontalPadding: 50,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food2.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.rtl,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 0.2,
                  //                     horizontalPadding: 50,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food3.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.ltr,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //         ],
                  //       )),
                  // ),
                  // AnimationLimiter(
                  //   child: Wrap(
                  //       direction: Axis.vertical,
                  //       crossAxisAlignment: WrapCrossAlignment.center,
                  //       children: AnimationConfiguration.toStaggeredList(
                  //         duration: const Duration(milliseconds: 500),
                  //         childAnimationBuilder: (widget) => SlideAnimation(
                  //             horizontalOffset: 50.0,
                  //             child: FadeInAnimation(child: widget)),
                  //         children: [
                  //           const SizedBox(
                  //             height: 30,
                  //           ),
                  //           Image(
                  //             image:
                  //                 const AssetImage('lib/assets/images/meat.png'),
                  //             color: Colors.grey.shade900,
                  //             width: 110,
                  //             height: 110,
                  //           ),
                  //           SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Main Foods',
                  //                   style: GoogleFonts.dosis(
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w700,
                  //                       color: Colors.grey.shade900),
                  //                 ),
                  //                 Text(
                  //                   'غـذای اصلی',
                  //                   style: GoogleFonts.notoNaskhArabic(
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.w600,
                  //                       color: Colors.grey.shade900),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 1,
                  //                     horizontalPadding: 0,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food1.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.ltr,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 0.2,
                  //                     horizontalPadding: 50,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food2.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.rtl,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //           const SizedBox(
                  //             width: 300,
                  //             child: Row(
                  //               children: [
                  //                 MyDivider(
                  //                     thickness: 0.2,
                  //                     horizontalPadding: 50,
                  //                     dividerColor: Colors.grey),
                  //               ],
                  //             ),
                  //           ),
                  //           MyFoodPost(
                  //             foodName: 'مرغ گریـل شده',
                  //             imagePath: 'lib/assets/images/food3.png',
                  //             price: '160/000',
                  //             onTap: () {},
                  //             textDirection: TextDirection.ltr,
                  //             desc:
                  //                 'مرغ گریل شده + پنیر چدار + کاهو + سس مخصوص + سیب زمینی سرخ کرده',
                  //           ),
                  //           const SizedBox(
                  //             height: 60,
                  //           )
                  //         ],
                  //       )),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
