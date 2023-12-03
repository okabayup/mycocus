import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

double? getDistance(
  LatLng titik1,
  LatLng titik2,
) {
  // get the distance between two points
  final int R = 6371; // Radius of the earth in km
  final double latDistance =
      math.pi * (titik2.latitude - titik1.latitude) / 180;
  final double lonDistance =
      math.pi * (titik2.longitude - titik1.longitude) / 180;
  final double a = math.sin(latDistance / 2) * math.sin(latDistance / 2) +
      math.cos(math.pi * titik1.latitude / 180) *
          math.cos(math.pi * titik2.latitude / 180) *
          math.sin(lonDistance / 2) *
          math.sin(lonDistance / 2);
  final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  final double distance = R * c; // convert to km
  return distance;
}

int? sumIntergerList(List<int>? list) {
  // get total value of list
  if (list == null || list.isEmpty) {
    return null;
  }
  int sum = 0;
  for (int i = 0; i < list.length; i++) {
    sum += list[i];
  }
  return sum;
}

int? getTotalDay(
  DateTime? date1,
  DateTime? date2,
) {
  // get total day of two date
  if (date1 == null || date2 == null) {
    return null;
  }
  final difference = date2.difference(date1).inDays;
  return difference.abs() + 1;
}

List<int>? listWaktuPakan(
  int? jam1,
  int? jam2,
  int? jam3,
) {
  // create interger list
// create a list of feeding times based on input hours
  if (jam1 == null || jam2 == null || jam3 == null) {
    return null;
  }
  List<int> feedingTimes = [jam1, jam2, jam3];
  feedingTimes.sort();
  return feedingTimes;
}

String encodeURLimage(String url) {
  // replace users/ with users%2F and /uploads/ with %2Fuploads%2F from url
  return url
      .replaceAll('users/', 'users%2F')
      .replaceAll('/uploads/', '%2Fuploads%2F');
}

int? getSecondFromTwoDateTime(
  DateTime datetime1,
  DateTime datetime2,
) {
  // calculate the difference of seconds from 2 datetime
// get the difference of seconds from two datetime
  final difference = datetime2.difference(datetime1).inSeconds;
  return difference.abs();
}
