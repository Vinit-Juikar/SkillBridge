import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';


class LoginOrRegister extends StatelessWidget {
  const LoginOrRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 43, 145, 228),
              Color.fromARGB(255, 37, 93, 139),
              Color.fromARGB(255, 43, 145, 228),
            ],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Material(
              elevation: 10,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.elliptical(200, 200),
                  bottomRight: Radius.elliptical(200, 200)),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(200, 200),
                      bottomRight: Radius.elliptical(200, 200)),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.width / 1.2,
                child: const Center(
                  // child: Lottie.asset(
                  //   'Animations/footChange.json',
                  //   width: MediaQuery.of(context).size.width / 1.2,
                  //   repeat: true,
                  // ),
                ),
              ),
            ),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: AnimatedTextKit(
                pause: const Duration(seconds: 3),
                repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText(
                    'SkillBridge',
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
              child: Text('Unearth the ultimate almanac of \n     Kingdom Animalia with us.',style: TextStyle(fontSize: 15,color: Colors.white,),),
            ),
            // Container(
            //   child: GestureDetector(
            //     onTap: (){
            //       Navigator.pushNamedAndRemoveUntil(
            //                 context, 'phone', (route) => false);
            //     },
            //     child: Material(
            //       elevation: 8,
            //       borderRadius: BorderRadius.circular(22),
            //       child: Container(
            //         alignment: Alignment.center,
            //         width: 200,
            //         height: 50,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(22),
            //           color: Colors.white,
            //         ),
            //         child: const Text(
            //           'Provider',
            //           style: TextStyle(
            //               fontSize: 24, color: Color.fromARGB(255, 25, 85, 134)),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 35,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(
                            context, 'phone', (route) => false);
              },
              child: Container(
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white,
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                          fontSize: 24, color: Color.fromARGB(255, 25, 85, 134)),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 50,
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text('Copyright©| SkillBridge',style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
