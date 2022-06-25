import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';


class Pages extends StatelessWidget {
  final String heading;
  final int age;
  final String course;
  final int income;
  final String caste;
  final String sector;
  const Pages(
      {Key? key,
      required this.heading,
      required this.age,
      required this.course,
      required this.income,
      required this.caste,
      required this.sector})
      : super(key: key);


  void _requestDownload(String link) async {
    final taskId = await FlutterDownloader.enqueue(
        url: link,
        savedDir: '/storage/emulated/0/Download',
        showNotification: true, 
        openFileFromNotification: true, 
     );
  }


  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      appBar: AppBar(
        title: Text(heading),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 55.0,
          ),
          ListTile(
            leading: const MyBullet(),
            title: Text(
              'Applicable for ages below $age',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          ListTile(
            leading: const MyBullet(),
            title: Text(
              'Students selected $course course/courses can apply for',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          ListTile(
            leading: const MyBullet(),
            title: Text(
              'Annual Income should be less than $income',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          ListTile(
            leading: const MyBullet(),
            title: Text(
              'Students under the caste $caste are eligible',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          ListTile(
            leading: const MyBullet(),
            title: Text(
              'Scholarship is offered by $sector sector',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 55.0,
          ),
          const Text(
              'To know further details, tap the download button below to see the official documentation'),
          ElevatedButton(
            onPressed: () {
                _requestDownload('your_donwload_link');
            },
            child: const Text('DownLoad'),
          )
        ],
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  const MyBullet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
