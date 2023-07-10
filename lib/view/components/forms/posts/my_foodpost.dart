import 'package:delivery/model/db/box/box.dart';
import 'package:delivery/model/db/shop_card_entity.dart';
import 'package:delivery/view/components/forms/my_addtocard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

class MyFoodPost extends StatefulWidget {
  final String imagePath, foodName, price, desc, productId;
  final TextDirection textDirection;
  final int? count;
  final Function()? onTap;
  const MyFoodPost({
    super.key,
    required this.imagePath,
    required this.foodName,
    this.onTap,
    required this.price,
    required this.textDirection,
    required this.desc,
    this.count,
    required this.productId,
  });

  @override
  State<MyFoodPost> createState() => _MyFoodPostState();
}

class _MyFoodPostState extends State<MyFoodPost> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            textDirection: widget.textDirection,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    widget.foodName,
                    style: GoogleFonts.notoNaskhArabic(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${widget.price} T ",
                    style: GoogleFonts.notoNaskhArabic(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyAddToCard(
                    shopCardEntity: ShopCardEntity(
                        producyName: widget.foodName,
                        producytId: widget.productId,
                        productCount: 0,
                        productImageUrl: widget.imagePath,
                        description: widget.desc,
                        productPrice: widget.price),
                  ),
                ],
              ),
              Image(
                image: NetworkImage(widget.imagePath),
                fit: BoxFit.cover,
                width: 150,
                height: 150,
              )
            ],
          ),
          Text(
            textDirection: TextDirection.rtl,
            widget.desc,
            style: GoogleFonts.notoNaskhArabic(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          )
        ],
      ),
    );
  }
}
