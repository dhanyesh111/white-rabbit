import 'package:get/get.dart';
import 'package:white_rabit/EmployeeListingpage/employee_listing_controller.dart';
import 'package:white_rabit/EmployeeListingpage/employee_listing_view.dart';
import 'package:white_rabit/employeeDetailsPage/employee_details_controller.dart';
import 'package:white_rabit/employeeDetailsPage/employee_details_view.dart';
import 'package:white_rabit/routes/routes.dart';

abstract class AppPages {
  static List<GetPage> appPages = [
    GetPage(
        name: employeeListingPage,
        page: () => const EmployeeListingPage(),
        binding: EmployeeListingPageControllerBinding()),
    GetPage(
        name: employeeDetailsPageRoute,
        page: () => const EmployeeDetailsView(),
        binding: EmployeeDetailsControllerBinding()),
  ];
}
