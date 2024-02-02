import 'dart:async';
import 'dart:math';
import 'package:assignment_app/data/DataRepository.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final DataRepository _dataRepository = DataRepository();

  RxInt widget1Value = 0.obs;
  RxInt widget2Value = 0.obs;
  RxString widget3Value = ''.obs;
  RxInt widget4Value = 5.obs;
  RxBool isTimeout = false.obs;
  int successScore = 0;
  int failureScore = 0;
  int attempts = 1;

  late Timer timer;
  late CountDownController countDownController;

  @override
  void onInit() {
    loadStoredValues();
    countDownController = CountDownController();
    startTimer();
    super.onInit();
  }

  void loadStoredValues() async {
    widget2Value.value = await _dataRepository.getWidget2Value();
    // Similarly, load values for widget3 and widget4
  }

  void saveValues() async {
    await _dataRepository.setWidget2Value(widget2Value.value);
    // Similarly, save values for widget3 and widget4
  }

  void onWidget5Tap() {
    // Implement logic for tapping Widget 5
    widget2Value.value = _generateRandomNumber();
    widget1Value.value = DateTime.now().second;

    if (widget2Value.value == widget1Value.value) {
      successScore++;
      // Display success message
    } else {
      failureScore++;
      // Display failure message
    }
    attempts++;

    countDownController.restart(duration: 5);

    resetTimer();
    saveValues(); // Save values after each tap
  }

  int _generateRandomNumber() {
    final random = Random();
    return random.nextInt(60);
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (widget4Value.value > 0) {
        widget4Value.value--;
      } else {
        _handleTimeout();
      }
    });
  }

  void resetTimer() {
    widget4Value.value = 5;
  }

  void _handleTimeout() {
    timer.cancel();
    isTimeout.value = true;
    // Display timeout failure message
    resetTimer();
    saveValues(); // Save values after each timeout
  }

  @override
  void dispose() {
    timer.cancel();
    saveValues(); // Save values when the app is closed
    super.dispose();
  }
}
