import 'package:exercise2/controller/SpotController.dart';
import 'package:flutter/material.dart';
import 'package:exercise2/model/Spot.dart';

class CreateSpotForm extends StatefulWidget {
  @override
  State<CreateSpotForm> createState() => _CreateSpotFormState();
}

class _CreateSpotFormState extends State<CreateSpotForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaTempatController = TextEditingController();
  String _jenisKuliner = '';
  final _makananFavoritController = TextEditingController();
  final _minumanFavoritController = TextEditingController();
  final _noTeleponController = TextEditingController();
  final _lokasiController = TextEditingController();
  final _jamBukaController = TextEditingController();
  final _jamTutupController = TextEditingController();
  final _rating = TextEditingController();
  final SpotController _spotController = SpotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Spot'),
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
              _buildRatingRadio(),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Spot spot = Spot(
                      id: '',
                      namaTempat: _namaTempatController.text,
                      jenisKuliner: _jenisKuliner,
                      makananFavorit: _makananFavoritController.text,
                      minumanFavorit: _minumanFavoritController.text,
                      noTelepon: _noTeleponController.text,
                      lokasi: _lokasiController.text,
                      jamBuka: _jamBukaController.text,
                      jamTutup: _jamTutupController.text,
                      rating: _rating.text,
                    );
                    bool success = await _spotController.addSpot(spot);
                    if (success) {
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Gagal menambahkan spot.')),
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

  Widget _buildRadio(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: title,
          groupValue: _jenisKuliner == title ? title : null,
          onChanged: (String? value) {
            setState(() {
              _jenisKuliner = value ?? '';
            });
          },
        ),
        Text(title),
      ],
    );
  }

  Widget _buildJenisKulinerRadio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Jenis Kuliner'),
        Wrap(
          spacing: 8.0,
          children: [
            _buildRadio('Ayam'),
            _buildRadio('Bebek'),
            _buildRadio('Ikan'),
            _buildRadio('Seafood'),
            _buildRadio('Daging'),
            _buildRadio('Dessert'),
            _buildRadio('Bakaran'),
            _buildRadio('Tradisional'),
            _buildRadio('Sup'),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingRadio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Rating'),
        Row(
          children: [1, 2, 3, 4, 5]
              .map(
                (rating) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                      value: rating.toString(),
                      groupValue: _rating.text,
                      onChanged: (String? value) {
                        setState(() {
                          _rating.text = value ?? '';
                        });
                      },
                    ),
                    Text(rating.toString()),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
