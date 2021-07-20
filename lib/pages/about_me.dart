import 'package:flutter/material.dart';
import 'package:tweetshort/widgets/button.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hi i am oye johnson, i am currently developing tweetshort.",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Send me an email with bug or improvement, or you can say hi.",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            TWEETSHORTButton(
              child: Text(
                "Say hi",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.black,
              onPressed: () {},
            ),
            SizedBox(
              height: 5,
            ),
            TWEETSHORTButton(
              child: Text("Buy me coffee"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
