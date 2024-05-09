import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:exercise2/model/Spot.dart';

class CreateSpotForm extends StatefulWidget {
  @override
  State<CreateSpotForm> createState() => _CreateSpotFormState();
}

class _CreateSpotFormState extends State<CreateSpotForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaTempatController = TextEditingController();
  final _makananFavoritController = TextEditingController();
  final _minumanFavoritController = TextEditingController();
  final _noTeleponController = TextEditingController();
  final _lokasiController = TextEditingController();
  final _jamBukaController = TextEditingController();
  final _jamTutupController = TextEditingController();

  List<String> _jenisKuliner = [];
  int _rating = 1;
  File? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
              _buildImagePicker(),
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Wrap the data and image path in a container before sending
                    Spot data = Spot(
                      namaTempat: _namaTempatController.text,
                      jenisKuliner: _jenisKuliner,
                      makananFavorit: _makananFavoritController.text,
                      minumanFavorit: _minumanFavoritController.text,
                      gambar: _image!.path,
                      noTelepon: _noTeleponController.text,
                      lokasi: _lokasiController.text,
                      jamBuka: _jamBukaController.text,
                      jamTutup: _jamTutupController.text,
                      rating: _rating,
                    );

                    Navigator.pop(context,
                        data); // Kembali ke halaman sebelumnya dengan membawa data yang baru ditambahkan
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

  Widget _buildImagePicker() {
    return Column(
      children: [
        _image == null
            ? Text('Pilih gambar tempat')
            : Image.file(
                _image!,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
        SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: _getImage,
          child: Text('Pilih Gambar'),
        ),
      ],
    );
  }

  Widget _buildRadio(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: title,
          groupValue: _jenisKuliner.contains(title) ? title : null,
          onChanged: (String? value) {
            setState(() {
              if (_jenisKuliner.contains(value)) {
                _jenisKuliner.remove(value);
              } else {
                _jenisKuliner.add(value!);
              }
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
                      value: rating,
                      groupValue: _rating,
                      onChanged: (int? value) {
                        setState(() {
                          _rating = value!;
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
