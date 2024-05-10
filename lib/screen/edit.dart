import 'package:exercise2/controller/SpotController.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Spot'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: 20.0),
              TextFormField(
                controller: _namaTempatController,
                decoration: InputDecoration(labelText: 'Nama Tempat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Tempat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              _buildJenisKulinerRadio(),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _makananFavoritController,
                decoration: InputDecoration(labelText: 'Makanan Favorit'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _minumanFavoritController,
                decoration: InputDecoration(labelText: 'Minuman Favorit'),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _noTeleponController,
                decoration: InputDecoration(labelText: 'Nomor Telepon'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _lokasiController,
                decoration: InputDecoration(labelText: 'Lokasi'),
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _jamBukaController,
                      decoration: InputDecoration(labelText: 'Jam Buka'),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: TextFormField(
                      controller: _jamTutupController,
                      decoration: InputDecoration(labelText: 'Jam Tutup'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _ratingController,
                decoration: InputDecoration(labelText: 'Rating'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Spot updatedSpot = Spot(
                      id: widget.spot.id,
                      namaTempat: _namaTempatController.text,
                      jenisKuliner: _jenisKuliner,
                      makananFavorit: _makananFavoritController.text,
                      minumanFavorit: _minumanFavoritController.text,
                      noTelepon: _noTeleponController.text,
                      lokasi: _lokasiController.text,
                      jamBuka: _jamBukaController.text,
                      jamTutup: _jamTutupController.text,
                      rating: _ratingController.text,
                    );

                    bool success =
                        await _spotController.updateSpot(updatedSpot);
                    if (success) {
                      Navigator.pop(context, updatedSpot);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Gagal memperbarui spot.')),
                      );
                    }
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
