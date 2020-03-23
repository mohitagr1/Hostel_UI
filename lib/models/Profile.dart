import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hoste_ui/models/hosteler.dart';
import 'package:hoste_ui/services/http_service.dart';
import 'package:provider/provider.dart';

class Profile {
  final String imageAddress;
  final String name;
  final String emailId;
  final List<ProfileDetailsListItem> profileDetailsList;

  Profile(this.imageAddress, this.name, this.emailId, this.profileDetailsList);
}

class ProfileDetailsListItem {
  final IconData leadingIcon;
  final String title;
  final String titleValue;

  ProfileDetailsListItem(this.leadingIcon, this.title, this.titleValue);
}

final myprofile = new Profile(
  "assets/images/demo_person_image.jpeg",
  "Lokesh Kedia",
  "lokesh1agarwal@gmail.com",
  [
    new ProfileDetailsListItem(
      Icons.school,
      "Institute",
      "DSCE",
    ),
    new ProfileDetailsListItem(
      Icons.phone,
      "Phone Number",
      "+91 9079256741",
    ),
    new ProfileDetailsListItem(
      Icons.location_on,
      "Address",
      "RR nagar, Bangaluru, Karnataka",
    ),
    new ProfileDetailsListItem(
      Icons.location_on,
      "Address",
      "RR nagar, Bangaluru, Karnataka",
    ),
    new ProfileDetailsListItem(
      Icons.location_on,
      "Address",
      "RR nagar, Bangaluru, Karnataka",
    ),
    new ProfileDetailsListItem(
      Icons.location_on,
      "Address",
      "RR nagar, Bangaluru, Karnataka",
    ),
    new ProfileDetailsListItem(
      Icons.location_on,
      "Address",
      "RR nagar, Bangaluru, Karnataka",
    ),
    new ProfileDetailsListItem(
      Icons.location_on,
      "Address",
      "RR nagar, Bangaluru, Karnataka",
    ),
    new ProfileDetailsListItem(
      Icons.location_on,
      "Address",
      "RR nagar, Bangaluru, Karnataka",
    ),
    new ProfileDetailsListItem(
      Icons.location_on,
      "Address",
      "RR nagar, Bangaluru, Karnataka",
    ),
    new ProfileDetailsListItem(
      Icons.location_on,
      "Address",
      "RR nagar, Bangaluru, Karnataka",
    ),
    new ProfileDetailsListItem(
      Icons.phone,
      "Phone Number",
      "+91 9079256741",
    )
  ],
);
