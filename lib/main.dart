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
  girisYap() {
    Navigator.pushNamed(context, "/ProfilSayfasi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Giriş Ekranı")),
      body: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(onPressed: girisYap, child: const Text("Giriş Yap")),
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
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Sayfası")),
      body: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(onPressed: cikisYap, child: const Text("Çıkış Yap")),
          ],
        ),
      ),
    );
  }
}
