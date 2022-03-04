import 'package:bmi/constant/my_constant.dart';
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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Your Result",
                  style: TextStyle(color: MyConstant.white, fontSize: 40),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ReuseContainer(
                          color: MyConstant.primary,
                          customChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                result,
                                style: const TextStyle(
                                    color: MyConstant.white, fontSize: 30),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                bmi.toStringAsPrecision(4),
                                style: const TextStyle(
                                    color: MyConstant.white, fontSize: 60),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: MyConstant.dark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Calculate Again"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
