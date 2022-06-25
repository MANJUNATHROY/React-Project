import 'package:flutter/material.dart';

class Compare extends StatefulWidget {
 final List compList;
  const Compare({Key? key, required this.compList}) : super(key: key);

  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  @override
  Widget build(BuildContext context) {
    int age;
    String course;
    int income;
    String caste;
    String sector;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookmarks',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: widget.compList.length,
          itemBuilder: (context, index) {
            age = widget.compList[index].age ?? 0;
            course = widget.compList[index].course ?? '';
            income = widget.compList[index].income ?? 0;
            caste = widget.compList[index].caste ?? '';
            sector = widget.compList[index].sector ?? '';
            return Card(
              child: Column(
                children: [
                  Text(
                    'Applicable for ages below $age',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Students selected $course course/courses can apply for',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Annual Income should be less than $income',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Students under the caste $caste are eligible',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Scholarship is offered by $sector sector',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
