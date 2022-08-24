import 'dart:ffi';

import 'package:bmi_calculator_flutter/constants/app_constants.dart';
import 'package:bmi_calculator_flutter/model/record.dart';
import 'package:bmi_calculator_flutter/widgets/records_item.dart';
import 'package:bmi_calculator_flutter/widgets/show_average.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BmiMainPage extends StatefulWidget {
  const BmiMainPage({Key? key}) : super(key: key);

  @override
  State<BmiMainPage> createState() => _BmiMainPageState();
}

class _BmiMainPageState extends State<BmiMainPage> {
  var formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  // final recordsList = Records.recordsList();
  double result = 0.0;
  String level = "";
  List<Records> records = [];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
            child: Text(
          Constants.appTitle,
          style: Constants.appBarStyle,
        )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 6,
                child: _buildForm(),
              ),
              Expanded(
                flex: 4,
                child: ShowAverage(average: result, category: level),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: records.length,
                  itemBuilder: ((context, index) {
                    int reverseIndex = records.length - 1 - index;
                    return Card(
                        color: Colors.amber,
                        child: ListTile(
                          title: Text(
                            "Name : ${records[reverseIndex].name.toString().toUpperCase()}     Age : ${records[reverseIndex].age.toString()}      ${records[reverseIndex].hmiLevel!.toUpperCase()}",
                          ),
                          subtitle: Text(
                              "Kilo : ${records[reverseIndex].kg.toString()}, Height : ${records[reverseIndex].cm.toString()}  HMI Index : ${records[reverseIndex].hmiIndex}"),
                        ));
                  }))),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.0),
                width: 140,
                child: _buildTextField("Name", _nameController),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(0.0),
                  child: _buildTextField("Age", _ageController),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: _buildTextField("kg", _weightController),
                ),
                Expanded(
                  child: _buildTextField("cm", _heightController),
                ),
                IconButton(
                  onPressed: () {
                    _countBmi();
                    _whichlevel();
                    _saveToList();
                    debugPrint(_heightController.text);
                    debugPrint("${_weightController.text} weigt");
                  },
                  icon: Icon(Icons.arrow_forward_ios_sharp),
                  color: Constants.mainColor,
                  iconSize: 30,
                  padding: EdgeInsets.all(5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      String text, TextEditingController textEditingController) {
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: OutlineInputBorder(),
          labelText: text,
          filled: true,
          fillColor: Constants.mainColor.shade100.withOpacity(0.3),
        ),
      ),
    );
  }

  void _countBmi() {
    setState(
      () {
        result = double.parse(_weightController.text.toString()) /
            (double.parse(_heightController.text.toString()) /
                100 *
                double.parse(_heightController.text.toString()) /
                100);
      },
    );

    debugPrint(result.toString());
  }

  void _whichlevel() {
    setState(() {
      if (result < 18.4) {
        level = "Underweight";
      } else if (result >= 18.5 && result <= 24.99) {
        level = "Normal weight";
      } else if (result >= 25 && result <= 29.9) {
        level = "Overweight";
      } else if (result >= 30 && result <= 34.9) {
        level = "Obesity";
      } else if (result > 35) {
        level = "Extrem Obesity";
      }
    });
  }

  void _saveToList() {
    records.add(
      Records(
          id: "${DateTime.now().millisecondsSinceEpoch}",
          cm: int.parse(_heightController.text),
          kg: int.parse(_weightController.text),
          name: _nameController.text,
          age: int.parse(_ageController.text),
          hmiIndex: double.parse(
            result.toStringAsFixed(2),
          ),
          hmiLevel: level),
    );
    debugPrint("ID DEGERI -> ${records[0].id}");
  }
}
