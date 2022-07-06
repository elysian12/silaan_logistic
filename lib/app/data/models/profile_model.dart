import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  String? name;
  String? phone;
  String? role;
  String? profileUrl;
  List<Availability>? availability;

  ProfileModel({
    this.name,
    this.phone,
    this.availability,
    this.role,
    this.profileUrl,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      availability: map['availability'] != null
          ? List<Availability>.from(
              (map['availability'] as List<int>).map<Availability?>(
                (x) => Availability.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  static ProfileModel fromSnapShot(DocumentSnapshot snapshot) {
    return ProfileModel(
      name: snapshot['name'],
      phone: snapshot['phone'],
      role: snapshot['role'],
      profileUrl: snapshot['profileUrl'],
      availability: List<Availability>.from(
        (snapshot['availability']).map<Availability?>(
          (x) => Availability.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'role': role,
      'availability': availability!.map((x) => x.toMap()).toList(),
    };
  }
}

class Availability {
  String? timeSlot;
  bool? isAvailable;

  Availability({
    this.timeSlot,
    this.isAvailable,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timeSlot': timeSlot,
      'isAvailable': isAvailable,
    };
  }

  factory Availability.fromMap(Map<String, dynamic> map) {
    return Availability(
      timeSlot: map['timeSlot'] != null ? map['timeSlot'] as String : null,
      isAvailable:
          map['isAvailable'] != null ? map['isAvailable'] as bool : null,
    );
  }
}
