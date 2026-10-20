import 'package:flutter/material.dart';
import '../model/country.dart';
import '../viewmodel/fetchcountry.dart';

const Color _navy = Color(0xFF17324D);
const Color _blue = Color(0xFF3977E8);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Country>> countryFuture;
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    countryFuture = fetchCountries();
    _searchController.addListener(() {
      setState(() => _query = _searchController.text.trim().toLowerCase());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _retry() => setState(() => countryFuture = fetchCountries());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<Country>>(
          future: countryFuture,
          builder: (context, snapshot) {
            final allCountries = snapshot.data ?? const <Country>[];
            final countries = allCountries.where((country) {
              final text =
                  '${country.name} ${country.capital} ${country.region}'
                      .toLowerCase();
              return text.contains(_query);
            }).toList();

            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                color: _blue.withValues(alpha: 0.11),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Icon(
                                Icons.public_rounded,
                                color: _blue,
                                size: 27,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'COUNTRY EXPLORER',
                                    style: TextStyle(
                                      color: _blue,
                                      fontSize: 11,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    'Jelajahi dunia',
                                    style: TextStyle(
                                      color: _navy,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF3977E8), Color(0xFF244FAD)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: const Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Satu dunia, banyak cerita.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      'Temukan negara, ibu kota, dan fakta menariknya.',
                                      style: TextStyle(
                                        color: Color(0xFFE4ECFF),
                                        height: 1.4,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12),
                              Icon(
                                Icons.travel_explore_rounded,
                                color: Colors.white,
                                size: 54,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Cari negara atau ibu kota...',
                            prefixIcon: const Icon(Icons.search_rounded),
                            suffixIcon: _query.isNotEmpty
                                ? IconButton(
                                    onPressed: _searchController.clear,
                                    icon: const Icon(Icons.close_rounded),
                                  )
                                : null,
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 19),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Jelajahi negara',
                                style: TextStyle(
                                  color: _navy,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            if (snapshot.hasData)
                              Text(
                                '${countries.length} negara',
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),
                ),
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !snapshot.hasData)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 12),
                          Text('Memuat data negara...'),
                        ],
                      ),
                    ),
                  )
                else if (snapshot.hasError && !snapshot.hasData)
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: _MessageState(
                      icon: Icons.wifi_off_rounded,
                      title: 'Tidak dapat memuat data',
                      message:
                          'Periksa koneksi internet, lalu coba ambil data kembali.',
                      buttonText: 'Coba lagi',
                      onPressed: _retry,
                    ),
                  )
                else if (countries.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: _MessageState(
                      icon: Icons.search_off_rounded,
                      title: 'Negara tidak ditemukan',
                      message: 'Coba kata kunci negara atau ibu kota lainnya.',
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final country = countries[index];
                        return _CountryCard(
                          country: country,
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/detail',
                            arguments: country.alpha2Code,
                          ),
                        );
                      }, childCount: countries.length),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _CountryCard extends StatelessWidget {
  final Country country;
  final VoidCallback onTap;

  const _CountryCard({required this.country, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 11),
      color: Colors.white,
      elevation: 0.5,
      shadowColor: const Color(0x1A17324D),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
        side: const BorderSide(color: Color(0xFFE9EDF4)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(17),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: SizedBox(
                  width: 88,
                  height: 66,
                  child: country.flagImage.isNotEmpty
                      ? Image.network(
                          country.flagImage,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => _emojiFlag(country),
                        )
                      : _emojiFlag(country),
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      country.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: _navy,
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: _blue,
                          size: 15,
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            country.capital,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF1FF),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        country.region,
                        style: const TextStyle(
                          color: _blue,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: Color(0xFF9AA8BB)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _emojiFlag(Country country) {
  return Container(
    color: const Color(0xFFF0F4FA),
    alignment: Alignment.center,
    child: Text(
      country.flagEmoji.isNotEmpty ? country.flagEmoji : '🌐',
      style: const TextStyle(fontSize: 32),
    ),
  );
}

class _MessageState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? buttonText;
  final VoidCallback? onPressed;

  const _MessageState({
    required this.icon,
    required this.title,
    required this.message,
    this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: const Color(0xFF3977E8)),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(height: 7),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54, height: 1.4),
            ),
            if (buttonText != null && onPressed != null) ...[
              const SizedBox(height: 16),
              FilledButton(onPressed: onPressed, child: Text(buttonText!)),
            ],
          ],
        ),
      ),
    );
  }
}
