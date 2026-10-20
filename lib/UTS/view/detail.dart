import 'package:flutter/material.dart';
import '../model/country.dart';
import '../viewmodel/fetchcountry.dart';

const Color _navy = Color(0xFF17324D);
const Color _blue = Color(0xFF3977E8);

class Detail extends StatefulWidget {
  final String countryCode;

  const Detail({super.key, required this.countryCode});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Future<Country> countryFuture;

  @override
  void initState() {
    super.initState();
    countryFuture = fetchCountryByCode(widget.countryCode);
  }

  void _retry() {
    setState(() => countryFuture = fetchCountryByCode(widget.countryCode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Country>(
        future: countryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return _ErrorView(onRetry: _retry);
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Data negara tidak tersedia.'));
          }

          final country = snapshot.data!;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 270,
                pinned: true,
                backgroundColor: _blue,
                foregroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    country.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      shadows: [Shadow(blurRadius: 6, color: Colors.black45)],
                    ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (country.flagImage.isNotEmpty)
                        Image.network(
                          country.flagImage,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => _flagFallback(country),
                        )
                      else
                        _flagFallback(country),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black26,
                              Colors.transparent,
                              Colors.black87,
                            ],
                            stops: [0, 0.35, 1],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(18, 20, 18, 30),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Row(
                      children: [
                        Expanded(
                          child: _StatCard(
                            icon: Icons.people_alt_outlined,
                            label: 'Populasi',
                            value: _formatNumber(country.population),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _StatCard(
                            icon: Icons.landscape_outlined,
                            label: 'Luas wilayah',
                            value: country.area > 0
                                ? '${_formatNumber(country.area.round())} km²'
                                : 'Tidak tersedia',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Informasi negara',
                      style: TextStyle(
                        color: _navy,
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _InfoCard(
                      children: [
                        _InfoRow(
                          label: 'Ibu kota',
                          value: country.capital,
                          icon: Icons.location_city_rounded,
                        ),
                        _InfoRow(
                          label: 'Kawasan',
                          value: country.region,
                          icon: Icons.public_rounded,
                        ),
                        _InfoRow(
                          label: 'Subkawasan',
                          value: country.subregion,
                          icon: Icons.explore_outlined,
                        ),
                        _InfoRow(
                          label: 'Nama lokal',
                          value: country.nativeName,
                          icon: Icons.translate_rounded,
                        ),
                        _InfoRow(
                          label: 'Kode negara',
                          value: country.alpha2Code,
                          icon: Icons.tag_rounded,
                        ),
                        _InfoRow(
                          label: 'Kode ISO-3',
                          value: country.alpha3Code,
                          icon: Icons.qr_code_rounded,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Fakta lainnya',
                      style: TextStyle(
                        color: _navy,
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _InfoCard(
                      children: [
                        _InfoRow(
                          label: 'Mata uang',
                          value: _joinOrFallback(country.currencies),
                          icon: Icons.payments_outlined,
                        ),
                        _InfoRow(
                          label: 'Bahasa',
                          value: _joinOrFallback(country.languages),
                          icon: Icons.language_rounded,
                        ),
                        _InfoRow(
                          label: 'Zona waktu',
                          value: _joinOrFallback(country.timezones),
                          icon: Icons.schedule_rounded,
                        ),
                        _InfoRow(
                          label: 'Kode telepon',
                          value: _joinOrFallback(country.callingCodes, '+'),
                          icon: Icons.phone_outlined,
                        ),
                        _InfoRow(
                          label: 'Negara berbatasan',
                          value: _joinOrFallback(country.borders),
                          icon: Icons.map_outlined,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Data ditampilkan dari API countries.dev.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black45, fontSize: 12),
                    ),
                  ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFE8EDF5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: _blue, size: 23),
          const SizedBox(height: 12),
          Text(
            label,
            style: const TextStyle(color: Colors.black54, fontSize: 12),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: _navy,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final List<Widget> children;
  const _InfoCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: const Color(0xFFE8EDF5)),
      ),
      child: Column(children: children),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _InfoRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: _blue, size: 20),
          const SizedBox(width: 11),
          SizedBox(
            width: 108,
            child: Text(
              label,
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: _navy,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final VoidCallback onRetry;
  const _ErrorView({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off_rounded, color: _blue, size: 52),
            const SizedBox(height: 14),
            const Text(
              'Detail negara gagal dimuat',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pastikan perangkat terhubung ke internet, lalu coba lagi.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: const Text('Coba lagi')),
          ],
        ),
      ),
    );
  }
}

Widget _flagFallback(Country country) => Container(
  color: const Color(0xFFEAF1FF),
  alignment: Alignment.center,
  child: Text(
    country.flagEmoji.isNotEmpty ? country.flagEmoji : '🌐',
    style: const TextStyle(fontSize: 76),
  ),
);

String _joinOrFallback(List<String> values, [String prefix = '']) {
  if (values.isEmpty) return 'Tidak tersedia';
  return values.map((value) => '$prefix$value').join(', ');
}

String _formatNumber(num value) {
  final source = value.round().toString();
  final buffer = StringBuffer();
  for (var i = 0; i < source.length; i++) {
    buffer.write(source[i]);
    final remaining = source.length - i - 1;
    if (remaining > 0 && remaining % 3 == 0) buffer.write('.');
  }
  return buffer.toString();
}
