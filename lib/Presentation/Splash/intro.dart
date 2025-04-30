import 'package:flutter/material.dart';
import 'package:wellnest_doctor/Presentation/Auth/signin.dart';
import 'package:wellnest_doctor/Presentation/constants/constants.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: maincolor,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          kheight10,
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: size * 0.04, right: size * 0.04, top: size * 0.14),
                height: size * 0.90,
                width: double.infinity,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                    image: DecorationImage(
                        image: AssetImage('assets/imgs/intro.png'),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                top: size * 0.01,
                right: size * 0.06,
                child: Text('',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: size * 0.09,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              )
            ],
          ),
          Column(
            children: [
              Text('Welcome to the\n Doctor app! 👋',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: size * 0.09,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              kheight20,
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
            },
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(Colors.white),
              minimumSize:
                  WidgetStateProperty.all(Size(size * 0.8, size * 0.15)),
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                  color: maincolor, fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          kheight5,
        ],
      ),
    );
  }
}
