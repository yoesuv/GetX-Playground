import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/menu/clock/clock_controller.dart';
import 'package:my_getx_playground/src/widgets/my_button.dart';

const secLength = 0.35;
const minLength = 0.30;
const hourLength = 0.27;

class ClockScreen extends GetView<ClockController> {
  static const routeName = '/clock';
  const ClockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.startClock();
    controller.initAlarmDateTime();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Clock Screen'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 32),
            Text(
              '${controller.hour}:${controller.minute}:${controller.second}',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Stack(
                children: [
                  Image.asset('assets/images/clock_background.png'),
                  AspectRatio(
                    aspectRatio: 1,
                    child: Transform.rotate(
                      angle: -pi / 2,
                      child: CustomPaint(
                        painter: ClockPainter(
                          dateTime: controller.dateTime.value,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: MyButton(
                label: 'Set Alarm Time',
                onPressed: () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(
                      hour: DateTime.now().hour,
                      minute: DateTime.now().minute,
                    ),
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          alwaysUse24HourFormat: true,
                        ),
                        child: child ?? Container(),
                      );
                    },
                  );
                  if (time != null) {
                    controller.setAlarmDateTime(time);
                  }
                },
              ),
            ),
            _buildAlarmDate(),
          ],
        ),
      ),
    );
  }

  Widget _buildAlarmDate() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        controller.alarmDateTime.value == null
            ? Container()
            : Text(
                '${controller.alarmDateTime.value?.hour.toString().padLeft(2, '0')}:${controller.alarmDateTime.value?.minute.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ],
    );
  }
}

class ClockPainter extends CustomPainter {
  final DateTime dateTime;

  ClockPainter({required this.dateTime});

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    double hourX = centerX +
        size.width *
            hourLength *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            hourLength *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    // hour
    canvas.drawLine(
      center,
      Offset(hourX, hourY),
      Paint()
        ..color = const Color(0xFF616161)
        ..strokeWidth = 10
        ..style = PaintingStyle.stroke,
    );

    double minX = centerX +
        size.width * minLength * cos((dateTime.minute * 6) * pi / 180);
    double minY = centerY +
        size.width * minLength * sin((dateTime.minute * 6) * pi / 180);
    // minute
    canvas.drawLine(
      center,
      Offset(minX, minY),
      Paint()
        ..color = const Color(0xFF616161)
        ..strokeWidth = 5
        ..style = PaintingStyle.stroke,
    );

    double secondX = centerX +
        size.width * secLength * cos((dateTime.second * 6) * pi / 180);
    double secondY = centerY +
        size.width * secLength * sin((dateTime.second * 6) * pi / 180);
    // second
    canvas.drawLine(
      center,
      Offset(secondX, secondY),
      Paint()
        ..color = const Color(0xFFF44336)
        ..strokeWidth = 2,
    );

    // center circle
    canvas.drawCircle(center, 8, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
