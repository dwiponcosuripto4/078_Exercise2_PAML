// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Spot {
  final String id;
  final String namaTempat;
  final String jenisKuliner;
  final String makananFavorit;
  final String minumanFavorit;
  final String noTelepon;
  final String lokasi;
  final String jamBuka;
  final String jamTutup;
  final String rating;
  Spot({
    required this.id,
    required this.namaTempat,
    required this.jenisKuliner,
    required this.makananFavorit,
    required this.minumanFavorit,
    required this.noTelepon,
    required this.lokasi,
    required this.jamBuka,
    required this.jamTutup,
    required this.rating,
  });

  Spot copyWith({
    String? id,
    String? namaTempat,
    String? jenisKuliner,
    String? makananFavorit,
    String? minumanFavorit,
    String? noTelepon,
    String? lokasi,
    String? jamBuka,
    String? jamTutup,
    String? rating,
  }) {
    return Spot(
      id: id ?? this.id,
      namaTempat: namaTempat ?? this.namaTempat,
      jenisKuliner: jenisKuliner ?? this.jenisKuliner,
      makananFavorit: makananFavorit ?? this.makananFavorit,
      minumanFavorit: minumanFavorit ?? this.minumanFavorit,
      noTelepon: noTelepon ?? this.noTelepon,
      lokasi: lokasi ?? this.lokasi,
      jamBuka: jamBuka ?? this.jamBuka,
      jamTutup: jamTutup ?? this.jamTutup,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'namaTempat': namaTempat,
      'jenisKuliner': jenisKuliner,
      'makananFavorit': makananFavorit,
      'minumanFavorit': minumanFavorit,
      'noTelepon': noTelepon,
      'lokasi': lokasi,
      'jamBuka': jamBuka,
      'jamTutup': jamTutup,
      'rating': rating,
    };
  }

  factory Spot.fromMap(Map<String, dynamic> map) {
    return Spot(
      id: map['id'] as String,
      namaTempat: map['namaTempat'] as String,
      jenisKuliner: map['jenisKuliner'] as String,
      makananFavorit: map['makananFavorit'] as String,
      minumanFavorit: map['minumanFavorit'] as String,
      noTelepon: map['noTelepon'] as String,
      lokasi: map['lokasi'] as String,
      jamBuka: map['jamBuka'] as String,
      jamTutup: map['jamTutup'] as String,
      rating: map['rating'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Spot.fromJson(String source) =>
      Spot.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Spot(id: $id, namaTempat: $namaTempat, jenisKuliner: $jenisKuliner, makananFavorit: $makananFavorit, minumanFavorit: $minumanFavorit, noTelepon: $noTelepon, lokasi: $lokasi, jamBuka: $jamBuka, jamTutup: $jamTutup, rating: $rating)';
  }

  @override
  bool operator ==(covariant Spot other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.namaTempat == namaTempat &&
        other.jenisKuliner == jenisKuliner &&
        other.makananFavorit == makananFavorit &&
        other.minumanFavorit == minumanFavorit &&
        other.noTelepon == noTelepon &&
        other.lokasi == lokasi &&
        other.jamBuka == jamBuka &&
        other.jamTutup == jamTutup &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        namaTempat.hashCode ^
        jenisKuliner.hashCode ^
        makananFavorit.hashCode ^
        minumanFavorit.hashCode ^
        noTelepon.hashCode ^
        lokasi.hashCode ^
        jamBuka.hashCode ^
        jamTutup.hashCode ^
        rating.hashCode;
  }
}
