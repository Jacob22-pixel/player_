import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: NazwaKlasyStateful("Player"),
    ),
  );

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class NazwaKlasyStateful extends StatefulWidget {
  final String title;

  NazwaKlasyStateful(this.title);

  @override
  _NazwaKlasyStatefulState createState() => _NazwaKlasyStatefulState();
}

class _NazwaKlasyStatefulState extends State<NazwaKlasyStateful> {
  int number = 1;
  int number2 = 1;
  int number3 = 1;
  String photo =
      "https://cdn.ussoccer.com/-/media/project/ussf/players/mnt/jozy-altidore/altidore2-sitecoredata.ashx?h=580&la=en-US&w=580&rev=4c1254db1fb149bc930bbbbef0911ee8&hash=5F72F12CBA67B397F421ACC716B5B722";
  var primary = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: TextButton(
          child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      child: CircleAvatar(
                          radius: 60, backgroundImage: NetworkImage(photo)),
                      onPressed: () {
                        setState(() {
                          if (number2 == 0) {
                            photo =
                            "https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/5/55/G2_Jankos_2021_Split_1.png/revision/latest?cb=20210121120207";
                            number2++;
                          } else {
                            photo =
                            "https://static-cdn.jtvnw.net/jtv_user_pictures/d6bd2665e718bcb3-profile_image-70x70.png";
                            number2 = 0;
                          }
                        });
                      }),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Marcin 'Jankos' Jankowski",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Text(
                      "Jankos” (ur. 23 lipca 1995) – polski zawodowy gracz e-sportowy w grze League of Legends. Były reprezentant takich zespołów jak H2k Gaming czy Team ROCCAT. Od 2018 roku zawodnik reprezentuje barwy G2 Esports.",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Moja ocena:",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            child: StarsRow(number),
                            onPressed: () {
                              setState(() {
                                if (number == 3) {
                                  number = 0;
                                }
                                number++;
                              });
                              ;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  white_box(
                      Icons.child_care, "06.11.1989", Icons.bolt, "08-09-2019"),
                  white_box(Icons.star_border_rounded, "G2 Esports", Icons.star,
                      "H2K"),
                  white_box(
                      Icons.arrow_upward, "1,82 m", Icons.line_weight, "80 kg"),
                ],
              )),
          onPressed: () {
            setState(() {
              if (number3 == 0) {
                primary = Colors.orange;
                number3++;
              } else {
                primary = Colors.green;
                number3 = 0;
              }
            });
          }),
    );
  }
}

class StarsRow extends StatefulWidget {
  final int rating;

  const StarsRow(
      this.rating, {
        Key key,
      }) : super(key: key);

  @override
  _StarsRowState createState() => _StarsRowState();
}

class _StarsRowState extends State<StarsRow> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> stars = [];
    for (int i = 0; i < 3; i++) {
      if (i < widget.rating) {
        stars.add(Icon(
          Icons.star,
          color: Colors.black,
        ));
      } else {
        stars.add(Icon(
          Icons.star_border,
          color: Colors.black,
        ));
      }
    }
    return Row(children: stars);
  }
}

class white_box extends StatefulWidget {
  final IconData icon;
  final String text;
  final IconData icon2;
  final String text2;

  const white_box(
      this.icon,
      this.text,
      this.icon2,
      this.text2, {
        Key key,
      }) : super(key: key);
  @override
  _white_boxState createState() => _white_boxState(
    this.icon,
    this.text,
  );
}

class _white_boxState extends State<white_box> {
  var curenticon;
  var curenttext;
  var number1 = 1;

  _white_boxState(this.curenticon, this.curenttext);
  @override
  Widget build(BuildContext context) {
    final List<Widget> box = [];
    return TextButton(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(
              curenticon,
              color: Colors.black,
            ),
            Expanded(
              child: Text(
                (curenttext),
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        setState(() {
          if (number1 == 0) {
            curenticon = widget.icon;
            curenttext = widget.text;
            number1++;
          } else {
            curenticon = widget.icon2;
            curenttext = widget.text2;
            number1 = 0;
          }
        }
        );
      },
    );
  }
}