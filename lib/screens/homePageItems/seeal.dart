import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      // color: Colors.green,
                      height: 30,
                      width: 30,
                      child: SvgPicture.asset(
                        "assets/icons/arrow-left.svg",
                      )),
                ),
                SvgPicture.asset(
                  "assets/icons/more-vertical.svg",
                  height: 30,
                  width: 30,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            // Expanded(child: GridView.builder(itemBuilder: itemBuilder))
          ],
        ),
      ),
    );
  }
}
