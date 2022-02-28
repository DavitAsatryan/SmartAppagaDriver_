import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static String base_url = 'https://phpstack-351614-1150808.cloudwaysapps.com';
  static var api_url = base_url + '/api/customer';
  static var orderAPI = 'https://jsonplaceholder.typicode.com/posts';

  Future register(UserRegister userRegister) async {
    dynamic token = await FlutterSession().get('token');
    var respose = await http.post(
      Uri.parse(api_url + '/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userRegister.toDatabaseJson()),
    );
    var body = jsonDecode(respose.body);
    var data = body['data'];

    if (respose.statusCode == 200) {
      print("register status Code 200__==================");
      String token = data['access_token'];
      await FlutterSession().set('token', token);
    } else {
      throw Exception(json.decode(respose.body));
    }
  }

  Future login(UserLogin userLogin) async {
    dynamic token = await FlutterSession().get('token');
    final prefs = await SharedPreferences.getInstance();

    prefs.setString("token", token);
    print(prefs);

    var response = await http.post(
      Uri.parse(api_url + '/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(userLogin.toDatabaseJson()),
    );
    var body = jsonDecode(response.body);
    var data = body['data'];

    print("responce body  ${response.body}");
    if (response.statusCode == 200) {
      print("Login statusCode 200");

      String token = data['access_token'];
      await FlutterSession().set('token', token);
    } else {
      throw Exception(json.decode(response.body));
    }
  }

  Future phoneNumberSend(PhoneNumberModel phoneNumber) async {
    dynamic token = await FlutterSession().get('token');
    var response = await http.post(
      Uri.parse(api_url + '/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(phoneNumber.toDatabaseJson()),
    );
    var body = jsonDecode(response.body);
    var data = body['data'];

    print("responce body  ${response.body}");
    if (response.statusCode == 200) {
      print("PhoneNumber statusCode 200");

      String token = data['access_token'];
      await FlutterSession().set('token', token);
    } else {
      throw Exception(json.decode(response.body));
    }
  }

  Future pinCodeSend(PinCodeModel pinCode) async {
    dynamic token = await FlutterSession().get('token');
    var response = await http.post(
      Uri.parse(api_url + '/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(pinCode.toDatabaseJson()),
    );
    var body = jsonDecode(response.body);
    var data = body['data'];

    print("responce body  ${response.body}");
    if (response.statusCode == 200) {
      print("PinCode statusCode 200");

      String token = data['access_token'];
      await FlutterSession().set('token', token);
    } else {
      throw Exception(json.decode(response.body));
    }
  }

  Future passwordNewSend(PasswordNew newPassword) async {
    dynamic token = await FlutterSession().get('token');
    var response = await http.post(
      Uri.parse(api_url + '/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(newPassword.toDatabaseJson()),
    );
    var body = jsonDecode(response.body);
    var data = body['data'];

    print("responce body  ${response.body}");
    if (response.statusCode == 200) {
      print("newPassword statusCode 200");

      String token = data['access_token'];
      await FlutterSession().set('token', token);
    } else {
      throw Exception(json.decode(response.body));
    }
  }

  Future confirm(ConfirmModel confirmText) async {
    dynamic token = await FlutterSession().get('token');
    var response = await http.post(
      Uri.parse(api_url + '/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(confirmText.toDatabaseJson()),
    );
    var body = jsonDecode(response.body);
    var data = body['data'];

    print("responce body  ${response.body}");
    if (response.statusCode == 200) {
      print("Confirm statusCode 200");

      String token = data['access_token'];
      await FlutterSession().set('token', token);
    } else {
      throw Exception(json.decode(response.body));
    }
  }

  Future profileSendData(ProfileModel profileSendText) async {
    dynamic token = await FlutterSession().get('token');
    var response = await http.post(
      Uri.parse(api_url + '/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(profileSendText.toDatabaseJson()),
    );
    var body = jsonDecode(response.body);
    var data = body['data'];

    print("responce body  ${response.body}");
    if (response.statusCode == 200) {
      print("ProfileEdit statusCode 200");

      String token = data['access_token'];
      await FlutterSession().set('token', token);
    } else {
      throw Exception(json.decode(response.body));
    }
  }

  Future passwordChange(PasswordChange passwordChangeText) async {
    dynamic token = await FlutterSession().get('token');

    var response = await http.post(
      Uri.parse(api_url + '/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(passwordChangeText.toDatabaseJson()),
    );
    var body = jsonDecode(response.body);
    var data = body['data'];

    print("responce body  ${response.body}");
    if (response.statusCode == 200) {
      print("PasswordChange statusCode 200");

      String token = data['access_token'];
      await FlutterSession().set('token', token);
    } else {
      throw Exception(json.decode(response.body));
    }
  }

  Future qrCounterAndReasonModel(
      QrCounterAndReasonModel counterAndResasonText) async {
    dynamic token = await FlutterSession().get('token');
    var response = await http.post(
      Uri.parse(api_url + '/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(counterAndResasonText.toDatabaseJson()),
    );
    var body = jsonDecode(response.body);
    var data = body['data'];

    print("responce body  ${response.body}");
    if (response.statusCode == 200) {
      print("counterAndResason statusCode 200");

      String token = data['access_token'];
      await FlutterSession().set('token', token);
    } else {
      throw Exception(json.decode(response.body));
    }
  }

  Future qrCodeSend(QrCodeSendModel qrCodeSendModel) async {
    dynamic token = await FlutterSession().get('token');
    var response = await http.post(
      Uri.parse(api_url + '/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(qrCodeSendModel.toDatabaseJson()),
    );
    var body = jsonDecode(response.body);
    var data = body['data'];

    print("responce body  ${response.body}");
    if (response.statusCode == 200) {
      print("QrCodeSend statusCode 200");

      String token = data['access_token'];
      await FlutterSession().set('token', token);
    } else {
      throw Exception(json.decode(response.body));
    }
  }

  Future filtrdSendData(
      FiltrModel unassignedText, String api_url, String urlHost) async {
    dynamic token = await FlutterSession().get('token');
    var response = await http.post(
      Uri.parse(api_url + urlHost),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(unassignedText.toDatabaseJson()),
    );
    var body = jsonDecode(response.body);
    var data = body['data'];

    print("responce body  ${response.body}");
    if (response.statusCode == 200) {
      print("filtrdSendData statusCode 200");

      String token = data['access_token'];
      await FlutterSession().set('token', token);
    } else {
      throw Exception(json.decode(response.body));
    }
  }

// Notifications
  Future<List<NotificationModel>> notification() async {
    List<NotificationModel> notificationList = [];
    var respose = await http.get(Uri.parse(orderAPI));

    dynamic body = jsonDecode(respose.body);

    if (respose.statusCode == 200) {
      print("Notification statusCode____200");
      body.forEach((element) {
        NotificationModel notificationModel =
            NotificationModel.fromJson(element);
        notificationList.add(notificationModel);
      });
    }
    return notificationList;
  }

  Future sendSections(List<String> names) async {
    print("sections Names $names");

    var response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$names'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print("notificationDelete statusCode____200");
      var data = body['data'];
      String token = data['access_token'];
      await FlutterSession().set('token', token);
    }
  }

  Future<List<NotificationModel>> deleteItem(List<int> id) async {
    print("object $id");
    //List<int> id
    List<NotificationModel> notificationList = [];

    var response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print("notificationDelete statusCode____200");
      body.forEach((element) {
        NotificationModel notificationModel =
            NotificationModel.fromJson(element);
        notificationList.add(notificationModel);
      });
    }
    return notificationList;
  }

//LISTS add new dat.....
  Future<List<OrderModel>> orderMassage() async {
    List<OrderModel> orderList = [];
    var respose = await http.get(Uri.parse(orderAPI));

    dynamic body = jsonDecode(respose.body);

    if (respose.statusCode == 200) {
      print("Order statusCode____200");
      body.forEach((element) {
        OrderModel orderModel = OrderModel.fromJson(element);
        orderList.add(orderModel);
      });
    }
    return orderList;
  }

  Future<List<OrderModel>> ordersListGet(String orderAPI) async {
    List<OrderModel> orderList = [];
    var respose = await http.get(Uri.parse(orderAPI));

    dynamic body = jsonDecode(respose.body);

    if (respose.statusCode == 200) {
      print("ordersListGet statusCode____200");
      body.forEach((element) {
        OrderModel orderModel = OrderModel.fromJson(element);

        orderList.add(orderModel);
      });
    }
    return orderList;
  }
}

class UserLogin {
  String email;
  String password;

  UserLogin({required this.email, required this.password});
  Map<String, dynamic> toDatabaseJson() => {
        "email": this.email,
        "password": this.password,
      };
}

class PhoneNumberModel {
  String phoneNumber;

  PhoneNumberModel({required this.phoneNumber});
  Map<String, dynamic> toDatabaseJson() => {
        "phoneNumber": this.phoneNumber,
      };
}

class PinCodeModel {
  String pinCode;

  PinCodeModel({required this.pinCode});
  Map<String, dynamic> toDatabaseJson() => {
        "pinCode": this.pinCode,
      };
}

class PasswordNew {
  String password;
  String passwordTwo;

  PasswordNew({required this.password, required this.passwordTwo});
  Map<String, dynamic> toDatabaseJson() => {
        "password": this.password,
        "passwordTwo": this.passwordTwo,
      };
}

class ConfirmModel {
  String confirmText;

  ConfirmModel({required this.confirmText});
  Map<String, dynamic> toDatabaseJson() => {
        "confirm": this.confirmText,
      };
}

class QrCounterAndReasonModel {
  String counter;
  String reasonText;

  QrCounterAndReasonModel({required this.counter, required this.reasonText});
  Map<String, dynamic> toDatabaseJson() => {
        "counter": this.counter,
        "reasonText": this.reasonText,
      };
}

class QrCodeSendModel {
  String qrCode;

  QrCodeSendModel({required this.qrCode});
  Map<String, dynamic> toDatabaseJson() => {
        "QrCode": this.qrCode,
      };
}

class FiltrModel {
  String unassignedText;

  FiltrModel({required this.unassignedText});
  Map<String, dynamic> toDatabaseJson() => {
        "UnassignedModel": this.unassignedText,
      };
}

class UserRegister {
  String fullname;
  String phoneNumber;
  String email;
  String password;

  UserRegister({
    required this.fullname,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toDatabaseJson() => {
        "fullname": this.fullname,
        "phoneNumber": this.phoneNumber,
        "email": this.email,
        "password": this.password,
      };
}

class PasswordChange {
  String password;
  String newPassword;
  String newPasswordTwo;

  PasswordChange({
    required this.password,
    required this.newPassword,
    required this.newPasswordTwo,
  });
  Map<String, dynamic> toDatabaseJson() => {
        "password": this.password,
        "newPassword": this.newPassword,
        "newPasswordTwo": this.newPasswordTwo,
      };
}

class ProfileModel {
  var image;
  var fullname;
  var phoneNumber;
  var carsData;
  var isOne;
  var isTwo;
  var isThree;
  var isFour;

  ProfileModel({
    required this.image,
    required this.fullname,
    required this.phoneNumber,
    required this.carsData,
    required this.isOne,
    required this.isTwo,
    required this.isThree,
    required this.isFour,
  });
  ProfileModel.fromJson(Map<dynamic, dynamic> json) {
    image = json['image'];
    fullname = json['fullname'];
    phoneNumber = json['phoneNumber'];
    carsData = json['carsData'];

    isOne = json['isOne'];
    isTwo = json['isTwo'];
    isThree = json['isThree'];
    isFour = json['isFour'];
  }
  Map<String, dynamic> toDatabaseJson() => {
        "image": this.image,
        "fullname": this.fullname,
        "phoneNumber": this.phoneNumber,
        "carsData": this.carsData,
        "isOne": this.isOne,
        "isTwo": this.isTwo,
        "isThree": this.isThree,
        "isFour": this.isFour,
      };
}

class OrderModel {
  var userId;
  var id;
  var title;
  var body;
  int counter = 0;
  String accept = "Վերցնել";

  OrderModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  OrderModel.fromJson(Map<dynamic, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<dynamic, dynamic> toDatabaseJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}

class NotificationModel {
  var userId;
  var id;
  var title;
  var body;
  bool check = false;

  NotificationModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  NotificationModel.fromJson(Map<dynamic, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<dynamic, dynamic> toDatabaseJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
