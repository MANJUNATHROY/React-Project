import 'package:flutter/material.dart';
import 'package:hack/Pages/page.dart';
import 'package:hack/Pages/searchpage.dart';
import 'package:hack/model/Scholarships.dart';
import 'package:hack/model/user.dart';
import 'package:hack/screens/bookmarks.dart';
import 'package:hack/screens/comparepage.dart';
import 'package:hack/services/auth.dart';
import 'package:hack/services/database.dart';
import 'package:provider/provider.dart';

// Home Page
class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  static const IconData rule = IconData(0xe547, fontFamily: 'MaterialIcons');
  List<Scholarships> compareList = [];
  List<Scholarships> scholarlist = [
    Scholarships(
      age: 24,
      heading: 'Scholarship 1',
      course: 'All',
      income: 1000000,
      caste: 'All',
      sector: 'All',
      url: '',
    ),
    Scholarships(
      age: 21,
      heading: 'Scholarship 2',
      course: 'Engineering',
      income: 1000000,
      caste: 'All',
      sector: 'Government',
      url: '',
    ),
    Scholarships(
      age: 24,
      heading: 'Scholarship 3',
      course: 'All',
      income: 1000000,
      caste: 'All',
      sector: 'Private',
      url: '',
    ),
    Scholarships(
      age: 21,
      heading: 'Scholarship 4',
      course: 'Engineering',
      income: 1000000,
      caste: 'All',
      sector: 'Government',
      url: '',
    ),
    Scholarships(
      age: 21,
      heading: 'Scholarship 5',
      course: 'Engineering',
      income: 1000000,
      caste: 'All',
      sector: 'Government',
      url: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<GetUser?>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOME',
          textAlign: TextAlign.center,
        ),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search)),
          const SizedBox(width: 8.0),

          PopupMenuButton(
            child: Row(
              children: const [
                Icon(
                  Icons.filter,
                  size: 20.0,
                ),
                SizedBox(
                  width: 15.0,
                ),
              ],
            ),
            color: Colors.blue,
            offset: const Offset(0, 50.0),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text(
                  "Income",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const PopupMenuItem<int>(
                value: 0,
                child: Text(
                  "Age",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const PopupMenuItem<int>(
                value: 0,
                child: Text(
                  "Caste",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const PopupMenuItem<int>(
                value: 0,
                child: Text(
                  "Sector",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const PopupMenuItem<int>(
                value: 0,
                child: Text(
                  "Gender",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            onSelected: (item) => {print(item)},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              child: Text(
                'ScholarWorld',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.bookmark),
              title: const Text('Bookmark'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BookMarkPage(uid: user!.uid)));
              },
            ),
            ListTile(
              leading: Icon(Icons.compare),
              title: Text('Compare'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => Compare(compList: compareList)));
              },
            ),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await _auth.SignOut();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: scholarlist.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(2.0),
              child: ListTile(
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text("Add to BookMark"),
                      onTap: () {
                        DataBase(uid: user!.uid)
                            .updatedatabaseservice(scholarlist[index].heading);
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("Add to Compare"),
                      onTap: () {
                        compareList.add(scholarlist[index]);
                      },
                    )
                  ],
                ),
                title: Text(
                  scholarlist[index].heading,
                  style: const TextStyle(
                    color: Color(0xFF6CA8F1),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => Pages(
                          heading: scholarlist[index].heading,
                          age: scholarlist[index].age,
                          course: scholarlist[index].course,
                          income: scholarlist[index].income,
                          caste: scholarlist[index].caste,
                          sector: scholarlist[index].sector)));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
