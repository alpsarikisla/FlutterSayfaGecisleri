import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const GirisEkrani(),
        "/ProfilSayfasi": (context) => const ProfilEkrani(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({super.key});

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController ctrlKullaniciAdi = TextEditingController();
  TextEditingController ctrlSifre = TextEditingController();
  girisYap() {
    Navigator.pushNamed(context, "/ProfilSayfasi",
        arguments: DataModel(
            kullaniciAdi: ctrlKullaniciAdi.text, sifre: ctrlSifre.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Giriş Ekranı")),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: <Widget>[
            const Image(
                image: AssetImage("lib/images/loginimage.jpg"), width: 150),
            //const Divider(),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                hintText: 'Kullanıcı Adı Yazınız',
              ),
              controller: ctrlKullaniciAdi,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                hintText: 'Şifre Yazınız',
              ),
              controller: ctrlSifre,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: girisYap,
              child: const Text("Giriş Yap"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(
                  //fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilEkrani extends StatefulWidget {
  const ProfilEkrani({super.key});

  @override
  State<ProfilEkrani> createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  cikisYap() {
    Navigator.pushNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    DataModel gelenVeri =
        ModalRoute.of(context)?.settings.arguments as DataModel;
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Sayfası")),
      body: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: cikisYap,
                child: const Text("Çıkış Yap")), //elevatedbutton
            Text(gelenVeri.kullaniciAdi),
            Text(gelenVeri.sifre),
          ],
        ),
      ),
    );
  }
}

class DataModel {
  String kullaniciAdi, sifre;
  DataModel({required this.kullaniciAdi, required this.sifre});
}
