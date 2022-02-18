import 'package:contestalert/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30, 15, 30, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.black,
                        iconSize: 25,
                      ),
                      Text(
                        'About Me',
                        textAlign: TextAlign.center,
                        style: kTitleTextStyle.copyWith(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.settings_outlined,
                        color: Colors.transparent,
                        size: 24,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Lottie.network(
                    'https://assets8.lottiefiles.com/packages/lf20_7coErG.json',
                    width: 200,
                    height: 200,
                    fit: BoxFit.fitWidth,
                    animate: true,
                  ),
                  SizedBox(
                    width: 100,
                    height: 20,
                  ),
                  Text(
                    'Hi, I\'m Tanay Gupta',
                    style: kTitleTextStyle.copyWith(fontSize: 25),
                  ),
                  Text(
                    'Android Developer | Tech enthusiast',
                    style: kSubheadingextStyle.copyWith(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                  ),
                  Text(
                    'Let\'s be internet BFFs',
                    style: kSubtitleTextSyle.copyWith(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 45, right: 45, top: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.black,
                            size: 30,
                          ),
                          onTap: () {
                            launch("https://www.instagram.com/tanaywhocodes/");
                          },
                        ),
                        InkWell(
                          child: FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.black,
                            size: 30,
                          ),
                          onTap: () {
                            launch("https://www.linkedin.com/in/tanay--gupta/");
                          },
                        ),
                        InkWell(
                          child: FaIcon(
                            FontAwesomeIcons.github,
                            color: Colors.black,
                            size: 30,
                          ),
                          onTap: () {
                            launch("https://github.com/Tanay-Gupta");
                          },
                        ),
                        // InkWell(
                        //   child: Icon(
                        //     Icons.email_outlined,
                        //     color: Colors.black,
                        //     size: 30,
                        //   ),
                        //   onTap: () {
                        //     launch("https://www.linkedin.com/in/tanay--gupta/");
                        //   },
                        // ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Designed With ❤️ in India",
                    style: kSubtitleTextSyle.copyWith(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
