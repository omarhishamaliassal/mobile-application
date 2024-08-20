import 'package:e7gzly/view-models/home_view_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e7gzly/views/field_details_view.dart';

import '../models/feild_details_model.dart';
import '../widgets/NavBarr.dart';
import '../widgets/card_text.dart';

class HomePage extends GetWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : Scaffold(
                drawer: const NavBarr(),
                backgroundColor: const Color(0xFF212121),
                appBar: AppBar(
                  backgroundColor: const Color(0xFF303030),
                  title: Text('7ogozat',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8))),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(children: [
                      _listViewCategory(),
///////////////////////////////////////////////////////////////////////////////////
                      //SearchBar(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .67,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GetBuilder<HomeViewModel>(
                            builder: (controller) => ListView.separated(
                              shrinkWrap: true,
                              itemCount: controller.feildDetailsModel.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    FeildDetailsModel fieldDetails =
                                        FeildDetailsModel(
                                            name: controller
                                                .feildDetailsModel[index]
                                                .location,
                                            price: controller
                                                .feildDetailsModel[index].price,
                                            image: controller
                                                .feildDetailsModel[index].image,
                                            location: controller
                                                .feildDetailsModel[index].name);
                                    controller.setFieldDetails(fieldDetails);

                                    Get.to(FieldDetailsView(
                                        model: controller
                                            .feildDetailsModel[index]));
                                  },
                                  child: CardText(
                                      text: controller
                                          .feildDetailsModel[index].location,
                                      text1: controller
                                          .feildDetailsModel[index].name,
                                      price: controller
                                          .feildDetailsModel[index].price,
                                      image: controller
                                          .feildDetailsModel[index].image,
                                      text0: "s"),
                                );
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ));
  }

// The List-View Widget of categories
  _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: 125,
              child: ListView.separated(
                itemCount: controller.categoryModel.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 90,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              controller.categoryModel[index].image,
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        controller.categoryModel[index].name,
                        style: TextStyle(
                            color: Color.fromARGB(255, 248, 247, 247)),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
              ),
            ),
    );
  }
}
