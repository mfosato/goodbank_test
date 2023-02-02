import 'package:flutter_genius_scan/flutter_genius_scan.dart';
import 'package:get/get.dart';
import 'package:goodbank_test/app/core/values/strings.dart';

class HomeController extends GetxController {
  Strings strings = Strings();

  RxString scannedImage = RxString('');

  bool get withScannedImage => scannedImage.value != '';

  @override
  void onInit() {
    super.onInit();
    FlutterGeniusScan.setLicenceKey(strings.geniusScanLicenseKey);
  }

  Future<String?> scan() async {
    try {
      var result = await FlutterGeniusScan.scanWithConfiguration(
          {'multiPage': false, 'defaultFilter': 'none'});
      String? finalScannedImage = result['scans'][0]['enhancedUrl'];
      scannedImage.value = finalScannedImage?.substring(7) ?? '';
      return finalScannedImage;
    } catch (e) {
      return null;
    }
  }
}
