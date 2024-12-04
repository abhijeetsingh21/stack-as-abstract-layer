import 'dart:developer';

import 'package:cred_demo_application/feature/abstraction/model/card_data_model.dart';
import 'package:cred_demo_application/feature/abstraction/repo/card_data_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StackState extends ChangeNotifier {
  int _expandedIndex = -1;
  bool isLoading = false;

  int get expandedIndex => _expandedIndex;
  MockApiModel? _mockDataModel;
  MockApiModel? get mockDataModel => _mockDataModel;

  void getCardData() async {
    try {
      isLoading = true;
      final response = await CardDataRepo.getCardData();
      _mockDataModel = response;

      isLoading = false;
      Fluttertoast.showToast(msg: 'Successful request');
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      isLoading = false;
    }
  }

  void toggleIndex(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = -1;
    } else {
      _expandedIndex = index;
    }
    notifyListeners();
  }
}
