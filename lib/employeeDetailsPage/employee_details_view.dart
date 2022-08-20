import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_rabit/customeWidgets/imageLoader.dart';
import 'package:white_rabit/employeeDetailsPage/employee_details_controller.dart';

class EmployeeDetailsView extends StatelessWidget {
  const EmployeeDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(EmployeeDetailsController.to.employee.name ?? ""),
      ),
      body: GetX<EmployeeDetailsController>(builder: (controller) {
        return controller.isError.value
            ? const Center(child: Text("Oops Something went wrong"))
            : ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                            tag: EmployeeDetailsController.to.employee.name ??
                                "",
                            child: ImageLoader(
                                radius: 160,
                                image: EmployeeDetailsController
                                        .to.employee.profileImage ??
                                    ""))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const EmployeeDetailsContainer()
                ],
              );
      }),
    );
  }
}

class EmployeeDetailsContainer extends StatelessWidget {
  const EmployeeDetailsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
              "Employee name : ${EmployeeDetailsController.to.employee.name ?? "Un known"}"),
          const SizedBox(
            height: 10,
          ),
          Text(
              "User name : ${EmployeeDetailsController.to.employee.username ?? "Un known"}"),
          const SizedBox(
            height: 10,
          ),
          Text(
              "Email : ${EmployeeDetailsController.to.employee.email ?? "Un known"}"),
          const SizedBox(
            height: 10,
          ),
          Text(
              "Phone : ${EmployeeDetailsController.to.employee.phone ?? "Un known"}"),
          const SizedBox(
            height: 10,
          ),
          Text(
              "WebSite : ${EmployeeDetailsController.to.employee.website ?? "Un known"}"),
          const SizedBox(
            height: 10,
          ),
          const AddressContainer(),
          const SizedBox(
            height: 20,
          ),
          const CompanyDetailsContainer(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class AddressContainer extends StatelessWidget {
  const AddressContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Employee Address : ".toUpperCase()),
        Text((EmployeeDetailsController.to.employee.address?.suite ?? "") +
            "\n" +
            (EmployeeDetailsController.to.employee.address?.street ?? "") +
            "\n" +
            (EmployeeDetailsController.to.employee.address?.city ?? "") +
            "\n" +
            (EmployeeDetailsController.to.employee.address?.zipcode ?? "")),
      ],
    );
  }
}

class CompanyDetailsContainer extends StatelessWidget {
  const CompanyDetailsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Company details".toUpperCase(),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
            "Company name : ${EmployeeDetailsController.to.employee.company?.name ?? ""}"),
        const SizedBox(
          height: 10,
        ),
        Text(
            "Catch Phrase : ${EmployeeDetailsController.to.employee.company?.catchPhrase ?? ""}"),
        const SizedBox(
          height: 10,
        ),
        Text(EmployeeDetailsController.to.employee.company?.bs ?? "")
      ],
    );
  }
}
