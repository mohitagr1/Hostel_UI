import 'package:flutter/material.dart';
import 'package:hoste_ui/models/Profile.dart';
import 'package:hoste_ui/models/index.dart';
import 'package:hoste_ui/models/themecolors.dart';
import 'package:hoste_ui/services/http_service.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final HttpService httpService = HttpService();
  Future<Hosteler> hosteler;
  double _radius = 60;

  double _headerRatio = 0.20;

  double _height;

  Profile _profile = myprofile;

  @override
  void initState() {
    super.initState();
    hosteler = httpService.getHosteler();
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors colors = Provider.of<ThemeColors>(context);
    _height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        color: colors.getAccentcolor(),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  height: _height * _headerRatio,
                  decoration: BoxDecoration(
                    color: colors.getPrimaryColor(),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _profile.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 25),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          _profile.emailId,
                          style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width - (_radius * 2 + 20),
                  top: MediaQuery.of(context).size.height * _headerRatio -
                      _radius,
                  child: CircleAvatar(
                    radius: _radius,
                    backgroundImage: AssetImage(_profile.imageAddress),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: FutureBuilder<Hosteler>(
                future: hosteler,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _profile.profileDetailsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          ProfileDetailsListItem profileItemList =
                              _profile.profileDetailsList.elementAt(index);
                          return Stack(
                            children: <Widget>[
                              ListTile(
                                leading: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[300],
                                        blurRadius: 8.0,
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      profileItemList.leadingIcon,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                                title: Text(profileItemList.title),
                                subtitle: Text(profileItemList.titleValue),
                              )
                            ],
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      "${snapshot.error}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
