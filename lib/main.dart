import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Olahraga {
  String _judul;
  String _image;
  String _desc;

  Olahraga(this._judul, this._image, this._desc);

  String get desc => _desc;

  set desc(String value) {
    _desc = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get judul => _judul;

  set judul(String value) {
    _judul = value;
  }


}

class MyApp extends StatelessWidget {

  List<Olahraga> olahraga = new List();
  
  MyApp() {
    olahraga.add(new Olahraga("Sepak Takraw", "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Incheon_AsianGames_Sepaktakraw_09_%2815291705581%29.jpg/640px-Incheon_AsianGames_Sepaktakraw_09_%2815291705581%29.jpg", "Untuk permainan olahraga ini yaitu dimainkan dengan cara menyepak bola dengan metode yang digunakan yaitu seperti permainan bola voli."));
    olahraga.add(new Olahraga("Pencak Silat", "https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Pencak_Silat_Betawi_2.jpg/450px-Pencak_Silat_Betawi_2.jpg", "Pada abad ke-7 Masehi olahraga ini muncul di Indonesia. Maka dari itulah pendekar-pendekar dikenal jago untuk bela diri yaitu seperti pendekar-pendekar yang berasal dari kerajaan Majapahit dan Sriwijaya."));
    olahraga.add(new Olahraga("Egrang", "https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Egrang.jpg/578px-Egrang.jpg", "Olahraga egrang ini merupakan olahraga yang dalam permainannya menggunakan tongkat. Atau dapat dijelaskan bahwa olahraga egrang ini merupakan olahraga tradisional yang cara permainannya menggunakan tongkat agar seseorang itu bisa berdiri di atas ketinggian tertentu dari atas tanah."));

    olahraga.add(new Olahraga("Tarik Tambang", "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Tarik_Tambang_Indonesia.jpg/640px-Tarik_Tambang_Indonesia.jpg", "Jenis olahraga yang stu ini yaitu olahraga tarik tambang. Di mana olahraga ini sampai saat ini juga masih di mainkan pada saat-saat ada perlombaan 17 Agustus atau hari kelahiran Indonesia. Olahraga ini yaitu olahraga yang menggunakan tali yang panjang dan juga kuat."));
    olahraga.add(new Olahraga("Balap Karung", "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Independence_day_on_Jalan_Jaksa_balap_karung.jpg/640px-Independence_day_on_Jalan_Jaksa_balap_karung.jpg", "Olahraga ini cara melakukannya yaitu seseorang masuk ke dalam karung tersebut dan berlari secara melompat-lompat dengan balapan sesama tim lawan untuk tujuan sampai menuju ke finish."));
    olahraga.add(new Olahraga("Karapan Sapi", "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Karapan_Sapi_brujul_Probolinggo.jpg/640px-Karapan_Sapi_brujul_Probolinggo.jpg", "Karapan sapi? pasti anda baru kenal kan? iya benar, karapan sapi ini merupakan olahraga tradisional yang berasal dari Madura. Apa sih karapan sapi itu? karapan sapi yaitu lomba atau olahraga jenis tradisional yang medianya jelas-jelas menggunakan sapi."));

    olahraga.add(new Olahraga("Lompat Batu", "https://upload.wikimedia.org/wikipedia/commons/0/05/Lompat_Batu_Nias.jpg", "Lompat batu merupakan olahraga tradisional yang berasal dari Pulau Nias. Pada masa dahulu lompat batu ini digunakan oleh masyarakat Nias itu pada waktu perang-perang. Atau dapat dikatakn sebagai persiapan sebelum perang dimulai."));
    olahraga.add(new Olahraga("Pathol", "https://cdn-u1-gnfi.imgix.net/post/large-bg-d090628991d2c7a307081181121e6c42.jpg?w=715&max-h=550&fit=crop&crop=face", "Olahraga ini dulunya itu merupakan acara-acara sayembara untuk mencari kesatria terbaik yang bisa menjaga pelabuhan Tuban yang pada saat itu ramai oleh perompak dan penyamun."));
    olahraga.add(new Olahraga("Pacu Jalur", "https://pesona.travel/media/asal-usul-pacu-jalur-kuantan-singingi_124614.jpg", "Olahraga tradisional ini dilakukan di kampung-kampung sepanjang Sungai Kuantan, olahraga ini masuk ke dalam event tahunan nasional yaitu setiap tanggal 23-26 Agustus."));

    olahraga.add(new Olahraga("Bakiak atau Terompah", "https://godongijo.com/wp-content/uploads/2018/11/bakiak-300x199.png", "Karena dalam olahraga ini memang harus bisa menyeimbangkan dan bekerja sama dengan baik, olaharaga ini menggunakan lata seperti sandal atau alas kaki yang panjang yang terbuat dari kayu yang pengikatnya menggunakan karet."));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Container(
        child: HomePage(olahraga, context)
      )
      );
  }

}

class HomePage extends StatelessWidget {
  List<Olahraga> olahraga = new List();
  List<Widget> imgs        = new List();
  
  HomePage(List<Olahraga> list, BuildContext context){
    this.olahraga = list;
  }

  void populate(BuildContext context) {
    for(Olahraga item in olahraga) {
      imgs.add(new Material( // needed
        color: Colors.blue,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext ctx) {
                  return DetailPage(item._judul, item._image, item._desc);
                }
            ));
          }, // needed
          child: Image.network(item._image, fit: BoxFit.cover,),
        ),
      ));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    populate(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Olahraga Asli Indonesia"),
      ),
      body: SafeArea(
        child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100
            ),
            physics: ScrollPhysics(),
            children: imgs
        )
      )
    );
  }
  /*
  GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100
        ),
        children: imgs
      )
   */
  
}

class DetailPage extends StatelessWidget {
  String title, image, desc;

  DetailPage(this.title, this.image, this.desc);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
        ),
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(image, height: 200, fit: BoxFit.cover,),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(title,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28.0)),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(desc),
              )
            ],
          )
        ),
      )
    );
  }

  /*
  Column(
        children: <Widget>[
          Image.network(image, height: 300, fit: BoxFit.cover,),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text(title,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28.0)),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Text(desc),
            )
          )
        ],
      ),
   */
}