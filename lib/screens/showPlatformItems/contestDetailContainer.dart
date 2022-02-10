import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class ContestDetailContainer extends StatelessWidget {
  final String number;
  final String? duration;
  final String? title;
  final bool isDone;
  //final String imgUrl;
  const ContestDetailContainer({
    Key? key,
    required this.number,
    //  required this.imgUrl,
    this.duration,
    this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                number,
                style: kHeadingextStyle.copyWith(
                  color: kTextColor.withOpacity(.15),
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .030,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .7,
                // color: Colors.red,
                child: RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "ends $duration\n",
                        style: TextStyle(
                          color: kTextColor.withOpacity(.5),
                          fontSize: 17.5,
                        ),
                      ),
                      TextSpan(
                        text: title,
                        style: kSubtitleTextSyle.copyWith(
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Container(
          //   // color: Colors.blueAccent,
          //   //margin: EdgeInsets.only(left: 2),
          //   height: 40,
          //   width: 40,
          //   child: SvgPicture.asset(imgUrl),
          // )
        ],
      ),
    );
  }
}
