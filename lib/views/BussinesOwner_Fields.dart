import 'package:flutter/material.dart';
import '../widgets/BussinessOwner_Display_Fields_Cards.dart';
import '../view-models/field_view_model.dart';
import 'package:e7gzly/view-models/home_view_model.dart';
import 'package:get/get.dart';

import '../widgets/NavBarr.dart';
import '../widgets/card_text.dart';

class MyFields extends StatelessWidget {
  const MyFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<FieldViewModel>(
      builder: (controller) => Scaffold(
        backgroundColor: Color(0xFF212121),
        appBar: AppBar(
          title: const Text('Fields'),
          centerTitle: true,
          backgroundColor: Color(0xFF303030),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GetBuilder<FieldViewModel>(
                builder: (controller) => ListView.separated(
                  shrinkWrap: true,
                  itemCount: controller.feildDetailsModel.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return FieldsCardText(
                      place: controller.feildDetailsModel[index].location,
                      Field: controller.feildDetailsModel[index].name,
                      price: controller.feildDetailsModel[index].price,
                      
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}
