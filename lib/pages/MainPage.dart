import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/MainController.dart';
import '../value/AppColor.dart';

class MainPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Scaffold(
        backgroundColor: AppColor.homeBg,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Main Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCard('Current Second', '${controller.widget1Value}', AppColor.skyBlue, AppColor.borderBlue),
                  _buildCard('Random Number', '${controller.widget2Value}', AppColor.purple, AppColor.borderPurple),
                ],
              ),
              const SizedBox(height: 30),

              (controller.widget1Value == controller.widget2Value) ?
              _buildSuccessCard() : _buildFailureCard(),

              const SizedBox(height: 50),
              _buildCircularCountDownTimer(),

              const SizedBox(height: 100),
              _buildClickMeButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title, String value, Color bgColor, Color borderColor) {
    return Card(
      color: bgColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(title),
            const Divider(color: AppColor.black, height: 1, thickness: 1),
            Text(value),
          ],
        ),
      ),
    );
  }

  Widget _buildFailureCard() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Obx(
            () => Card(
          color: AppColor.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(controller.isTimeout.value ? 'Sorry! Timeout' : 'Sorry! Try Again', style: const TextStyle(color: AppColor.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 12),
                Divider(color: AppColor.black.withOpacity(0.5), height: 1, thickness: 0.5),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Attempt: ${controller.attempts}', style: const TextStyle(color: AppColor.white, fontSize: 22, fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessCard() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        color: AppColor.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Success :)', style: TextStyle(color: AppColor.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              Divider(color: AppColor.black.withOpacity(0.5), height: 1, thickness: 0.5),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Score: ${controller.successScore} / ${controller.attempts}', style: const TextStyle(color: AppColor.white, fontSize: 22, fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularCountDownTimer() {
    return Center(
      child: CircularCountDownTimer(
        duration: (controller.widget4Value).toInt(),
        initialDuration: 0,
        controller: controller.countDownController,
        width: 120,
        height: 120,
        ringColor: AppColor.grey,
        ringGradient: null,
        fillColor: AppColor.green,
        fillGradient: null,
        backgroundGradient: null,
        strokeWidth: 6.0,
        strokeCap: StrokeCap.round,
        textStyle: const TextStyle(fontSize: 20.0, color: AppColor.black, fontWeight: FontWeight.bold),
        textFormat: CountdownTextFormat.MM_SS,
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,
        autoStart: true,
        onComplete: () {
          // Add any logic when the countdown timer completes
          controller.resetTimer();
          // Reset values and show failure card
          controller.widget1Value.value = DateTime.now().second;
          controller.widget2Value.value = 0;
          controller.isTimeout.value = true;
          controller.saveValues(); // Save values after each countdown completion
        },
      ),
    );
  }

  Widget _buildClickMeButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
          backgroundColor: MaterialStateProperty.all<Color>(AppColor.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        onPressed: controller.onWidget5Tap,
        child: const Text('Click Me', style: TextStyle(color: AppColor.white)),
      ),
    );
  }
}
