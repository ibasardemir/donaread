
class BookDetailsPage extends StatefulWidget {
  final BookModel book;

  BookDetailsPage({required this.book});

  @override
  _BookDetailsPageState createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.book_title!),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Book details here'),
      ),
    );
  }
}
