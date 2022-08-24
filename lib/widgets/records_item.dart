import 'package:bmi_calculator_flutter/model/record.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class RecordsItem extends StatelessWidget {
  const RecordsItem({
    Key? key,
    required this.record,
  }) : super(key: key);

  final Records record;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                record.name.toString(),
              ),
              Text(
                record.age.toString(),
              ),
              Text(
                record.cm.toString(),
              ),
              Text(
                record.kg.toString(),
              ),
            ],
          ),
        ),
      ],
    );

    //ListView.builder(
    //   padding: const EdgeInsets.all(8),
    //   itemCount: 4,
    //   itemBuilder: (BuildContext context, int index) {
    //     return Container(
    //       height: 50,
    //       color: Colors.amber,
    //       child: Center(
    //         child: Text(record.kg.toString()),
    //       ),
    //     );
    //   },
    // );
  }
}
