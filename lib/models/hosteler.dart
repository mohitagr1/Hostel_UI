
import 'package:flutter/widgets.dart';

class Hosteler with ChangeNotifier{
    final num id;
    final String hostelerId;
    final String lastName;
    final String firstName;
    final String fatherName;
    final String motherName;
    final String phoneNumber;
    final String alternativePhoneNumber;
    final String emailId;
    final String college;
    final String course;
    final num floor;
    final num roomNumber;
    final num age;
    final String dateOfJoining;
    final String dateOfBirth;
    final String addressOfNative;
    final String addressOfCorrespondence;
    final bool haveVehicle;

  Hosteler({this.id, this.hostelerId, this.lastName, this.firstName, this.fatherName, this.motherName, this.phoneNumber, this.alternativePhoneNumber, this.emailId, this.college, this.course, this.floor, this.roomNumber, this.age, this.dateOfJoining, this.dateOfBirth, this.addressOfNative, this.addressOfCorrespondence, this.haveVehicle});
    
    Hosteler fromJson(Map<String,dynamic> json) {
      return Hosteler(

    id : json['id'] as num,
    hostelerId : json['hostelerId'] as String,
    firstName : json['firstName'] as String,
    lastName : json['lastName'] as String,
    fatherName : json['fatherName'] as String,
    motherName : json['motherName'] as String,
    phoneNumber : json['phoneNumber'] as String,
    alternativePhoneNumber : json['alternativePhoneNumber'] as String,
    emailId : json['emailId'] as String,
    college : json['college'] as String,
    course : json['course'] as String,
    floor : json['floor'] as num,
    roomNumber : json['roomNumber'] as num,
    age : json['age'] as num,
    dateOfJoining : json['dateOfJoining'] as String,
    dateOfBirth : json['dateOfBirth'] as String,
    addressOfNative : json['addressOfNative'] as String,
    addressOfCorrespondence : json['addressOfCorrespondence'] as String,
    haveVehicle : json['haveVehicle'] as bool,
      );
    }
}
