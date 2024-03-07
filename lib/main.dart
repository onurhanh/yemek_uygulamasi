import 'package:flutter/material.dart';
import 'package:yemek_uygulamasi/DetaySayfa.dart';

import 'Yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Yemekler>> yemekleriGetir() async {
    var yemekListesi = <Yemekler>[];

    var y1 = Yemekler(1, "Köfte", "köfteporsiyon.jpg", 80.99);
    var y2 = Yemekler(2, "Ayran", "ayran.jpg", 25.0);
    var y3 = Yemekler(3, "Fanta", "fanta.jpg", 30.0);
    var y4 = Yemekler(4, "Makarna", "makarna.jpeg", 65.99);
    var y5 = Yemekler(5, "Kadayıf", "kadayıf.jpg", 55.99);
    var y6 = Yemekler(6, "Baklava", "baklava.jpeg", 55.99);
    var y7 = Yemekler(7, "Cola", "cola.jpg", 30.0);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);
    yemekListesi.add(y7);

    return yemekListesi;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Yemekler"),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var yemekListesi = snapshot.data;

            return ListView.builder(
              itemCount: yemekListesi!.length,
              itemBuilder: (context,indeks){
                var yemek = yemekListesi[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(yemek: yemek,)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(width: 150,height: 150,child: Image.asset("resimler/${yemek.yemek_resim_adi}")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(yemek.yemek_adi,style: TextStyle(fontSize: 20),),
                            SizedBox(height: 50,),
                            Text("${yemek.yemek_fiyat} \u{20BA}",style: TextStyle(fontSize: 18,color: Colors.blue),),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                );

              },
            );

          }else{
            return Center();
          }
        },
      ),

    );
  }
}
