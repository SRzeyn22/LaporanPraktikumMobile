class Country {
  final String name;
  final String alpha2Code;
  final String alpha3Code;
  final String flagEmoji;
  final String flagImage;
  final String capital;
  final String region;
  final String subregion;
  final int population;
  final double area;
  final String nativeName;
  final List<String> languages;
  final List<String> currencies;
  final List<String> timezones;
  final List<String> borders;
  final List<String> callingCodes;

  const Country({
    required this.name,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.flagEmoji,
    required this.flagImage,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.population,
    required this.area,
    required this.nativeName,
    required this.languages,
    required this.currencies,
    required this.timezones,
    required this.borders,
    required this.callingCodes,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    String readString(dynamic value, [String fallback = 'Tidak tersedia']) {
      if (value == null || value.toString().trim().isEmpty) return fallback;
      return value.toString();
    }

    List<String> readNames(dynamic value, String key) {
      if (value is! List) return const [];
      return value.map((item) {
        if (item is Map) return readString(item[key], '');
        return readString(item, '');
      }).where((item) => item.isNotEmpty).toList();
    }

    final flags = json['flags'];
    final flagImage = flags is Map
        ? readString(flags['png'], '')
        : (json['flag'] is String && (json['flag'] as String).startsWith('http')
            ? json['flag'] as String
            : '');

    final capitalValue = json['capital'];
    final capital = capitalValue is List
        ? capitalValue.map((e) => e.toString()).join(', ')
        : readString(capitalValue);

    final rawPopulation = json['population'];
    final rawArea = json['area'];

    return Country(
      name: readString(json['name'], 'Nama tidak tersedia'),
      alpha2Code: readString(json['alpha2Code'], '').toUpperCase(),
      alpha3Code: readString(json['alpha3Code'], ''),
      flagEmoji: json['flag'] is String &&
              !(json['flag'] as String).startsWith('http')
          ? json['flag'] as String
          : '',
      flagImage: flagImage,
      capital: capital,
      region: readString(json['region']),
      subregion: readString(json['subregion']),
      population: rawPopulation is num
          ? rawPopulation.toInt()
          : int.tryParse('$rawPopulation') ?? 0,
      area: rawArea is num
          ? rawArea.toDouble()
          : double.tryParse('$rawArea') ?? 0,
      nativeName: readString(json['nativeName'], readString(json['name'])),
      languages: readNames(json['languages'], 'name'),
      currencies: readNames(json['currencies'], 'name'),
      timezones: readNames(json['timezones'], ''),
      borders: readNames(json['borders'], ''),
      callingCodes: readNames(json['callingCodes'], ''),
    );
  }
}
