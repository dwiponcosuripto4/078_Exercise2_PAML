// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Spot {
  final String namaTempat;
  final List<String> jenisKuliner;
  final String makananFavorit;
  final String minumanFavorit;
  final String gambar;
  final String noTelepon;
  final String lokasi;
  final String jamBuka;
  final String jamTutup;
  final int rating;
  Spot({
    required this.namaTempat,
    required this.jenisKuliner,
    required this.makananFavorit,
    required this.minumanFavorit,
    required this.gambar,
    required this.noTelepon,
    required this.lokasi,
    required this.jamBuka,
    required this.jamTutup,
    required this.rating,
  });

  Spot copyWith({
    String? namaTempat,
    List<String>? jenisKuliner,
    String? makananFavorit,
    String? minumanFavorit,
    String? gambar,
    String? noTelepon,
    String? lokasi,
    String? jamBuka,
    String? jamTutup,
    int? rating,
  }) {
    return Spot(
      namaTempat: namaTempat ?? this.namaTempat,
      jenisKuliner: jenisKuliner ?? this.jenisKuliner,
      makananFavorit: makananFavorit ?? this.makananFavorit,
      minumanFavorit: minumanFavorit ?? this.minumanFavorit,
      gambar: gambar ?? this.gambar,
      noTelepon: noTelepon ?? this.noTelepon,
      lokasi: lokasi ?? this.lokasi,
      jamBuka: jamBuka ?? this.jamBuka,
      jamTutup: jamTutup ?? this.jamTutup,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'namaTempat': namaTempat,
      'jenisKuliner': jenisKuliner,
      'makananFavorit': makananFavorit,
      'minumanFavorit': minumanFavorit,
      'gambar': gambar,
      'noTelepon': noTelepon,
      'lokasi': lokasi,
      'jamBuka': jamBuka,
      'jamTutup': jamTutup,
      'rating': rating,
    };
  }

  factory Spot.fromMap(Map<String, dynamic> map) {
    return Spot(
      namaTempat: map['namaTempat'] as String,
      jenisKuliner: List<String>.from(map['jenisKuliner'] as List<String>),
      makananFavorit: map['makananFavorit'] as String,
      minumanFavorit: map['minumanFavorit'] as String,
      gambar: map['gambar'] as String,
      noTelepon: map['noTelepon'] as String,
      lokasi: map['lokasi'] as String,
      jamBuka: map['jamBuka'] as String,
      jamTutup: map['jamTutup'] as String,
      rating: map['rating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Spot.fromJson(String source) =>
      Spot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Spot(namaTempat: $namaTempat, jenisKuliner: $jenisKuliner, makananFavorit: $makananFavorit, minumanFavorit: $minumanFavorit, gambar: $gambar, noTelepon: $noTelepon, lokasi: $lokasi, jamBuka: $jamBuka, jamTutup: $jamTutup, rating: $rating)';
  }

  @override
  bool operator ==(covariant Spot other) {
    if (identical(this, other)) return true;

    return other.namaTempat == namaTempat &&
        listEquals(other.jenisKuliner, jenisKuliner) &&
        other.makananFavorit == makananFavorit &&
        other.minumanFavorit == minumanFavorit &&
        other.gambar == gambar &&
        other.noTelepon == noTelepon &&
        other.lokasi == lokasi &&
        other.jamBuka == jamBuka &&
        other.jamTutup == jamTutup &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return namaTempat.hashCode ^
        jenisKuliner.hashCode ^
        makananFavorit.hashCode ^
        minumanFavorit.hashCode ^
        gambar.hashCode ^
        noTelepon.hashCode ^
        lokasi.hashCode ^
        jamBuka.hashCode ^
        jamTutup.hashCode ^
        rating.hashCode;
  }
}
