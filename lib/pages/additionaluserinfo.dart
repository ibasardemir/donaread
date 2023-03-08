class AdditionalUserInfoPage extends StatefulWidget {
  const AdditionalUserInfoPage({Key? key}) : super(key: key);

  @override
  _AdditionalUserInfoPageState createState() => _AdditionalUserInfoPageState();
}

class _AdditionalUserInfoPageState extends State<AdditionalUserInfoPage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurname = TextEditingController();
  final TextEditingController _controllerPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.green,
        backgroundColor: Colors.green,
        title: Text("Register"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField("Name", _controllerName),
            _entryField("Surname", _controllerSurname),
            _entryField("Phone Number", _controllerPhoneNumber),
            ElevatedButton(
              onPressed: () {},
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }
}
