import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:private_upload/constants/app_constants.dart';
import 'package:private_upload/model/documentmodel2.dart';
import 'package:private_upload/model/signupmodel.dart';

import '../model/documentmodel.dart';

class PrivateProvider extends ChangeNotifier {
  Client client = Client();
  Account? account;
  Databases? databases;
  RealtimeSubscription? realtimeSubscription;
  Realtime? realtime;
  User? _user;
  bool? _isSignedup;
  bool? _isLoggedin;
  List<DocModel>? _item;
  List<DocModel2>? _seconditem;
  int? _value;

  int? get value => _value;
  List<DocModel>? get itemone => _item;
  List<DocModel2>? get itemtwo => _seconditem;
  User? get user => _user;
  bool? get isSignedup => _isSignedup;
  bool? get isLoggedin => _isLoggedin;

  PrivateProvider() {
    _init();
  }

  _init() {
    _isSignedup = false;
    _isLoggedin = false;
    _user = null;
    client
        .setEndpoint(Appconstants.endpoint)
        .setProject(Appconstants.projectid);
    account = Account(client);
    databases = Databases(client, databaseId: Appconstants.dbID);
  }

  Future _getaccount() async {
    try {
      final res = await account?.get();
      if (res?.status != null || res?.status == true) {
        final jsondata = jsonEncode(res!.toMap());
        final json = jsonDecode(jsondata);
        return User.fromJson(json);
      } else {
        return null;
      }
    } catch (e) {
      if (e is AppwriteException) {
        _isLoggedin = false;
      } else {
        rethrow;
      }
    }
  }

  login(String email, String password) async {
    try {
      var result =
          await account!.createEmailSession(email: email, password: password);
      _user = await _getaccount();

      if (result.current == true) {
        await _displayfirstdocument();
        await _displayseconddocument();
        subscribe();
        _isLoggedin = true;
      }

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  signup(String name, String email, String password) async {
    try {
      var result = await account!.create(
          userId: "unique()", name: name, email: email, password: password);
      if (result.status == true) {
        _isSignedup = true;
      } else {
        return await _getaccount();
      }
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  signout() async {
    try {
      await account?.deleteSession(sessionId: 'current');
      _isLoggedin = false;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  _displayfirstdocument() async {
    // do something
  }

  _displayseconddocument() async {
    // do something
  }

  updatefirstdocument(int price, String id) async {
    // do something
  }

  _checkbidder() async {
    // do something
  }

  createbidder() async {
    // do something
  }

  subscribe() {
    // do something
  }
  
  // close subscription function
}
