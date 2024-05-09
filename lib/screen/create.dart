import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

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
    return const Placeholder();
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
}
