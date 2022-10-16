import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilsServices {
  final _storage = const FlutterSecureStorage();

  // Save data localstorage
  Future<void> saveLocalData({
    required String key,
    required String data,
  }) async {
    await _storage.write(key: key, value: data);
  }

  // Get data localstorage
  Future<String?> getLocalData({required String key}) async {
    return await _storage.read(key: key);
  }

  // Delete data localstorage
  Future<void> deleteLocalData({required String key}) async {
    await _storage.delete(key: key);
  }

  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }

  void showToast({
    required String message,
    bool isError = false,
  }) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ? Colors.red : Colors.white,
        textColor: isError ? Colors.white : Colors.black,
        fontSize: 14.0);
  }
}
