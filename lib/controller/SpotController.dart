import 'package:exercise2/model/Spot.dart';
import 'package:exercise2/screen/create.dart';
import 'package:exercise2/screen/edit.dart';
import 'package:exercise2/service/SpotService.dart';
import 'package:flutter/material.dart';

class SpotController {
  final SpotService _spotService = SpotService();

  Future<List<Spot>> getData() async {
    return _spotService.getData();
  }

  Future<bool> updateSpot(Spot spot) async {
    return _spotService.updateSpot(spot);
  }

  Future<bool> deleteSpot(String id) async {
    return _spotService.deleteData(id);
  }

  Future<bool> addSpot(Spot spot) async {
    return _spotService.addSpot(spot);
  }

  void navigateToCreateFormScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateSpotForm(),
      ),
    );
  }
}
