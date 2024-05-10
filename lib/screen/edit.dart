import 'package:exercise2/model/Spot.dart';
import 'package:flutter/material.dart';

class EditSpotForm extends StatefulWidget {
  final Spot spot;

  const EditSpotForm({Key? key, required this.spot}) : super(key: key);

  @override
  State<EditSpotForm> createState() => _EditSpotFormState();
}

class _EditSpotFormState extends State<EditSpotForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaTempatController = TextEditingController();
  String _jenisKuliner = '';
  final _makananFavoritController = TextEditingController();
  final _minumanFavoritController = TextEditingController();
  final _noTeleponController = TextEditingController();
  final _lokasiController = TextEditingController();
  final _jamBukaController = TextEditingController();
  final _jamTutupController = TextEditingController();
  final _ratingController = TextEditingController();
  final SpotController _spotController = SpotController();

  @override
  void initState() {
    super.initState();
    _namaTempatController.text = widget.spot.namaTempat;
    _jenisKuliner = widget.spot.jenisKuliner;
    _makananFavoritController.text = widget.spot.makananFavorit;
    _minumanFavoritController.text = widget.spot.minumanFavorit;
    _noTeleponController.text = widget.spot.noTelepon;
    _lokasiController.text = widget.spot.lokasi;
    _jamBukaController.text = widget.spot.jamBuka;
    _jamTutupController.text = widget.spot.jamTutup;
    _ratingController.text = widget.spot.rating;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
