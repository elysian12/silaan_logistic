import 'package:cloud_firestore/cloud_firestore.dart';

enum Status { placed, accepted, processing, ready, delivered }

enum PaymentStatus { incomplete, complete }

class OrderModel {
  String? imgUrl;
  String? orderID;
  String? typeOfCloth;
  String? typeOfStich;
  Status? orderStatus;
  String? descripition;
  int? amount;
  int? qunatity;
  DateTime? pickDate;
  DateTime? deliveryDate;
  String? location;
  String? contactNumber;
  String? name;
  Measurements? measurements;
  List<String> rejectionsId;
  PaymentStatus? paymentStatus;

  OrderModel({
    this.imgUrl,
    this.orderID,
    this.typeOfCloth,
    this.typeOfStich,
    this.orderStatus,
    this.descripition,
    this.amount,
    this.qunatity,
    this.pickDate,
    this.deliveryDate,
    this.location,
    this.contactNumber,
    this.name,
    this.measurements,
    this.rejectionsId = const [],
    this.paymentStatus,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
        imgUrl: map['imgUrl'] != null ? map['imgUrl'] as String : null,
        orderID: map['orderID'] != null ? map['orderID'] as String : null,
        typeOfCloth:
            map['typeOfCloth'] != null ? map['typeOfCloth'] as String : null,
        typeOfStich:
            map['typeOfStich'] != null ? map['typeOfStich'] as String : null,
        orderStatus: map['orderStatus'] != null
            ? Status.values.byName(map['orderStatus'])
            : null,
        descripition:
            map['descripition'] != null ? map['descripition'] as String : null,
        amount: map['amount'] != null ? map['amount'] as int : null,
        qunatity: map['qunatity'] != null ? map['qunatity'] as int : null,
        pickDate: map['pickDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['pickDate'] as int)
            : null,
        deliveryDate: map['deliveryDate'] != null
            ? DateTime.fromMillisecondsSinceEpoch(map['deliveryDate'] as int)
            : null,
        location: map['location'] != null ? map['location'] as String : null,
        contactNumber: map['contactNumber'] != null
            ? map['contactNumber'] as String
            : null,
        name: map['name'] != null ? map['name'] as String : null,
        measurements: map['measurements'] != null
            ? Measurements.fromMap(map['measurements'] as Map<String, dynamic>)
            : null,
        rejectionsId: List<String>.from(
          (map['rejectionsId'] as List<String>),
        ));
  }

  static OrderModel fromSnapShot(DocumentSnapshot snapshot) {
    return OrderModel(
      imgUrl: snapshot['imgUrl'] != null ? snapshot['imgUrl'] as String : null,
      orderID:
          snapshot['orderID'] != null ? snapshot['orderID'] as String : null,
      typeOfCloth: snapshot['typeOfCloth'] != null
          ? snapshot['typeOfCloth'] as String
          : null,
      orderStatus: snapshot['orderStatus'] != null
          ? Status.values.byName(snapshot['orderStatus'])
          : null,
      paymentStatus: snapshot['paymentStatus'] != null
          ? PaymentStatus.values.byName(snapshot['paymentStatus'])
          : null,
      descripition: snapshot['descripition'] != null
          ? snapshot['descripition'] as String
          : null,
      amount: snapshot['amount'] != null ? snapshot['amount'] as int : null,
      qunatity:
          snapshot['qunatity'] != null ? snapshot['qunatity'] as int : null,
      pickDate: snapshot['pickDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(snapshot['pickDate'] as int)
          : null,
      deliveryDate: snapshot['deliveryDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(snapshot['deliveryDate'] as int)
          : null,
      location:
          snapshot['location'] != null ? snapshot['location'] as String : null,
      contactNumber: snapshot['contactNumber'] != null
          ? snapshot['contactNumber'] as String
          : null,
      name: snapshot['name'] != null ? snapshot['name'] as String : null,
      measurements: snapshot['measurements'] != null
          ? Measurements.fromMap(
              snapshot['measurements'] as Map<String, dynamic>)
          : null,
      rejectionsId: List<String>.from(
        (snapshot['rejectionsId']),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imgUrl': imgUrl,
      'orderID': orderID,
      'typeOfCloth': typeOfCloth,
      'typeOfStich': typeOfStich,
      'orderStatus': orderStatus!.name,
      'descripition': descripition,
      'amount': amount,
      'qunatity': qunatity,
      'pickDate': pickDate?.millisecondsSinceEpoch,
      'deliveryDate': deliveryDate?.millisecondsSinceEpoch,
      'location': location,
      'contactNumber': contactNumber,
      'name': name,
      'measurements': measurements?.toMap(),
      'rejectionsId': rejectionsId,
      'paymentStatus': paymentStatus!.name,
    };
  }
}

class Measurements {
  String? armLength;
  String? backNeckDepth;
  String? chest;
  String? comments;
  String? frontNeckDepth;
  String? shoulderLength;
  String? upperBodyLength;
  Measurements({
    this.armLength,
    this.backNeckDepth,
    this.chest,
    this.comments,
    this.frontNeckDepth,
    this.shoulderLength,
    this.upperBodyLength,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'armLength': armLength,
      'backNeckDepth': backNeckDepth,
      'chest': chest,
      'comments': comments,
      'frontNeckDepth': frontNeckDepth,
      'shoulderLength': shoulderLength,
      'upperBodyLength': upperBodyLength,
    };
  }

  factory Measurements.fromMap(Map<String, dynamic> map) {
    return Measurements(
      armLength: map['armLength'] != null ? map['armLength'] as String : null,
      backNeckDepth:
          map['backNeckDepth'] != null ? map['backNeckDepth'] as String : null,
      chest: map['chest'] != null ? map['chest'] as String : null,
      comments: map['comments'] != null ? map['comments'] as String : null,
      frontNeckDepth: map['frontNeckDepth'] != null
          ? map['frontNeckDepth'] as String
          : null,
      shoulderLength: map['shoulderLength'] != null
          ? map['shoulderLength'] as String
          : null,
      upperBodyLength: map['upperBodyLength'] != null
          ? map['upperBodyLength'] as String
          : null,
    );
  }
}
