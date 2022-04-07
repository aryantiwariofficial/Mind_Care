import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mindcare/splash.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),

  ));
}

String url = 'https://counselingchennai.com/?msclkid=5ea6717dac5b11ec860bcc26291afaec';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
int indek = 19;
List heks =['#FF0000', '#FF2727', '#FF3838', '#FF5050', '#FF5454', '#FF7070', '#FF7E7E', '#FF8989', '#FF9595', '#FFA0A0', '#FFACAC', '#FFB4B4', '#FFB6B6', '#FFC4C4', '#FFCFCF', '#FFD7D7', '#FFE9E9', '#FFEFEF', '#FFF9F9',"#FFFFFF","#EFF7FF","#E2F0FF","#D1E7FF","#C8E2FF","#BBDBFF","#A0CDFF","#94C6FF","#84BEFF","#72B4FF","#61ABFF","#4FA2FF","#469DFF","#3F99FF","#3F99FF","#288DFF","#1F88FF","#1885FF","#1282FF","#0078FF"];
class _HomePageState extends State<HomePage> {
  GetPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? index = prefs.getInt("indek");
    return index;
  }
  SetPrefs() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("indek", indek);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkforval();
  }
  checkforval() async{
    int index = await GetPrefs() ?? 19;
    setState(() {
      indek = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      //appBar:AppBar(
      //  backgroundColor: Colors.pink[50],
      //  title: Image.asset('assets/logo.png',height: 250,),
      //  toolbarHeight: 130,
      //  centerTitle: true,
      //),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //SizedBox(height: 60,),
            Container(
              height: 270,
              child: Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
            Center(
              child: Container(
                width: 270,
                height: 70,
                child: NeumorphicButton(
                  onPressed: (){
                    setState(() {
                      if(indek < 38){
                        indek = indek + 1;
                        SetPrefs();
                      }
                      if(indek > 25) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.NO_HEADER,
                          animType: AnimType.TOPSLIDE,
                          title: 'Congratulations!',
                          desc: 'You\'re doing very good!',
                          showCloseIcon: false,
                          dismissOnBackKeyPress: true,
                          dismissOnTouchOutside: true,
                        )..show();
                      }
                    });

                  },
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    depth: 10,
                    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(18)),
                    color: Colors.grey[300],
                    lightSource: LightSource.topLeft,
                  ),

                  child: Center(
                    child: Text(
                      'Happy :)',
                      style:TextStyle(
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),



                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 80,),
            Container(
              width: 270,
              height: 70,
              child: NeumorphicButton(
                onPressed: (){
                  setState(() {
                    if(indek > 0) {
                      indek = indek - 1;
                      SetPrefs();
                    }
                    if(indek < 10) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.NO_HEADER,
                        animType: AnimType.TOPSLIDE,
                        title: 'Get help!',
                        desc: 'Consult your therapist.',
                        showCloseIcon: false,
                        dismissOnBackKeyPress: true,
                        btnOkText: 'See the therapists near you.',
                        btnOkOnPress: () {
                         Navigator.push(context,MaterialPageRoute(builder: (context) =>const SafeArea(
                           child: Scaffold(
                             body: WebView(
                                initialUrl: 'https://counselingchennai.com/',
                               javascriptMode: JavascriptMode.unrestricted,
                             ),
                           ),
                         )));
                        },
                        dismissOnTouchOutside: true,
                      ).show();
                    }
                  });

                },
                style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  depth: 10,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(18)),
                  color: Colors.grey[300],
                  lightSource: LightSource.topLeft,
                ),

                child: Center(
                  child: Text(
                    'Sad :(',
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )
                    ),


                  ),
                ),
              ),
            ),
            SizedBox(height: 75,),
            Container(
              width: 300,
              height: 40,
              decoration: BoxDecoration(
                color: HexColor(heks[indek]),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: HexColor(heks[indek]),
                    blurRadius: 2,
                    spreadRadius: 2,
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
