import 'package:flutter/material.dart';
import 'uploadpage.dart';

"""
class Book {
  final String name;
  final String isbn;
  final String condition;

  Book({required this.name, required this.isbn, this.condition = 'Unknown'});
}
"""
  
  """
  
class _MyAppState extends State<MyApp> {
  String buttonName = "Upload";
  int currentIndex = 0;
  List<Book> books = []; // Add this line

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(books: books),
    );
  }
}
  """
  
class FirstPage extends StatefulWidget {
  final List<Book> books;

  FirstPage({required this.books, Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String buttonName = "Add a book";
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.green,
        backgroundColor: Colors.green,
        title: const Text('Book Swap'),
      ),
      body: currentIndex == 2
          ? Column(
              children: [
                Container(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return UploadPage(
                                onSubmit: (name, isbn, condition) {
                                  // Add the uploaded book to the list
                                  setState(() {
                                    widget.books.add(Book(
                                        name: name,
                                        isbn: isbn,
                                        condition: condition));
                                  });
                                },
                                books: widget
                                    .books, // pass books to the UploadPage widget
                              );
                            }),
                          );
                        },
                        child: Text(buttonName),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.books.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(widget.books[index].name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.books[index].isbn),
                            SizedBox(height: 4),
                            Text('Condition: ${widget.books[index].condition}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : SizedBox(),
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              backgroundColor: Colors.green,
              label: 'Search',
              icon: Icon(Icons.search)),
          const BottomNavigationBarItem(label: 'Map', icon: Icon(Icons.map)),
          const BottomNavigationBarItem(
              label: 'Upload', icon: Icon(Icons.upload)),
          const BottomNavigationBarItem(
              label: 'Community', icon: Icon(Icons.people_alt)),
          const BottomNavigationBarItem(
              label: 'Profile', icon: Icon(Icons.person))
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
