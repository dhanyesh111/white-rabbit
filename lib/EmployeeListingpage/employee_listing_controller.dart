import 'package:get/get.dart';
import 'package:white_rabit/apiService/api_services.dart';

import 'employee_listing_model.dart';

class EmployeeListingPageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployeeListingPageController());
  }
}

class EmployeeListingPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData(isUpdateCall: false);
  }

  static EmployeeListingPageController get to => Get.find();

  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxList<EmployeeListingModel> employeeList = <EmployeeListingModel>[].obs;
  getData({required bool isUpdateCall}) async {
    try {
      isLoading.value = true;
      employeeList.value =
          await ApiServices.getData(isUpdateCall: isUpdateCall);
      isError.value = false;
    } catch (error) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}
