import 'package:delivery/model/api/generated/katte.swagger.dart';
import 'package:delivery/view/components/address_dialog/add_address.dart';
import 'package:delivery/view/components/address_dialog/show_address.dart';
import 'package:flutter/material.dart';

buildShowListAddressDialog(
  BuildContext context,
  List<AddressDto> dto,
) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SizedBox(
              child: Column(children: [
                for (var element in dto)
                  RawMaterialButton(
                    onPressed: () {
                      buildShowAddressDialog(context, element);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(dto.first.topic.toString()),
                    ),
                  ),
                RawMaterialButton(
                  onPressed: () {
                    buildAddAddress(context);
                  },
                  fillColor: Colors.green,
                  child: Text("add new address"),
                )
              ]),
            ),
          ));
}
