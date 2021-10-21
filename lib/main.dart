import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PasswordManager(),
  ));
}

const Map<int, String> logoNames = {
  0: "github",
  3: "facebook",
  1: "microsoft",
  2: "gmail",
};

class PasswordManager extends StatefulWidget {
  const PasswordManager({Key? key}) : super(key: key);

  @override
  _PasswordManagerState createState() => _PasswordManagerState();
}

class _PasswordManagerState extends State<PasswordManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.teal,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Material(
                    color: Colors.teal.shade100,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      splashColor: Colors.teal.shade200,
                      splashFactory: InkRipple.splashFactory,
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        print("${logoNames[i]}");
                      },
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              fit: BoxFit.contain,
                              height: 60,
                              width: 160,
                              image: AssetImage(
                                'assets/images/${logoNames[i]}.png',
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Manage ${logoNames[i]} password(s)",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
