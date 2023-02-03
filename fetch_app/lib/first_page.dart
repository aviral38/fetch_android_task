import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
class firstPage extends StatefulWidget {
  const firstPage({Key? key}) : super(key: key);

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xff4568dc),
                Color(0xffb06ab3)
              ],
            )),
        child: Column(
          children: [
            SizedBox(height: 100,),
          SizedBox(
            height: 100,
          width: 250.0,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
                isRepeatingAnimation:true,
              animatedTexts: [
                FadeAnimatedText('Hi!'),
                FadeAnimatedText('This is Fetch Internship!!'),
                FadeAnimatedText('Take Home Assignment!!!'),
              ],
            ),
          ),
        ),
          SizedBox(height: height/30,),
          SizedBox(
            height: 100,
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Agne',
              ),

              child: AnimatedTextKit(
                  isRepeatingAnimation:true,
                animatedTexts: [
                  TypewriterAnimatedText('Press the button below to continue',textStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),speed: Duration(milliseconds: 200)),

                ],
              ),
            ),
          ),
            SizedBox(height: height/30,),
            Center(
              child: Container(
                width: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(500))
                ),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/main');
                  },child: Center(
                    child: Row(
                    children: [
                      Text('Fetch Data',style: TextStyle(color: Color(0xfffba919)),),
                      SizedBox(width: 25,),
                      Image.asset('images/fetch_logo.png',height: 50,width: 50,)
                    ],
                ),
                  ),
                color: Color(0xff300c38),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
