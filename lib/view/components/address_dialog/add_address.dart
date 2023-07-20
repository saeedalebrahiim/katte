import 'package:delivery/controller/addresses/address_controller.dart';
import 'package:delivery/model/api/generated/katte.swagger.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

buildAddAddress(
  BuildContext context,
) {
  var locationCtr = TextEditingController();
  var postCodeCtr = TextEditingController();
  var topicCtr = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SizedBox(
              child: Column(children: [
                TextField(
                  controller: topicCtr,
                  decoration: InputDecoration(label: Text("address name")),
                ),
                TextField(
                  controller: locationCtr,
                  decoration: InputDecoration(label: Text("location")),
                ),
                TextField(
                  controller: postCodeCtr,
                  decoration: InputDecoration(
                    label: Text("postCode"),
                  ),
                ),
                RawMaterialButton(onPressed: () async {
                  AddressDto dto = AddressDto(
                    location: locationCtr.text,
                    postalCode: postCodeCtr.text,
                    topic: topicCtr.text,
                    clientId: "00000000-0000-0000-0000-000000000000",
                    id: "00000000-0000-0000-0000-000000000000",
                  );
                  print(dto.toString());
                  addAddress(context: context, dto: dto).then((value) {
                    if (value.isSuccess == true) {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.confirm,
                        title: "Done",
                        onConfirmBtnTap: () => Navigator.of(context).pop(),
                      );
                    } else {}
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.confirm,
                      title: "Oops",
                      text: value.message.toString(),
                    );
                  });
                }),
              ]),
            ),
          ));
}
