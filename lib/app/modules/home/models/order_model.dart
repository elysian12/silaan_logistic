import 'package:cloud_firestore/cloud_firestore.dart';

enum Status { incomplete, complete }

class OrderModel {
  String? imgUrl;
  String? orderID;
  String? productName;
  Status? status;
  String? decripition;
  int? amount;
  int? qunatity;
  DateTime? pickDate;
  DateTime? deliveryDate;
  String? location;
  String? contactNumber;
  String? name;
  Measurements? measurements;

  OrderModel({
    this.imgUrl,
    this.orderID,
    this.productName,
    this.status,
    this.decripition,
    this.amount,
    this.qunatity,
    this.pickDate,
    this.deliveryDate,
    this.location,
    this.contactNumber,
    this.name,
    this.measurements,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      imgUrl: map['imgUrl'] != null ? map['imgUrl'] as String : null,
      orderID: map['orderID'] != null ? map['orderID'] as String : null,
      productName:
          map['productName'] != null ? map['productName'] as String : null,
      status:
          map['status'] != null ? Status.values.byName(map['status']) : null,
      decripition:
          map['decripition'] != null ? map['decripition'] as String : null,
      amount: map['amount'] != null ? map['amount'] as int : null,
      qunatity: map['qunatity'] != null ? map['qunatity'] as int : null,
      pickDate: map['pickDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['pickDate'] as int)
          : null,
      deliveryDate: map['deliveryDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['deliveryDate'] as int)
          : null,
      location: map['location'] != null ? map['location'] as String : null,
      contactNumber:
          map['contactNumber'] != null ? map['contactNumber'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      measurements: map['measurements'] != null
          ? Measurements.fromMap(map['measurements'] as Map<String, dynamic>)
          : null,
    );
  }

  static OrderModel fromSnapShot(DocumentSnapshot snapshot) {
    return OrderModel(
      imgUrl: snapshot['imgUrl'] != null ? snapshot['imgUrl'] as String : null,
      productName: snapshot['typeOfClothing'] != null
          ? snapshot['typeOfClothing'] as String
          : null,
      orderID:
          snapshot['orderID'] != null ? snapshot['orderID'] as String : null,
      status: snapshot['paymentStatus'] != null
          ? Status.values.byName(snapshot['paymentStatus'])
          : null,
      decripition: snapshot['descripition'] != null
          ? snapshot['descripition'] as String
          : null,
      amount: snapshot['amount'] != null ? snapshot['amount'] as int : null,
      qunatity:
          snapshot['quantity'] != null ? snapshot['quantity'] as int : null,
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
      measurements: snapshot['Measurement'] != null
          ? Measurements.fromMap(
              snapshot['Measurement'] as Map<String, dynamic>)
          : null,
    );
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






// List<OrderModel> orders = [
//   OrderModel(
//     imgUrl: ImageHelper.model1,
//     orderID: 'OX23345002Z',
//     productName: 'Product Name',
//     status: Status.incomplete,
//     name: 'Sneha Sharma',
//     decripition:
//         'Front Neck [ V Neck ] \n Back Neck [ Boat Neck ] \n Cut [ Plain Cut ] \n Sleeves [ 3/4 th sleeves] \n Size : XXS',
//     amount: '₹ 999.00',
//     qunatity: 1,
//     contactNumber: '91-9632548742',
//     deliveryDate: ' 22 June 2022',
//     pickDate: ' 22 June 2022',
//     location: '25/1 Geetanjali Apartment',
//   ),
//   OrderModel(
//     imgUrl: ImageHelper.model1,
//     orderID: 'OX23345002Z',
//     productName: 'Product Name',
//     status: Status.complete,
//     name: 'Sneha Sharma',
//     decripition:
//         'Front Neck [ V Neck ] \n Back Neck [ Boat Neck ] \n Cut [ Plain Cut ] \n Sleeves [ 3/4 th sleeves] \n Size : XXS',
//     amount: '₹ 999.00',
//     qunatity: 1,
//     contactNumber: '91-9632548742',
//     deliveryDate: ' 22 June 2022',
//     pickDate: ' 22 June 2022',
//     location: '25/1 Geetanjali Apartment',
//   ),
//   OrderModel(
//     imgUrl: ImageHelper.model1,
//     orderID: 'OX23345002Z',
//     productName: 'Product Name',
//     status: Status.incomplete,
//     name: 'Sneha Sharma',
//     decripition:
//         'Front Neck [ V Neck ] \n Back Neck [ Boat Neck ] \n Cut [ Plain Cut ] \n Sleeves [ 3/4 th sleeves] \n Size : XXS',
//     amount: '₹ 999.00',
//     qunatity: 1,
//     contactNumber: '91-9632548742',
//     deliveryDate: ' 22 June 2022',
//     pickDate: ' 22 June 2022',
//     location: '25/1 Geetanjali Apartment',
//   ),
//   OrderModel(
//     imgUrl: ImageHelper.model1,
//     orderID: 'OX23345002Z',
//     productName: 'Product Name',
//     status: Status.incomplete,
//     name: 'Sneha Sharma',
//     decripition:
//         'Front Neck [ V Neck ] \n Back Neck [ Boat Neck ] \n Cut [ Plain Cut ] \n Sleeves [ 3/4 th sleeves] \n Size : XXS',
//     amount: '₹ 999.00',
//     qunatity: 1,
//     contactNumber: '91-9632548742',
//     deliveryDate: ' 22 June 2022',
//     pickDate: ' 22 June 2022',
//     location: '25/1 Geetanjali Apartment',
//   ),
//   OrderModel(
//     imgUrl: ImageHelper.model1,
//     orderID: 'OX23345002Z',
//     productName: 'Product Name',
//     status: Status.incomplete,
//     name: 'Sneha Sharma',
//     decripition:
//         'Front Neck [ V Neck ] \n Back Neck [ Boat Neck ] \n Cut [ Plain Cut ] \n Sleeves [ 3/4 th sleeves] \n Size : XXS',
//     amount: '₹ 999.00',
//     qunatity: 1,
//     contactNumber: '91-9632548742',
//     deliveryDate: ' 22 June 2022',
//     pickDate: ' 22 June 2022',
//     location: '25/1 Geetanjali Apartment',
//   ),
// ];
