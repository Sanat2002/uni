import 'package:flutter/material.dart';
import 'package:uni/model/entities/location.dart';

class WcLocation implements Location {

  WcLocation(this.floor, {this.locationGroupId});
  @override
  final int floor;

  @override
  final weight = 1;

  @override
  final icon = Icons.wc;

  final int? locationGroupId;

  @override
  String description() {
    return 'Casa de banho';
  }

  @override
  Map<String, dynamic> toMap({int? groupId}) {
    return {'floor': floor, 'type': locationTypeToString(LocationType.atm)};
  }
}
