import 'package:delivery/model/api/generated/katte.swagger.dart';
import 'package:flutter/material.dart';

buildShowAddressDialog(
  BuildContext context,
  AddressDto dto,
) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SizedBox(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(dto.location.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(dto.postalCode.toString()),
                ),
              ]),
            ),
          ));
}
