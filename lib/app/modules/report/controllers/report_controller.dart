import 'package:get/get.dart';
import 'package:silaan_logistic/app/data/services/shared_services.dart';

class ReportController extends GetxController {
  //intial
  String role = '';
  bool isFemaleExecutive = false;

  //functions
  setRole() async {
    role = (await SharedService().getSharedRole())!;
    isFemaleExecutive = (role == 'femaleExecutive');
    update();
  }

  @override
  void onInit() {
    setRole();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
