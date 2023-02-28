import 'package:flutter/material.dart';
import 'kitap_detaylari.dart';
import 'kitap.dart';

/*
class BookModel{
  String? book_title;
  String? sahip;
  double? mesafe;
  String? il;
  String? bagis_turu;
  String? kitap_durumu;
  String? foto;
  
  BookModel(this.sahip,
  this.book_title,
  this.mesafe,
  this.il,
  this.bagis_turu,
  this.kitap_durumu,
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



  //
  static List<BookModel> main_books_list = [
    BookModel('Liana','Küçük Yaprağın Öyküsü', 0.3 , 'İstanbul', 'Bağış', 'İyi','https://cdn.pixabay.com/photo/2023/01/31/05/59/zebra-7757193_960_720.jpg'),
    BookModel('Başar','Küçük Prens', 0.7, 'İstanbul', 'Değiş-Tokuş', 'İyi','https://upload.wikimedia.org/wikipedia/tr/thumb/f/f5/Kucukprens.jpg/1200px-Kucukprens.jpg'),
    BookModel('Alen','Tutunamayanlar', 0.9, 'İstanbul', 'Ödünç verme', 'Orta','https://upload.wikimedia.org/wikipedia/commons/2/28/Oguzataybust.png'),
    BookModel('Aksel','Kürk Mantolu Madonna', 1.1, 'İstanbul', 'Bağış', 'Kötü','https://upload.wikimedia.org/wikipedia/commons/1/14/K%C3%BCrk_Mantolu_Madonna_Kapak.png'),
    BookModel('Aksel','The Return of Sherlock Holmes', 1.3, 'İstanbul', 'Değiş-Tokuş', 'Orta','https://upload.wikimedia.org/wikipedia/commons/5/55/The_Return_of_Sherlock_Holmes_cover_1905.jpg')
  ];


  List<BookModel> display_list = List.from(main_books_list);
 /////


  void updateList(String value){
    setState(() {
      display_list = main_books_list.where((element) => element.book_title!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('BookDonate',style: TextStyle(
         fontWeight: FontWeight.bold,
         
          color: Colors.black),)
        ),
        leading: Icon(Icons.book, color: Colors.black,),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.black), 
            onPressed: () { 
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('BookDonate'),
                    content: Text('İşte biz bu yüzden varız.'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
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
      currentIndex ==0?
      Padding(padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start ,
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [ 
           
          Text(
          'Kitap Ara', 
          
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22.0),
            ),
            
            SizedBox(
              height: 20.0,
              
            ),
            TextField(
              onChanged: (value) => updateList(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                  ),
                  hintText: 'Cesur Yeni Dünya',
                   
                  prefixIcon: Icon(Icons.search),prefixIconColor: Colors.black,
                  suffixIcon:
         
         
          IconButton(
            icon: Icon(Icons.filter_alt_outlined, color: Colors.black), 
            onPressed: () { 




              showDialog(
  context: context,
  builder: (BuildContext context) {


    return AlertDialog(
      title: Text('Filtrele'),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CheckboxListTile(
                title: Text('İyi'),
                value: isGoodChecked,
                onChanged: (newValue) {
                  setState(() {
                    isGoodChecked = newValue!;
                   
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Orta'),
                value: isAverageChecked,
                onChanged: (newValue) {
                  setState(() {
                    isAverageChecked = newValue!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Kötü'),
                value: isBadChecked,
                onChanged: (newValue) {
                  setState(() {
                    isBadChecked = newValue!;
                  });
                },
              ),
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            // AlertDialog'da tamam butonuna basıldığında yapılacak işlemler buraya yazılabilir.
            Navigator.of(context).pop();
          },
          child: Text('Tamam'),
        ),
      ],
    );
  },
);










            },
          ),
        

                  ),
              ),
              SizedBox(height: 20),
              
              Expanded(
                child: display_list.length == 0
                 ? Center(child: Text('Sonuç Bulunamadı', style: TextStyle(color: Colors.black,fontSize: 25, fontWeight: FontWeight.bold),),):
                
                ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder: ( (context, index) => GestureDetector(
                    onTap: () {
                      
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>BookDetailsPage(book: display_list[index]),));
                    },
                    child:
                    
                    
                    
                    
                    isGoodChecked == false ? 
                    
                    ListTile(
                      contentPadding: EdgeInsets.all(8.0),  
                      title: Text(
                        display_list[index].book_title!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    subtitle: Text(
                      'Sahip: ${display_list[index].sahip!}\nUzaklık: ${display_list[index].mesafe!}\nİl: ${display_list[index].il!}\nTür: ${display_list[index].bagis_turu!}\nDurumu: ${display_list[index].kitap_durumu!}'               
                  
                  , style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),),
                    leading: Image.network(display_list[index].foto!,
                                          
                    height: 500,),
                    ):
                    
                    
                    isGoodChecked == true && main_books_list[index].kitap_durumu == 'İyi' ?
                     ListTile(
                      contentPadding: EdgeInsets.all(8.0),  
                      title: Text(
                        display_list[index].book_title!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    subtitle: Text(
                      'Sahip: ${display_list[index].sahip!}\nUzaklık: ${display_list[index].mesafe!}\nİl: ${display_list[index].il!}\nTür: ${display_list[index].bagis_turu!}\nDurumu: ${display_list[index].kitap_durumu!}'               
                  
                  , style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),),
                    leading: Image.network(display_list[index].foto!,
                                          
                    height: 500,),
                    )
                    
                    :isAverageChecked == true && main_books_list[index].kitap_durumu == 'Orta' ?
                      ListTile(
                      contentPadding: EdgeInsets.all(8.0),  
                      title: Text(
                        display_list[index].book_title!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    subtitle: Text(
                      'Sahip: ${display_list[index].sahip!}\nUzaklık: ${display_list[index].mesafe!}\nİl: ${display_list[index].il!}\nTür: ${display_list[index].bagis_turu!}\nDurumu: ${display_list[index].kitap_durumu!}'               
                  
                  , style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),),
                    leading: Image.network(display_list[index].foto!,
                                          
                    height: 500,),
                    )
                   
                    :isBadChecked == true && main_books_list[index].kitap_durumu == 'Kötü' ?
                      ListTile(
                      contentPadding: EdgeInsets.all(8.0),  
                      title: Text(
                        display_list[index].book_title!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    subtitle: Text(
                      'Sahip: ${display_list[index].sahip!}\nUzaklık: ${display_list[index].mesafe!}\nİl: ${display_list[index].il!}\nTür: ${display_list[index].bagis_turu!}\nDurumu: ${display_list[index].kitap_durumu!}'               
                  
                  , style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),),
                    leading: Image.network(display_list[index].foto!,
                                          
                    height: 500,),
                    )
                   
                    :SizedBox.shrink()



                  )
                  )
                  )
              
              ),
              
              /////////////////////
              
              


              
             
              //////////////

      
      
          ],
      ),
      
      
      
      )
           
      //Haber
      :currentIndex==3?
       Text("Haber")
       
       
       
       //Diğer sayfalar
       :Text('Diğer sayfalar'),//haber
      
      
     
      
      
      
      
      /////////////////////////////////
     bottomNavigationBar: BottomNavigationBar(
        items: [
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




