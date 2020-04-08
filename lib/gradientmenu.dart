import 'package:flutter/material.dart';

class GradientMenu extends StatefulWidget {
  Function handleMenu;
  GradientMenu({this.handleMenu});
  @override
  _GradientMenuState createState() => _GradientMenuState();
}

class _GradientMenuState extends State<GradientMenu> {
  final europeanCountries = [
    'Albania',
    'Andorra',
    'Armenia',
    'Austria',
    'Azerbaijan',
    // 'Belarus',
    // 'Belgium',
    // 'Bosnia and Herzegovina',
    // 'Bulgaria',
    // 'Croatia',
    // 'Cyprus',
    // 'Czech Republic',
    // 'Denmark',
    // 'Estonia',
    // 'Finland',
    // 'France',
    // 'Georgia',
    // 'Germany',
    // 'Greece',
    // 'Hungary',
    // 'Iceland',
    // 'Ireland',
    // 'Italy',
    // 'Kazakhstan',
    // 'Kosovo',
    // 'Latvia',
    // 'Liechtenstein',
    // 'Lithuania',
    // 'Luxembourg',
    // 'Macedonia',
    // 'Malta',
    // 'Moldova',
    // 'Monaco',
    // 'Montenegro',
    // 'Netherlands',
    // 'Norway',
    // 'Poland',
    // 'Portugal',
    // 'Romania',
    // 'Russia',
    // 'San Marino',
    // 'Serbia',
    // 'Slovakia',
    // 'Slovenia',
    // 'Spain',
    // 'Sweden',
    // 'Switzerland',
    // 'Turkey',
    // 'Ukraine',
    // 'United Kingdom',
    // 'Vatican City'
  ];
  Future<bool> _onBackPressed() {
    widget.handleMenu();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Material(
          color: Colors.black38,
          child: LayoutBuilder(builder: (context, constraints) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    // Colors.transparent,
                    // Colors.black87,
                    Colors.black87,
                    Colors.black87,
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Row(),
                  ),
                  Expanded(
                    flex: 4,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color.fromARGB(0, 0, 0, 0),
                            Colors.black87,
                            Colors.black87,
                            Colors.black87,
                          ],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstATop,
                      child: Container(alignment: Alignment.bottomCenter,
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        color: Color.fromARGB(0, 28, 30, 34),
                        child: ListView.builder(
                            itemCount: europeanCountries.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: ListTile(
                                  onTap: () {},
                                  title: Center(
                                    child: Text(
                                      europeanCountries[index],
                                      style: TextStyle(
                                          fontFamily: "Gotham",
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
