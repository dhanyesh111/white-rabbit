import 'package:get/get.dart';
import 'package:white_rabit/EmployeeListingpage/employee_listing_model.dart';

class EmployeeDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployeeDetailsController());
  }
}

class EmployeeDetailsController extends GetxController {
  static EmployeeDetailsController get to => Get.find();
  @override
  void onInit() {
    super.onInit();
    try {
      employee = Get.arguments;
    } catch (error) {
      isError.value = true;
    }
  }

  RxBool isError = false.obs;
  EmployeeListingModel employee = EmployeeListingModel();
}
