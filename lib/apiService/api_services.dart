import 'dart:io';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:white_rabit/EmployeeListingpage/employee_listing_model.dart';
import 'package:white_rabit/Urls/urls.dart';
import 'package:white_rabit/constants/hive_key_constants.dart';
import 'package:white_rabit/dataBase/local_data_base_operations.dart';

class ApiServices {
  static Future<List<EmployeeListingModel>> getData(
      {required bool isUpdateCall}) async {
    Box box = await LocalDataBase.getBox(boxName: homePageBox);

    try {
      http.Response response = await http.get(Uri.parse(urlGetEmployeeDetails));

      if (response.statusCode == 200) {
        box.clear();
        box.put(homePageData, response.body);
      } else {
        throw Exception("Some thing went wrong");
      }
    } catch (error) {
      if (error is SocketException && isUpdateCall) {
        Get.showSnackbar(const GetSnackBar(message: "No internet connection"));
      }
    }
    var myMap = box.get(homePageData) ?? [];
    if (myMap.isEmpty) {
      throw Exception("No Data in side $homePageBox");
    } else {
      return employeeListingModelFromJson(myMap.toString());
    }
  }
}
