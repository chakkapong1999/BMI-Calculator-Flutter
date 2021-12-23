import 'package:bmi/my_constant.dart';
import 'package:bmi/result.dart';
import 'package:bmi/widgets/reuse_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: Myconstant.light,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int weight = 35;
  int heigth = 100;
  int age = 10;
  var text = '';
  var result;
  bool isClickedMale = false;
  bool isClickedFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Myconstant.dark,
      ),
      body: SafeArea(
        child: Column(
          children: [
            buildGender(),
            buildHeight(),
            Expanded(
              child: Row(
                children: [
                  buildWeight(),
                  buildAge(),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calculateBmi();
              },
              child: const Text("CALCULATE"),
              style: ElevatedButton.styleFrom(
                  primary: Myconstant.dark,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            )
          ],
        ),
      ),
    );
  }

  void calculateBmi() {
    var _height = heigth / 100;
    result = weight / (_height * _height);
    print(result);
    if (!isClickedMale && !isClickedFemale) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.warning,
                color: Colors.red,
                size: 40,
              ),
            ],
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Please select your gender.",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            )
          ],
        ),
      );
      return;
    } else {
      if (result > 30) {
        print("Obesity");
        text = "Obesity";
      } else if (result >= 25 && result <= 29.9) {
        print("Overweight");
        text = "Overweight";
      } else if (result >= 18.5 && result <= 24.9) {
        print("Normal weight");
        text = "Normal weight";
      } else {
        print("Underweight");
        text = "Underweight";
      }

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Result(bmi: result, result: text),
          ));
    }
  }

  Expanded buildAge() {
    return Expanded(
      child: ReuseContainer(
          color: Myconstant.primary,
          customChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "AGE",
                style: TextStyle(color: Myconstant.white, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "${age.toString()} years.",
                style: const TextStyle(color: Myconstant.white, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Myconstant.light,
                      shape: CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Myconstant.white,
                    ),
                    onPressed: () {
                      setState(() {
                        age--;
                        if (age < 0) age = 0;
                      });
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Myconstant.light,
                      shape: CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Myconstant.white,
                    ),
                    onPressed: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }

  Expanded buildWeight() {
    return Expanded(
      child: ReuseContainer(
          color: Myconstant.primary,
          customChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WEIGHT",
                style: TextStyle(color: Myconstant.white, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "${weight.toString()} kg.",
                style: TextStyle(color: Myconstant.white, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Myconstant.light,
                      shape: CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Myconstant.white,
                    ),
                    onPressed: () {
                      setState(() {
                        weight--;
                        if (weight < 0) weight = 0;
                      });
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Myconstant.light,
                      shape: CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Myconstant.white,
                    ),
                    onPressed: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ],
              )
            ],
          )),
    );
  }

  Expanded buildHeight() {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: ReuseContainer(
              color: Myconstant.primary,
              customChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: TextStyle(fontSize: 20, color: Myconstant.white),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${heigth.toString()} cm.",
                    style: TextStyle(fontSize: 20, color: Myconstant.white),
                  ),
                  const SizedBox(height: 15),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Myconstant.white,
                        inactiveTrackColor: Myconstant.dark,
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        thumbColor: Myconstant.light),
                    child: Slider(
                      min: 100,
                      max: 250,
                      value: heigth.toDouble(),
                      onChanged: (double value) => setState(() {
                        heigth = value.round();
                      }),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded buildGender() {
    return Expanded(
      child: Row(
        children: [
          buildMale(),
          buildFemale(),
        ],
      ),
    );
  }

  Expanded buildFemale() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isClickedFemale = !isClickedFemale;
            isClickedMale = !isClickedMale;
          });
        },
        child: ReuseContainer(
          color: Myconstant.primary,
          customChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.female,
                color: !isClickedFemale ? Myconstant.white : Myconstant.dark,
                size: 80,
              ),
              const SizedBox(height: 10),
              const Text(
                "FEMALE",
                style: TextStyle(color: Myconstant.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildMale() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isClickedMale = !isClickedMale;
            isClickedFemale = !isClickedMale;
          });
        },
        child: ReuseContainer(
          color: Myconstant.primary,
          customChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.male,
                color: !isClickedMale ? Myconstant.white : Myconstant.dark,
                size: 80,
              ),
              const SizedBox(height: 10),
              const Text(
                "MALE",
                style: TextStyle(color: Myconstant.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container reuseContainer() {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Myconstant.primary,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
