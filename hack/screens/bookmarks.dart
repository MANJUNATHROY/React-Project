import 'package:flutter/material.dart';
import 'package:hack/services/database.dart';

class BookMarkPage extends StatefulWidget {
  final String uid;
  const BookMarkPage({Key? key, required this.uid}) : super(key: key);

  @override
  _BookMarkPageState createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  List<String> bookmarks = [];
  void convertFutureListToList() async {
    Future<List<String>> _futureOfList = DataBase(uid: widget.uid).getdata();
    bookmarks = await _futureOfList;
  }

  @override
  void initState() {
    super.initState();
    convertFutureListToList();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookmarks',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: bookmarks.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text("Remove from BookMark"),
                      onTap: () {
                        DataBase(uid: widget.uid)
                            .deletedatabaseservice(bookmarks[index]);
                          Navigator.pop(context);
                      },
                    )
                  ],
                ),
                title: Text(bookmarks[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
