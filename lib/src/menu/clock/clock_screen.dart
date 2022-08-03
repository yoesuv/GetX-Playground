import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_getx_playground/src/menu/clock/clock_controller.dart';
import 'package:my_getx_playground/src/widgets/my_button.dart';

class ClockScreen extends GetView<ClockController> {
  static const routeName = '/clock';
  const ClockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.startClock();
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
            AspectRatio(
              aspectRatio: 1,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.rotate(
                    angle: -pi / 2,
                    child: CustomPaint(
                      painter:
                          ClockPainter(dateTime: controller.dateTime.value),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: MyButton(
                label: 'Set Alarm Time',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
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

    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);
    // second
    canvas.drawLine(
        center, Offset(secondX, secondY), Paint()..color = Colors.red);

    double minX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minY =
        centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);
    // minute
    canvas.drawLine(
      center,
      Offset(minX, minY),
      Paint()
        ..color = Colors.green
        ..strokeWidth = 5
        ..style = PaintingStyle.stroke,
    );

    double hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    // hour
    canvas.drawLine(
      center,
      Offset(hourX, hourY),
      Paint()
        ..color = Colors.blue
        ..strokeWidth = 10
        ..style = PaintingStyle.stroke,
    );

    // center circle
    canvas.drawCircle(center, 24, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
