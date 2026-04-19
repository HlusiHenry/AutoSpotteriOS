import 'package:flutter/material.dart';
import '../models/car.dart';
import '../services/spot_service.dart';

class DetailScreen extends StatefulWidget {
  final Car car;
  final VoidCallback onSpotChanged;

  const DetailScreen({super.key, required this.car, required this.onSpotChanged});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isSpotted = false;

  @override
  void initState() {
    super.initState();
    _loadSpotted();
  }

  Future<void> _loadSpotted() async {
    final ids = await SpotService.getSpottedIds();
    setState(() => _isSpotted = ids.contains(widget.car.id));
  }

  Future<void> _toggleSpot() async {
    if (_isSpotted) {
      await SpotService.removeSpot(widget.car.id);
    } else {
      await SpotService.markAsSpotted(widget.car.id);
    }
    setState(() => _isSpotted = !_isSpotted);
    widget.onSpotChanged();
  }

  Color get _rarityColor {
    switch (widget.car.rarityLevel) {
      case 1: return Colors.grey;
      case 2: return Colors.green;
      case 3: return Colors.blue;
      case 4: return Colors.purple;
      case 5: return Colors.orange;
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final car = widget.car;
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            backgroundColor: const Color(0xFF1A1A1A),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color(0xFF1A1A1A),
                child: Center(
                  child: Text(car.emoji, style: const TextStyle(fontSize: 120)),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(car.brand, style: const TextStyle(color: Colors.grey, fontSize: 16)),
                            Text(car.model, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _rarityColor.withAlpha(50),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: _rarityColor),
                        ),
                        child: Text(car.rarityLabel, style: TextStyle(color: _rarityColor, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('${car.points} Punkte', style: const TextStyle(color: Color(0xFFE8C547), fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text(car.description, style: const TextStyle(color: Colors.grey, fontSize: 15, height: 1.5)),
                  const SizedBox(height: 24),
                  const Text('Daten', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _statRow('Leistung', '${car.hp} PS'),
                  _statRow('Höchstgeschwindigkeit', '${car.topSpeed} km/h'),
                  _statRow('Preis', car.price),
                  _statRow('Baujahr', '${car.year}'),
                  _statRow('Kategorie', car.category),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _toggleSpot,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isSpotted ? Colors.green : const Color(0xFFE8C547),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: Text(
                        _isSpotted ? '✓ Gespottet!' : 'Als gespottet markieren',
                        style: TextStyle(
                          color: _isSpotted ? Colors.white : Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 15)),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}