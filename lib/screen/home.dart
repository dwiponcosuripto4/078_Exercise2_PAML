import 'package:exercise2/controller/SpotController.dart';
import 'package:exercise2/screen/create.dart';
import 'package:exercise2/screen/detail.dart';
import 'package:exercise2/screen/edit.dart';
import 'package:flutter/material.dart';
import 'package:exercise2/model/Spot.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final SpotController _spotController = SpotController();
  late Future<List<Spot>> _spotDataFuture;

  @override
  void initState() {
    super.initState();
    _refreshSpotData();
  }

  Future<void> _refreshSpotData() async {
    setState(() {
      _spotDataFuture = _spotController.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata Kuliner'),
      ),
      body: FutureBuilder<List<Spot>>(
        future: _spotDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final spotData = snapshot.data!;
            return ListView.builder(
              itemCount: spotData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    final updatedSpot = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditSpotForm(spot: spotData[index]),
                      ),
                    );
                    if (updatedSpot != null) {
                      await _refreshSpotData();
                    }
                  },
                  child: _buildSpotCard(context, spotData[index]),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newSpot = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateSpotForm()),
          );
          if (newSpot != null) {
            await _refreshSpotData();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildSpotCard(BuildContext context, Spot spot) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    spot.namaTempat,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Jenis Kuliner: ${spot.jenisKuliner}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Lokasi: ${spot.lokasi}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Jam Tutup: ${spot.jamTutup}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Rating: ${spot.rating}',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                bool success = await _spotController.deleteSpot(spot.id);
                if (success) {
                  await _refreshSpotData(); // Refresh data after deletion
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to delete spot.')),
                  );
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailSpot(spot: spot),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
