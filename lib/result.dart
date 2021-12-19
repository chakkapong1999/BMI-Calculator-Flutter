import 'package:bmi/my_constant.dart';
import 'package:bmi/widgets/reuse_container.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double bmi;
  final String result;
  const Result({Key? key, required this.bmi, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TEST"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Your Result",
                  style: const TextStyle(color: Myconstant.white, fontSize: 40),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReuseContainer(
                          color: Myconstant.primary,
                          customChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                result,
                                style: const TextStyle(
                                    color: Myconstant.white, fontSize: 30),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                bmi.toStringAsPrecision(4),
                                style: const TextStyle(
                                    color: Myconstant.white, fontSize: 60),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                result,
                                style: const TextStyle(
                                    color: Myconstant.white, fontSize: 30),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Calculate Again"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
