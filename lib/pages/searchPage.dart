import 'package:flutter/material.dart';
import 'package:sampleproject/pages/uploadpage.dart';
import 'Kitap_detaylari.dart';
import '../datas/kitap.dart';
import "firstpage.dart";
import "haberler.dart";
import "profilepage.dart";
import "../managers/bookmanager.dart";

/*
class Kitap{
  String? name;
  String? uid;
  double? mesafe;
  String? il;
  String? bagis_turu;
  String? condition;
  String? foto;
  
  Kitap(this.uid,
  this.name,
  this.mesafe,
  this.il,
  this.bagis_turu,
  this.condition,
  this.foto);

}

*/
class SearchPageTo extends StatefulWidget {
  const SearchPageTo({Key? key}) : super(key: key);

  @override
  State<SearchPageTo> createState() => _SearchPageToState();
}

class _SearchPageToState extends State<SearchPageTo> {
  int currentIndex = 0;
  // bool valuecheckbox = false;
  bool isGoodChecked = false;
  bool isAverageChecked = false;
  bool isBadChecked = false;
  final TextEditingController searchController = TextEditingController();

  void updateList() {
    setState(() {
      List<String> selectedFilters = [];
      if (isGoodChecked == false &&
          isAverageChecked == false &&
          isBadChecked == false) {
        display_list = main_books_list;
      } else {
        if (isGoodChecked) selectedFilters.add('İyi');
        if (isAverageChecked) selectedFilters.add('Orta');
        if (isBadChecked) selectedFilters.add('Kötü');
        String value = searchController.text;
        display_list = main_books_list.where((element) {
          bool titleContainsValue =
              element.name!.toLowerCase().contains(value.toLowerCase());
          bool filterMatches = selectedFilters.contains(element.condition);
          return titleContainsValue &&
              (filterMatches || selectedFilters.isEmpty);
        }).toList();
      }
    });
  }

  //
  static List<Kitap> main_books_list = [
    Kitap(
        id: 1,
        name: 'Küçük Yaprağın Öyküsü',
        userLocation: 'İstanbul',
        condition: 'İyi',
        isbn: 0,
        uid:
            "" /*'https://cdn.pixabay.com/photo/2023/01/31/05/59/zebra-7757193_960_720.jpg'*/)
  ];
  //static List<Kitap> main_books_list = Bookmanager().viewBooks();

  List<Kitap> display_list = List.from(main_books_list);
  /////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'DonaRead',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        )),
        leading: Container(child: Image.asset("assets/image.png")),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.black),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('DonaRead'),
                    content: const Text(
                        'Biz kitapların herkesçe erişilebilir olmasına inanıyoruz.'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      //////////////////////////////////

      body:
          //Search
          currentIndex == 0
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kitap Ara',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0),
                      ),

                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        //onChanged: (value) => updateList(value),
                        controller: searchController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.green[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Kitap ismi ile arama',
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.black,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.filter_alt_outlined,
                                color: Colors.black),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setState) {
                                        return AlertDialog(
                                          title: const Text('Filtrele'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Kitap Durumu",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                              CheckboxListTile(
                                                title: const Text('İyi'),
                                                value: isGoodChecked,
                                                activeColor: Colors.white,
                                                checkColor: Colors.green,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isGoodChecked = value!;
                                                    updateList();
                                                  });
                                                },
                                              ),
                                              CheckboxListTile(
                                                title: const Text('Orta'),
                                                value: isAverageChecked,
                                                activeColor: Colors.white,
                                                checkColor: Colors.green,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isAverageChecked = value!;
                                                    updateList();
                                                  });
                                                },
                                              ),
                                              CheckboxListTile(
                                                title: const Text('Kötü'),
                                                value: isBadChecked,
                                                activeColor: Colors.white,
                                                checkColor: Colors.green,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isBadChecked = value!;
                                                    updateList();
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Tamam'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Expanded(
                          child: display_list.isEmpty
                              ? const Center(
                                  child: Text(
                                    'Sonuç Bulunamadı',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: display_list.length,
                                  itemBuilder: ((context, index) =>
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookDetailsPage(
                                                          book: display_list[
                                                              index]),
                                                ));
                                          },
                                          child: isGoodChecked == false
                                              ? ListTile(
                                                  contentPadding:
                                                      const EdgeInsets.all(8.0),
                                                  title: Text(
                                                    display_list[index].name,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    'uid: ${display_list[index].uid}\nİl: ${display_list[index].userLocation}\nDurumu: ${display_list[index].condition}',
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  leading: Image.network(
                                                    display_list[index].foto,
                                                    height: 500,
                                                  ),
                                                )
                                              : isGoodChecked == true &&
                                                      main_books_list[index]
                                                              .condition ==
                                                          'İyi'
                                                  ? ListTile(
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      title: Text(
                                                        display_list[index]
                                                            .name,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        'uid: ${display_list[index].uid}\nİl: ${display_list[index].userLocation}\nDurumu: ${display_list[index].condition}',
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                      leading: Image.network(
                                                        display_list[index]
                                                            .foto,
                                                        height: 500,
                                                      ),
                                                    )
                                                  : isAverageChecked == true &&
                                                          main_books_list[index]
                                                                  .condition ==
                                                              'Orta'
                                                      ? ListTile(
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          title: Text(
                                                            display_list[index]
                                                                .name,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          subtitle: Text(
                                                            'uid: ${display_list[index].uid}\nİl: ${display_list[index].userLocation}\nDurumu: ${display_list[index].condition}',
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                          leading:
                                                              Image.network(
                                                            display_list[index]
                                                                .foto,
                                                            height: 500,
                                                          ),
                                                        )
                                                      : isBadChecked == true &&
                                                              main_books_list[
                                                                          index]
                                                                      .condition ==
                                                                  'Kötü'
                                                          ? ListTile(
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              title: Text(
                                                                display_list[
                                                                        index]
                                                                    .name,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              subtitle: Text(
                                                                'uid: ${display_list[index].uid}\nİl: ${display_list[index].userLocation}\nDurumu: ${display_list[index].condition}',
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                              leading:
                                                                  Image.network(
                                                                display_list[
                                                                        index]
                                                                    .foto,
                                                                height: 500,
                                                              ),
                                                            )
                                                          : const SizedBox
                                                              .shrink())))),

                      /////////////////////

                      //////////////
                    ],
                  ),
                )

              //Haber
              : currentIndex == 3
                  ? const Haberler()

                  //Diğer sayfalar
                  : currentIndex == 2
                      ? FirstPage(books: [])
                      : currentIndex == 1
                          ? Container()
                          : ProfilePage(), //haber

      /////////////////////////////////
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            label: 'Ara',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Harita',
            icon: Icon(Icons.map),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            label: 'Yükle',
            icon: Icon(Icons.upload),
          ),
          BottomNavigationBarItem(
            label: 'Haberler',
            icon: Icon(Icons.newspaper),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            label: 'Profil',
            icon: Icon(Icons.person),
            backgroundColor: Colors.green,
          ),
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
