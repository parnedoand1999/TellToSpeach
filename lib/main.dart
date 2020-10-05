import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(TToS());

class TToS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Text to Speech"),
          backgroundColor: Colors.indigo,
        ),
        body: _Home(),
      ),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  __HomeState createState() => __HomeState();
}

class __HomeState extends State<_Home> {
  FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    TextEditingController textEditingController2 = TextEditingController();
    _speak(String text) async {
      print(await flutterTts.getLanguages);
      await flutterTts.setLanguage("es");
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }

    _speaker(String text2) async {
      print(await flutterTts.getLanguages);
      await flutterTts.setLanguage("es");
      await flutterTts.setPitch(1);
      await flutterTts.speak(text2);
    }

    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Introduce algo para hablarlo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.green))),
                controller: textEditingController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Introduce segunda palabra",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2, color: Colors.green))),
                controller: textEditingController2,
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(width: 2, color: Colors.green)),
              child: Text(
                "Presiona este boton , dira lo que introduzcas en el cuadro de texto",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () => _speak(textEditingController.text),
              color: Colors.blue,
              padding: EdgeInsets.all(20),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(width: 2, color: Colors.green)),
              child: Text(
                "Dira lo que introduzcas en el segundo cuadro",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: () => _speaker(textEditingController2.text),
              color: Colors.red,
              padding: EdgeInsets.all(20),
            ),
          ],
        ));
  }
}
