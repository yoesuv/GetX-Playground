import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const routeName = '/counter';
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '0',
                style: TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    color: Colors.teal,
                    onPressed: () {},
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                  MaterialButton(
                    color: Colors.teal,
                    onPressed: () {},
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
