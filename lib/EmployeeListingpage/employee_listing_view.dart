import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_rabit/customeWidgets/imageLoader.dart';
import 'package:white_rabit/routes/routes.dart';

import 'employee_listing_controller.dart';
import 'employee_listing_model.dart';

class EmployeeListingPage extends StatelessWidget {
  const EmployeeListingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("White Rabbit"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            EmployeeListingPageController.to.getData(isUpdateCall: true);
          },
          child: GetX<EmployeeListingPageController>(builder: (controller) {
            return controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : controller.isError.value
                    ? Center(
                        child: GestureDetector(
                        onTap: () {
                          EmployeeListingPageController.to
                              .getData(isUpdateCall: true);
                        },
                        child: const Text(
                          "Oops Something went wrong \n Tap to refresh",
                          textAlign: TextAlign.center,
                        ),
                      ))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.employeeList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(employeeDetailsPageRoute,
                                  arguments: controller.employeeList[index]);
                            },
                            child: EmployeeListingContainer(
                                employee: controller.employeeList[index]),
                          );
                        });
          }),
        ));
  }
}

class EmployeeListingContainer extends StatelessWidget {
  final EmployeeListingModel employee;
  const EmployeeListingContainer({Key? key, required this.employee})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white54)),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Hero(
                tag: employee.name ?? "",
                child: ImageLoader(
                  image: employee.profileImage ?? "",
                )),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(employee.name ?? ""),
              Text("Company : ${employee.company?.name ?? "Un known"}"),
            ],
          ),
        ],
      ),
    );
  }
}
