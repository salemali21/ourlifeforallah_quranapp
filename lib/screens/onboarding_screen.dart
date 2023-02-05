import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:ourlifeforallah/screens/main_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "القرآن الكريم",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                    ("من قرأ حرفًا من كتابِ اللهِ فله به حسنةٌ، والحسنةُ بعشرِ أمثالِها لا أقولُ (الـم) حرفٌ ولكنْ (ألفٌ) حرفٌ و(لامٌ) حرفٌ و(ميمٌ) حرفٌ")
                    ,textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
                  ),
                ],
              ),
              image: Center(child: Image.asset('lib/assets/quran.png',fit: BoxFit.fitWidth,)),
            ),
            PageViewModel(
              title: "مواقيت الصلاة",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      ("فَإِذَا قَضَيْتُمُ الصَّلَاةَ فَاذْكُرُوا اللَّهَ قِيَامًا وَقُعُودًا وَعَلَىٰ جُنُوبِكُمْ ۚ فَإِذَا اطْمَأْنَنتُمْ فَأَقِيمُوا الصَّلَاةَ ۚ إِنَّ الصَّلَاةَ كَانَتْ عَلَى الْمُؤْمِنِينَ كِتَابًا مَّوْقُوتًاٌ")
                      ,textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
                  ),
                ],
              ),
              image: Center(child: Image.asset('lib/assets/prayer.png',)),
            ),
            PageViewModel(
              title: "الزكاة",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      ("ما من رجل لا يؤدي زكاة ماله إلا مثل له يوم القيامة شجاعا أقرع يفر منه وهو يتبعه حتى يطوقه في عنقهٌ")
                      ,textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
                  ),
                ],
              ),
              image: Center(child: Image.asset('lib/assets/zakat.png',)),
            ),
          ],
          showNextButton: true,
          next: const Icon(Icons.arrow_forward),
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
          onDone: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => mainScreen()));
          },
          onSkip: () {
            // On Skip button pressed
          },
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Theme.of(context).colorScheme.secondary,
            color: Colors.green,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
