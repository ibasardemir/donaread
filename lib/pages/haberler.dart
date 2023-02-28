

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';
import 'habericerigi.dart';
import 'package:haberler/haberlisteler.dart';
//habertek




class FirstPageTo extends StatefulWidget {
  const FirstPageTo({Key? key}) : super(key: key);

  @override
  _FirstPageToState createState() => _FirstPageToState();
}

//


class _FirstPageToState extends State<FirstPageTo> {
  int currentIndex = 0;
  


Future<void> _launchUrl(String url) async {
  if (!await launchUrlString(url)) {
    throw Exception('Could not launch $url');
  }
}



      static List<Habericerigi> habericerikleri1 = [    
    Habericerigi(NetworkImage('https://www.akhisarhaber.net/images/haberler/2023/02/depremzede-cocuklar-icin-oyunca-ve-kitap-bagis-kampanyasi-basladi-4867.png'),
    'Depremzede Çocuklar İçin Oyuncak Ve Kitap Bağış Kampanyası Başladı',
    'www.cumhuriyet.com.tr/turkiye/depremzede-cocuklar-icin-oyuncak-ve-kitap-kampanyasi-2053536'
    ),    
    
    Habericerigi(NetworkImage('https://www.izmirbarosu.org.tr/images/haberler/2019411155133579.jpg'),
    'Kitap Bağışı Kampanyası',
    'www.izmirbarosu.org.tr/HaberDetay/1537/kitap-bagisi-kampanyasi'
    ),
    Habericerigi(NetworkImage('https://www.t4haber.com.tr/images/haberler/2023/02/deprem-bolgesi-icin-quotkitap-kardesligine-sen-de-katilquot-kampanyasi-baslatildi.jpg'),
    'Deprem bölgesi için "Kitap Kardeşliğine Sen de Katıl" Kampanyası başlatıldı',
    'www.iha.com.tr/istanbul-haberleri/deprem-bolgesi-icin-kitap-kardesligine-sen-de-katil-kampanyasi-baslatildi-4201221/'
    )
     ];

     List<Habericerigi> haberler_list = List.from(habericerikleri1);
  
  
  @override
  Widget build(BuildContext context) {
    return     
    Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Haberler')),
        backgroundColor: Colors.green,
      ),
      body: currentIndex==3 
      ? 
      
      SingleChildScrollView(
        
        child: Column(
  children: [
    ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: habericerikleri.length,//1
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 30),
          ),
          child: InkWell(
            
            onTap: () {
              final Uri _url = Uri.parse(habericerikleri[index].url);
              _launchUrl(_url.toString());


//Link() denenebilir
//Search gibi listeleme oluşturup denenebilir
//güncel kaynaklar olmasına dikkat et
             /*
               Navigator.push(
context,
MaterialPageRoute(builder: (context) => HaberTek(haber: haberler_list[index],)),
); 
*/
            },
            child: Stack(
              children: [
                Center(
                  child: Image(
                    image: habericerikleri[index].haberResim,
                    height: 165,
                    width: 450,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      
                      child: Container(
                        
                        width: 300,
                        color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        child: Text(
                          habericerikleri[index].haberBaslik,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.green[300],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  ],
),


        
      )      
      : SizedBox(),

      
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
