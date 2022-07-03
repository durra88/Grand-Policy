import 'package:GrandPolicy/model/deduction_model/deduction_model.dart';
import 'package:GrandPolicy/model/response_model/response_model.dart';
import 'package:GrandPolicy/services/deduction_services/deduction_service.dart';
import 'package:get/get.dart';

class DeductionController extends GetxController {
  final deductionModel = <DeductionModel>[].obs;
  var loadingData = true.obs;

  final DeductionServices _deductionServices = DeductionServices();
  @override
  void onInit() {
    fetchDeduction();
    super.onInit();
  }

  Future<dynamic> fetchDeduction() async {
    loadingData.value = true;

    ResponseModel responseModel =
        await _deductionServices.getDeductionHistory();
    //  log("________________deduction${responseModel.toString()}");
    deductionModel.value = DeductionModel.toListOfModel(responseModel.data!);
    loadingData.value = false;

    update();
  }

  @override
  void dispose() {
    Get.delete<DeductionController>();
    super.dispose();
  }
}
