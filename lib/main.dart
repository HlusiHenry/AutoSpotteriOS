import 'package:flutter/material.dart';
import 'data/cars_data.dart';
import 'models/car.dart';
import 'services/spot_service.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(const AutoSpotterApp());
}

class AutoSpotterApp extends StatelessWidget {
  const AutoSpotterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoSpotter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE8C547),
          surface: Color(0xFF1A1A1A),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List<String> _spottedIds = [];

  @override
  void initState() {
    super.initState();
    _loadSpotted();
  }

  Future<void> _loadSpotted() async {
    final ids = await SpotService.getSpottedIds();
    setState(() => _spottedIds = ids);
  }

  int get _totalPoints {
    return allCars
        .where((c) => _spottedIds.contains(c.id))
        .fold(0, (sum, c) => sum + c.points);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(spottedIds: _spottedIds, totalPoints: _totalPoints, onSpotChanged: _loadSpotted),
          EntdeckenScreen(spottedIds: _spottedIds, onSpotChanged: _loadSpotted),
          SammlungScreen(spottedIds: _spottedIds, onSpotChanged: _loadSpotted),
          StatsScreen(spottedIds: _spottedIds, totalPoints: _totalPoints),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: const Color(0xFF1A1A1A),
        selectedItemColor: const Color(0xFFE8C547),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Entdecken'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Sammlung'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
        ],
      ),
    );
  }
}

// ── HOME ──────────────────────────────────────────────
class HomeScreen extends StatelessWidget {
  final List<String> spottedIds;
  final int totalPoints;
  final VoidCallback onSpotChanged;

  const HomeScreen({super.key, required this.spottedIds, required this.totalPoints, required this.onSpotChanged});

  @override
  Widget build(BuildContext context) {
    final recentCars = allCars.where((c) => spottedIds.contains(c.id)).toList().reversed.take(5).toList();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('AutoSpotter', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF2A2A1A), Color(0xFF1A1A0A)],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE8C547).withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  const Text('Gesamtpunkte', style: TextStyle(color: Colors.grey, fontSize: 16)),
                  const SizedBox(height: 8),
                  Text('$totalPoints', style: const TextStyle(color: Color(0xFFE8C547), fontSize: 56, fontWeight: FontWeight.bold)),
                  Text('${spottedIds.length} / ${allCars.length} Autos gespottet',
                      style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            if (recentCars.isNotEmpty) ...[
              const Text('Zuletzt gespottet', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              ...recentCars.map((car) => _recentCarTile(context, car)),
            ] else
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Text('🚗', style: TextStyle(fontSize: 60)),
                      SizedBox(height: 16),
                      Text('Noch keine Autos gespottet!',
                          style: TextStyle(color: Colors.grey, fontSize: 16)),
                      Text('Geh zu Entdecken und leg los.',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _recentCarTile(BuildContext context, Car car) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (_) => DetailScreen(car: car, onSpotChanged: onSpotChanged),
      )),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(car.emoji, style: const TextStyle(fontSize: 30)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${car.brand} ${car.model}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(car.category, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            Text('+${car.points}', style: const TextStyle(color: Color(0xFFE8C547), fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// ── ENTDECKEN ──────────────────────────────────────────────
class EntdeckenScreen extends StatefulWidget {
  final List<String> spottedIds;
  final VoidCallback onSpotChanged;

  const EntdeckenScreen({super.key, required this.spottedIds, required this.onSpotChanged});

  @override
  State<EntdeckenScreen> createState() => _EntdeckenScreenState();
}

class _EntdeckenScreenState extends State<EntdeckenScreen> {
  String _search = '';
  String? _selectedBrand;
  String? _selectedCategory;

  List<Car> get _filtered {
    return allCars.where((car) {
      final matchSearch = _search.isEmpty ||
          car.brand.toLowerCase().contains(_search.toLowerCase()) ||
          car.model.toLowerCase().contains(_search.toLowerCase());
      final matchBrand = _selectedBrand == null || car.brand == _selectedBrand;
      final matchCat = _selectedCategory == null || car.category == _selectedCategory;
      return matchSearch && matchBrand && matchCat;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  onChanged: (v) => setState(() => _search = v),
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Marke oder Modell suchen...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: const Color(0xFF1A1A1A),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _filterDropdown('Marke', allBrands, _selectedBrand, (v) => setState(() => _selectedBrand = v)),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _filterDropdown('Kategorie', allCategories, _selectedCategory, (v) => setState(() => _selectedCategory = v)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filtered.length,
              itemBuilder: (context, i) => _carCard(context, _filtered[i]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterDropdown(String hint, List<String> items, String? value, Function(String?) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: value,
        hint: Text(hint, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        dropdownColor: const Color(0xFF1A1A1A),
        style: const TextStyle(color: Colors.white),
        underline: const SizedBox(),
        isExpanded: true,
        items: [
          DropdownMenuItem(value: null, child: Text('Alle', style: const TextStyle(color: Colors.grey))),
          ...items.map((b) => DropdownMenuItem(value: b, child: Text(b))),
        ],
        onChanged: onChanged,
      ),
    );
  }

  Widget _carCard(BuildContext context, Car car) {
    final isSpotted = widget.spottedIds.contains(car.id);
    final rarityColors = [Colors.grey, Colors.green, Colors.blue, Colors.purple, Colors.orange];
    final rarityColor = rarityColors[car.rarityLevel - 1];

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (_) => DetailScreen(car: car, onSpotChanged: widget.onSpotChanged),
      )),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
          border: isSpotted ? Border.all(color: Colors.green.withOpacity(0.5)) : null,
        ),
        child: Row(
          children: [
            Text(car.emoji, style: const TextStyle(fontSize: 40)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(car.brand, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  Text(car.model, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: rarityColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(car.rarityLabel, style: TextStyle(color: rarityColor, fontSize: 11)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text('${car.points}', style: const TextStyle(color: Color(0xFFE8C547), fontWeight: FontWeight.bold, fontSize: 18)),
                const Text('Pkt', style: TextStyle(color: Colors.grey, fontSize: 11)),
                if (isSpotted) const Icon(Icons.check_circle, color: Colors.green, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── SAMMLUNG ──────────────────────────────────────────────
class SammlungScreen extends StatelessWidget {
  final List<String> spottedIds;
  final VoidCallback onSpotChanged;

  const SammlungScreen({super.key, required this.spottedIds, required this.onSpotChanged});

  @override
  Widget build(BuildContext context) {
    final spotted = allCars.where((c) => spottedIds.contains(c.id)).toList();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Meine Sammlung', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('${spotted.length} Autos gespottet', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            if (spotted.isEmpty)
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('🏆', style: TextStyle(fontSize: 60)),
                      SizedBox(height: 16),
                      Text('Noch leer!', style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text('Markiere Autos als gesehen\num sie hier zu sehen.',
                          textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: spotted.length,
                  itemBuilder: (context, i) {
                    final car = spotted[i];
                    return GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (_) => DetailScreen(car: car, onSpotChanged: onSpotChanged),
                      )),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.green.withOpacity(0.3)),
                        ),
                        child: Row(
                          children: [
                            Text(car.emoji, style: const TextStyle(fontSize: 36)),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(car.brand, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                                  Text(car.model, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const Icon(Icons.check_circle, color: Colors.green),
                            const SizedBox(width: 8),
                            Text('+${car.points}', style: const TextStyle(color: Color(0xFFE8C547), fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ── STATS ──────────────────────────────────────────────
class StatsScreen extends StatelessWidget {
  final List<String> spottedIds;
  final int totalPoints;

  const StatsScreen({super.key, required this.spottedIds, required this.totalPoints});

  @override
  Widget build(BuildContext context) {
    final spotted = allCars.where((c) => spottedIds.contains(c.id)).toList();
    final rarityLabels = ['Häufig', 'Gelegentlich', 'Selten', 'Sehr selten', 'Extrem selten'];
    final rarityColors = [Colors.grey, Colors.green, Colors.blue, Colors.purple, Colors.orange];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Statistiken', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              children: [
                _statCard('Punkte', '$totalPoints', const Color(0xFFE8C547)),
                const SizedBox(width: 12),
                _statCard('Gespottet', '${spottedIds.length}/${allCars.length}', Colors.blue),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Nach Seltenheit', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...List.generate(5, (i) {
              final level = i + 1;
              final total = allCars.where((c) => c.rarityLevel == level).length;
              final count = spotted.where((c) => c.rarityLevel == level).length;
              final color = rarityColors[i];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    SizedBox(width: 130, child: Text(rarityLabels[i], style: const TextStyle(color: Colors.grey))),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: total > 0 ? count / total : 0,
                          backgroundColor: color.withAlpha(50),
                          valueColor: AlwaysStoppedAnimation<Color>(color),
                          minHeight: 8,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text('$count', style: TextStyle(color: color, fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(value, style: TextStyle(color: color, fontSize: 32, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}