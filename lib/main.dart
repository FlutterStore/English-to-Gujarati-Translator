import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final translator = GoogleTranslator();

  TextEditingController eng = TextEditingController();
  TextEditingController gu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Translator',style: TextStyle(fontSize: 15),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                          controller: eng,
                          textCapitalization: TextCapitalization.sentences,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.black,
                          decoration:  InputDecoration(
                            hintText: 'અંગ્રેજી લખો',
                            focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              
                              borderSide: BorderSide(width: 1,color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(width: 1,color: Colors.green),
                            ),
                          ),
                        ),
                    ),
                  ),
                  const SizedBox(height:10),
                  Container(
                        width: 175,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.green
                        ),
                        child: OutlinedButton(
                          onPressed: (){
                          translator.translate(eng.text, from: 'en', to: 'gu').then((s) {
                            setState(() {
                              gu.text = s.toString();
                            });
                          });
                        },
                        style: ButtonStyle(
                          maximumSize: MaterialStateProperty.all(const Size(200, 45)),
                        ), 
                        child: Text("ગુજરાતી કરો",style: TextStyle(color: Colors.white,fontSize: 13)),
                        )
                      ),
                      const SizedBox(height:10),
                      Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: TextField(
                          controller: gu,
                          textCapitalization: TextCapitalization.sentences,
                          textAlign: TextAlign.center,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            hintText: 'ગુજરાતી મેળવો',
                            focusedBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              
                              borderSide: BorderSide(width: 1,color: Colors.green),
                            ),
                            border : OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              
                              borderSide: BorderSide(width: 1,color: Colors.green),
                            ),
                          ),
                        ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
