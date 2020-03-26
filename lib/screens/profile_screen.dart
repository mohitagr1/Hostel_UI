import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoste_ui/models/index.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hoste_ui/models/themecolors.dart';
import 'package:provider/provider.dart';

const url = "http://192.168.43.116:9090/hosteler/getByHostelerId/";

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double _radius = 60;
  double _headerRatio = 0.20;
  double _height;

  @override
  void initState() {
    super.initState();
  }

  Future<Hosteler> updateUI() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print("Yo lets see");
    print(sharedPreferences.getString('hostelerId'));
    http.Response response =
        await http.get(url + sharedPreferences.getString('hostelerId'));
    return Hosteler.fromJson(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors colors = Provider.of<ThemeColors>(context);
    _height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: updateUI(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          Hosteler hosteler = snapshot.data;
          return SingleChildScrollView(
            child: Container(
              color: colors.getAccentcolor(),
              height: MediaQuery.of(context).size.height + 100,
              child: Column(
                children: <Widget>[
                  _profileHeader(
                    hosteler.firstName + " " + hosteler.lastName,
                    hosteler.emailId,
                    "assets/images/demo_person_image.jpeg",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        _customListTile(
                          Icons.school,
                          "Institue",
                          hosteler.college,
                        ),
                        _customListTile(Icons.person_outline, "Father's Name",
                            hosteler.fatherName),
                        _customListTile(
                          Icons.person_outline,
                          "Mother's Name",
                          hosteler.motherName,
                        ),
                        _customListTile(Icons.phone_iphone, "Phone Number",
                            hosteler.phoneNumber),
                        _customListTile(
                          Icons.hotel,
                          "Room Number",
                          "${hosteler.roomNumber}",
                        ),
                        _customListTile(
                          Icons.date_range,
                          "Birth Day",
                          hosteler.dateOfBirth,
                        ),
                        _customListTile(
                          Icons.date_range,
                          "Date Of Joining",
                          hosteler.dateOfJoining,
                        ),
                        _customListTile(
                          Icons.location_on,
                          "Address",
                          hosteler.addressOfNative,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Oops..Something went wrong : " + snapshot.error),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }
      },
    );
  }

  Widget _profileHeader(String name, String emailId, String imageAddress) {
    ThemeColors colors = Provider.of<ThemeColors>(context);
    return Stack(
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
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  emailId,
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
          top: MediaQuery.of(context).size.height * _headerRatio - _radius,
          child: CircleAvatar(
            radius: _radius,
            backgroundImage: AssetImage(imageAddress),
          ),
        )
      ],
    );
  }

  Widget _customListTile(IconData icon, String title, String subTitle) {
    return ListTile(
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
            icon,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
