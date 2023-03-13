

import 'package:flutter/material.dart';

//import 'package:url_launcher/url_launcher_string.dart';
import 'habericerigi.dart';
import 'haberlisteler.dart';
//habertek




class Haberler extends StatefulWidget {
  const Haberler({Key? key}) : super(key: key);

  @override
  _HaberlerState createState() => _HaberlerState();
}

//


class _HaberlerState extends State<Haberler> {
  int currentIndex = 0;
  


Future<void> _launchUrl(String url) async {
  if (false/*!await launchUrlString(url)*/) {
    throw Exception('Could not launch $url');
  }
}



      static List<Habericerigi> habericerikleri1 = [    
    Habericerigi(haberResim:const NetworkImage('https://www.akhisarhaber.net/images/haberler/2023/02/depremzede-cocuklar-icin-oyunca-ve-kitap-bagis-kampanyasi-basladi-4867.png'),
    haberBaslik: 'Depremzede Çocuklar İçin Oyuncak Ve Kitap Bağış Kampanyası Başladı',
    url: 'www.cumhuriyet.com.tr/turkiye/depremzede-cocuklar-icin-oyuncak-ve-kitap-kampanyasi-2053536'
    ),    
    
    Habericerigi(haberResim:const NetworkImage('https://www.izmirbarosu.org.tr/images/haberler/2019411155133579.jpg'),
    haberBaslik: 'Kitap Bağışı Kampanyası',
    url: 'www.izmirbarosu.org.tr/HaberDetay/1537/kitap-bagisi-kampanyasi'
    ),
    Habericerigi(haberResim:const NetworkImage('https://www.t4haber.com.tr/images/haberler/2023/02/deprem-bolgesi-icin-quotkitap-kardesligine-sen-de-katilquot-kampanyasi-baslatildi.jpg'),
    haberBaslik: 'Deprem bölgesi için "Kitap Kardeşliğine Sen de Katıl" Kampanyası başlatıldı',
    url: 'www.iha.com.tr/istanbul-haberleri/deprem-bolgesi-icin-kitap-kardesligine-sen-de-katil-kampanyasi-baslatildi-4201221/'
    )
     ];

     List<Habericerigi> haberler_list = List.from(habericerikleri1);
  
  
  @override
  Widget build(BuildContext context) {
    return     
    
      
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
              final Uri urls = Uri.parse(habericerikleri[index].url);
              _launchUrl(urls.toString());


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
                        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.7),
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
));


        
      

      

  }
}
