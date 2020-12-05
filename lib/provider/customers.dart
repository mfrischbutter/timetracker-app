import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timetracker_app/api/api_reponse.dart';
import 'package:timetracker_app/api/service.dart';
import 'package:timetracker_app/models/customer.dart';

enum CustomersStatus {
  Uninitialized,
  Loading,
  Done,
}

class CustomersProvider extends ChangeNotifier {
  CustomersStatus _status = CustomersStatus.Uninitialized;
  List<Customer> _customers;
  List<DropdownMenuItem<int>> _dropdownList = List();

  CustomersStatus get status => _status;
  List<Customer> get customers => _customers;

  init() async {
    await fetchCustomers();
    return this;
  }

  fetchCustomers() async {
    ApiResponse _response = await ApiService().fetchCustomers();
    _customers = customersFromResponse(jsonDecode(_response.data));
    _status = CustomersStatus.Done;
    notifyListeners();
  }

  getDropdownList() {
    if (_dropdownList.length > 0) {
      return _dropdownList;
    }
    _customers.forEach((element) {
      _dropdownList.add(
        DropdownMenuItem(
          child: Text(element.name),
          value: element.id,
        ),
      );
    });
    return _dropdownList;
  }
}
