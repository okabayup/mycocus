import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['id', 'en', 'ms'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? idText = '',
    String? enText = '',
    String? msText = '',
  }) =>
      [idText, enText, msText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // WelcomePage
  {
    'jg1zpglr': {
      'id': 'Selamat datang di',
      'en': 'Welcome to',
      'ms': 'Selamat datang ke',
    },
    'l16kjiwc': {
      'id': 'Aplikasi budidaya ikan cara santai :)',
      'en': 'Relaxing fish farming application :)',
      'ms': 'Aplikasi ternakan ikan santai :)',
    },
    'gozuijs5': {
      'id': 'Mulai!',
      'en': 'Start!',
      'ms': 'Mulakan!',
    },
    '5gflqa4c': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // HomePage
  {
    '0f0bu1ui': {
      'id': 'Hai, ',
      'en': 'Hi,',
      'ms': 'Hai,',
    },
    'ka3cvx6g': {
      'id': 'Belanja\nBahan',
      'en': 'Shopping\nMaterial',
      'ms': 'Membeli-belah\nbahan',
    },
    'qlmfky0a': {
      'id': 'Log\nAktivitas',
      'en': 'Logs\nActivity',
      'ms': 'Log\nAktiviti',
    },
    'qsgvvoy6': {
      'id': 'Asisten\nIkan',
      'en': 'Assistant\nFish',
      'ms': 'Penolong\nikan',
    },
    'cbicekxf': {
      'id': 'Pengaturan Drum',
      'en': 'Drum Settings',
      'ms': 'Tetapan Drum',
    },
    'm0dlvb7u': {
      'id': 'Tambah Drum Cocus',
      'en': 'Add Cocus Drums',
      'ms': 'Tambah Cocus Drums',
    },
    'foo1ii6v': {
      'id': 'Pakan Manual',
      'en': 'Manual Feed',
      'ms': 'Suapan Manual',
    },
    '3b9upa8h': {
      'id': 'Kuras Manual',
      'en': 'Manual Drain',
      'ms': 'Longkang Manual',
    },
    'i8eq77kv': {
      'id': '72',
      'en': '72',
      'ms': '72',
    },
    'rslpjwp6': {
      'id': 'Skor Budidaya',
      'en': 'Cultivation Score',
      'ms': 'Skor Penanaman',
    },
    'fql1riup': {
      'id': 'Berdasarkan kondisi budidaya, Ikan dalam kondisi BAIK',
      'en': 'Based on the cultivation conditions, fish are in GOOD condition',
      'ms': 'Berdasarkan keadaan penanaman, ikan berada dalam keadaan BAIK',
    },
    'mz3bacbu': {
      'id': 'Lihat Tips',
      'en': 'See Tips',
      'ms': 'Lihat Petua',
    },
    'bnw0jhr3': {
      'id': 'Metrik',
      'en': 'Metric',
      'ms': 'Metrik',
    },
    'jgvs7kuf': {
      'id': 'Estimasi jumlah\npakan',
      'en': 'Estimated quantity\nfeed',
      'ms': 'Anggaran kuantiti\nsuapan',
    },
    'tp1cq620': {
      'id': 'Kg',
      'en': 'kg',
      'ms': 'kg',
    },
    'kiaddmet': {
      'id': 'Estimasi Biomassa\nJika FCR 1.2',
      'en': 'Biomass Estimation\nIf FCR 1.2',
      'ms': 'Anggaran Biojisim\nJika FCR 1.2',
    },
    'k2t7zy3t': {
      'id': 'Demo',
      'en': 'Demos',
      'ms': 'tunjuk cara',
    },
    'vwec1mvc': {
      'id': 'kg',
      'en': 'kg',
      'ms': 'kg',
    },
    '4o54jbmo': {
      'id': 'Level Air',
      'en': 'Water Level',
      'ms': 'Paras air',
    },
    'iiwd59om': {
      'id': 'Suhu',
      'en': 'Temperature',
      'ms': 'Suhu',
    },
    '46fu2t9c': {
      'id': 'Demo',
      'en': 'Demos',
      'ms': 'tunjuk cara',
    },
    'hycxymms': {
      'id': 'pH',
      'en': 'pH',
      'ms': 'pH',
    },
    'ovpeiho9': {
      'id': 'Demo',
      'en': 'Demos',
      'ms': 'tunjuk cara',
    },
    '5z27q1jb': {
      'id': '2158',
      'en': '2158',
      'ms': '2158',
    },
    'fd42ggkc': {
      'id': ' of ',
      'en': 'of',
      'ms': 'daripada',
    },
    'o3vyeuon': {
      'id': '2850',
      'en': '2850',
      'ms': '2850',
    },
    'v354vny2': {
      'id': ' Cal',
      'en': 'Cal',
      'ms': 'Cal',
    },
    'khd0kh4y': {
      'id': 'Add more calories to your diet',
      'en': 'Add more calories to your diet',
      'ms': 'Tambah lebih banyak kalori dalam diet anda',
    },
    'v1yrotn8': {
      'id': 'Proteins: 56%',
      'en': 'Proteins: 56%',
      'ms': 'Protein: 56%',
    },
    '5z74fayh': {
      'id': 'Proteins: 142%',
      'en': 'Proteins: 142%',
      'ms': 'Protein: 142%',
    },
    '7irpzxiq': {
      'id': 'Proteins: 90%',
      'en': 'Proteins: 90%',
      'ms': 'Protein: 90%',
    },
    'iob95tfr': {
      'id': 'Proteins: 86%',
      'en': 'Proteins: 86%',
      'ms': 'Protein: 86%',
    },
    'rp0vn3u0': {
      'id': 'Komunitas Daerahmu',
      'en': 'Your Local Community',
      'ms': 'Komuniti Setempat Anda',
    },
    'wlbsb9cd': {
      'id':
          'Bergabung bersama mereka melalui Facebook, WhatsApp atau Telegram dan lebih produktif lagi!',
      'en':
          'Join them via Facebook, WhatsApp or Telegram and be even more productive!',
      'ms':
          'Sertai mereka melalui Facebook, WhatsApp atau Telegram dan menjadi lebih produktif!',
    },
    'yqcacyhg': {
      'id': 'Join',
      'en': 'Join',
      'ms': 'Sertai',
    },
    'aqeacgmj': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // MobileSignIn
  {
    'u1jlp93c': {
      'id': 'Lewati',
      'en': 'Skip',
      'ms': 'Langkau',
    },
    't5qu7f9h': {
      'id': 'Langkah ',
      'en': 'Step',
      'ms': 'Langkah',
    },
    'sul4gq86': {
      'id': '1',
      'en': '1',
      'ms': '1',
    },
    'unugx8kf': {
      'id': '/',
      'en': '/',
      'ms': '/',
    },
    '3ocdgmx3': {
      'id': '5',
      'en': '5',
      'ms': '5',
    },
    'nvwybqdh': {
      'id': 'Masuk dengan nomor telepon',
      'en': 'Sign in with a phone number',
      'ms': 'Log masuk dengan nombor telefon',
    },
    'jvk0mg1m': {
      'id': 'Mohon masukkan nomor telepon yang valid untuk verifikasi',
      'en': 'Please enter a valid phone number for verification',
      'ms': 'Sila masukkan nombor telefon yang sah untuk pengesahan',
    },
    '547cmv59': {
      'id': '+628xxxxxxxxxx',
      'en': '+628xxxxxxxxx',
      'ms': '+628xxxxxxxxx',
    },
    'eoibp6xp': {
      'id': '+628',
      'en': '+62',
      'ms': '+62',
    },
    'jlzv6xi1': {
      'id': 'Lanjutkan',
      'en': 'Continue',
      'ms': 'teruskan',
    },
    'yazd67xo': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // VerifyMobile
  {
    '962mjb8v': {
      'id': 'Skip',
      'en': 'Skip',
      'ms': 'Langkau',
    },
    'lvkf6qh9': {
      'id': 'Langkah ',
      'en': 'Step',
      'ms': 'Langkah',
    },
    'my04yx1z': {
      'id': '2',
      'en': '2',
      'ms': '2',
    },
    'wxmdazqm': {
      'id': '/',
      'en': '/',
      'ms': '/',
    },
    'ufn49a7q': {
      'id': '5',
      'en': '5',
      'ms': '5',
    },
    'blfzcgai': {
      'id': 'Verifikasi nomor telepon',
      'en': 'Phone number verification',
      'ms': 'Pengesahan nombor telefon',
    },
    '5sw0j111': {
      'id': 'Masukkan kode otp yang dikirim via SMS',
      'en': 'Enter the OTP code sent via SMS',
      'ms': 'Masukkan kod OTP yang dihantar melalui SMS',
    },
    'v3kwsr9f': {
      'id': 'Kirim saya kode baru',
      'en': 'Send me new code',
      'ms': 'Hantar saya kod baharu',
    },
    '24upwtgo': {
      'id': 'Lanjutkan',
      'en': 'Continue',
      'ms': 'teruskan',
    },
    'm5qt46t5': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // EnterPassword
  {
    'rkf8sg3c': {
      'id': 'Lewati',
      'en': 'Skip',
      'ms': 'Langkau',
    },
    '1cn93rta': {
      'id': 'Langkah',
      'en': 'Step',
      'ms': 'Langkah',
    },
    'miu0gixh': {
      'id': ' 3',
      'en': '3',
      'ms': '3',
    },
    'tjerjr4u': {
      'id': '/',
      'en': '/',
      'ms': '/',
    },
    'q2nu19nx': {
      'id': '7',
      'en': '7',
      'ms': '7',
    },
    'g9ebql0d': {
      'id': 'Buat Kata Sandi',
      'en': 'Create Password',
      'ms': 'Bina kata laluan',
    },
    'mg5bolj5': {
      'id': 'Masukkan kata sandi yang kuat untuk akunmu',
      'en': 'Enter a strong password for your account',
      'ms': 'Masukkan kata laluan yang kukuh untuk akaun anda',
    },
    'coqmgdlt': {
      'id': 'Masukkan Kata Sandi',
      'en': 'Enter Password',
      'ms': 'Masukkan kata laluan',
    },
    '9fga187d': {
      'id': 'Lanjutkan',
      'en': 'Continue',
      'ms': 'teruskan',
    },
    'rn44qoro': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // EnableFingerprint
  {
    'lwf3bfep': {
      'id': 'Lewati',
      'en': 'Skip',
      'ms': 'Langkau',
    },
    'qte2s6l0': {
      'id': 'STEP ',
      'en': 'STEP',
      'ms': 'LANGKAH',
    },
    'hdkbxu0k': {
      'id': '3',
      'en': '3',
      'ms': '3',
    },
    'ajm5tcm4': {
      'id': '/',
      'en': '/',
      'ms': '/',
    },
    '4nfxs1em': {
      'id': '5',
      'en': '5',
      'ms': '5',
    },
    'kilp0czt': {
      'id': 'Aktifkan Masuk dengan Sidik Jari',
      'en': 'Enable Fingerprint Sign In',
      'ms': 'Dayakan Log Masuk Cap Jari',
    },
    '8cx7u94n': {
      'id':
          'Jika kamu mengaktifkan masuk dengan sidik jari, tidak perlu memasukkan kata sandi ketika login',
      'en':
          'If you enable fingerprint login, there is no need to enter a password when logging in',
      'ms':
          'Jika anda mendayakan log masuk cap jari, anda tidak perlu memasukkan kata laluan semasa log masuk',
    },
    'n1czpx3p': {
      'id': 'Aktivasi',
      'en': 'Activation',
      'ms': 'Pengaktifan',
    },
    '5qmfmbr3': {
      'id': 'Mohon autentikasi untuk masuk cepat',
      'en': 'Please authenticate for fast login',
      'ms': 'Sila sahkan untuk log masuk pantas',
    },
    'n2nen9aj': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // TurnOnNotification
  {
    'ynhgg2zn': {
      'id': 'Lewati',
      'en': 'Skip',
      'ms': 'Langkau',
    },
    'tjyfeyey': {
      'id': 'Langkah ',
      'en': 'Step',
      'ms': 'Langkah',
    },
    '9b8tmpi7': {
      'id': '4',
      'en': '4',
      'ms': '4',
    },
    '3vcatkeu': {
      'id': '/',
      'en': '/',
      'ms': '/',
    },
    '5z4gk3d5': {
      'id': '5',
      'en': '5',
      'ms': '5',
    },
    'e6guplw2': {
      'id': 'Aktifkan notifikasi',
      'en': 'Turn on notifications',
      'ms': 'Hidupkan pemberitahuan',
    },
    'rdzgja1k': {
      'id': 'Notifikasi terkait perangkat',
      'en': 'Device related notifications',
      'ms': 'Pemberitahuan berkaitan peranti',
    },
    'bktz49te': {
      'id': 'Tips Budidaya dengan Cocus',
      'en': 'Cultivation Tips with Cocus',
      'ms': 'Petua Penanaman dengan Cocus',
    },
    'znr2lkev': {
      'id': 'Tawaran menarik lainnya',
      'en': 'Another interesting offer',
      'ms': 'Satu lagi tawaran menarik',
    },
    'gqtfuto3': {
      'id': 'Ijinkan',
      'en': 'Allow',
      'ms': 'benarkan',
    },
    'amf0tu0a': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // ProfilePicture
  {
    'zhanmtmg': {
      'id': 'Lewati',
      'en': 'Skip',
      'ms': 'Langkau',
    },
    'dbvkqvuo': {
      'id': 'Langkah ',
      'en': 'Step',
      'ms': 'Langkah',
    },
    '3o0fa8xp': {
      'id': '5',
      'en': '5',
      'ms': '5',
    },
    '5q1gbzpn': {
      'id': '/',
      'en': '/',
      'ms': '/',
    },
    'hs5jp39i': {
      'id': '5',
      'en': '5',
      'ms': '5',
    },
    'jpcv1sle': {
      'id': 'Gambar Profil',
      'en': 'Profile Picture',
      'ms': 'Gambar profil',
    },
    'nbjnyjly': {
      'id': 'Unggah Foto',
      'en': 'Upload Photos',
      'ms': 'Muatnaik gambar',
    },
    'jp7t6m3w': {
      'id': 'Lanjutkan',
      'en': 'Continue',
      'ms': 'teruskan',
    },
    '5z50x6zn': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // UserInterest
  {
    '94dkdhp3': {
      'id': 'Lewati',
      'en': 'Skip',
      'ms': 'Langkau',
    },
    '4oai708f': {
      'id': 'Langkah ',
      'en': 'Step',
      'ms': 'Langkah',
    },
    'df5j92xs': {
      'id': '7',
      'en': '7',
      'ms': '7',
    },
    'chcuzxdb': {
      'id': '/',
      'en': '/',
      'ms': '/',
    },
    'oclyt661': {
      'id': '7',
      'en': '7',
      'ms': '7',
    },
    'abv6nz7w': {
      'id': 'Apa tujuan anda budidaya ikan dengan Cocus?',
      'en': 'What is your goal of cultivating fish with Cocus?',
      'ms': 'Apakah matlamat anda untuk menanam ikan dengan Cocus?',
    },
    'h7zftx3c': {
      'id': 'Hobi',
      'en': 'Hobby',
      'ms': 'hobi',
    },
    'k3z4luib': {
      'id': 'Saya senang memelihara ikan...',
      'en': 'I love keeping fish...',
      'ms': 'Saya suka memelihara ikan...',
    },
    'xmzjayvp': {
      'id': 'Hasil Panen Dijual',
      'en': 'Harvest for sale',
      'ms': 'Tuai untuk dijual',
    },
    'm5bz48h7': {
      'id': 'Saya ingin memperoleh pendapatan...',
      'en': 'I want to earn...',
      'ms': 'Saya ingin menjana pendapatan...',
    },
    '0893yt06': {
      'id': 'Konsumsi Sendiri',
      'en': 'Self Consumption',
      'ms': 'Penggunaan Sendiri',
    },
    'qaaqcdrt': {
      'id': 'Saya ingin konsumsi sendiri hasil panen...',
      'en': 'I want to consume my own harvest...',
      'ms': 'Saya ingin memakan hasil tuaian saya sendiri...',
    },
    'fugg43u9': {
      'id': 'Ikan apa yang ingin anda budidayakan?',
      'en': 'What fish do you want to cultivate?',
      'ms': 'Apakah ikan yang anda ingin tanam?',
    },
    'lywodjio': {
      'id': 'Lele',
      'en': 'Catfish',
      'ms': 'ikan keli',
    },
    'l0evomz2': {
      'id': 'Gabus',
      'en': 'Cork',
      'ms': 'gabus',
    },
    'ib8a2rfa': {
      'id': 'Lainnya',
      'en': 'Other',
      'ms': 'Lain-lain',
    },
    'ck2elhkw': {
      'id': 'Lanjutkan',
      'en': 'Continue',
      'ms': 'teruskan',
    },
    '2obi5mdm': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // GetStarted
  {
    've6say7n': {
      'id': 'Kamu sudah siap!',
      'en': 'Are you ready!',
      'ms': 'Adakah anda bersedia!',
    },
    'iw0ajqr3': {
      'id':
          'Terimakasih telah meluangkan waktu untuk personalisasi akunmu. Sekarang waktu yang ditunggu-tunggu!',
      'en':
          'Thank you for taking the time to personalize your account. Now the long awaited time!',
      'ms':
          'Terima kasih kerana meluangkan masa untuk memperibadikan akaun anda. Kini masa yang ditunggu-tunggu!',
    },
    'c9oeph7u': {
      'id': 'Nama Lengkap...',
      'en': 'Full name...',
      'ms': 'Nama penuh...',
    },
    'iymbu547': {
      'id': 'Banyuwangi',
      'en': 'Banyuwangi',
      'ms': 'Banyuwangi',
    },
    '09xkllze': {
      'id': 'Pilih Kota',
      'en': 'Select City',
      'ms': 'Pilih Bandar',
    },
    '2r61z9l6': {
      'id': 'Cari Kota...',
      'en': 'Search City...',
      'ms': 'Cari Bandar...',
    },
    'fna8gb2c': {
      'id': 'Mulai Budidaya',
      'en': 'Start Cultivation',
      'ms': 'Mulakan Penanaman',
    },
    'djxum4bq': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // DrumLog
  {
    'tdf52axt': {
      'id': 'Otomatis',
      'en': '',
      'ms': '',
    },
    'twc54bnl': {
      'id': 'Manual',
      'en': '',
      'ms': '',
    },
    'ag55vw48': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // ProfilePage
  {
    'iz5t2not': {
      'id': 'Edit',
      'en': 'Edit',
      'ms': 'Sunting',
    },
    '9mnjvhuo': {
      'id': 'STEPS',
      'en': 'STEPS',
      'ms': 'LANGKAH-LANGKAH',
    },
    'dno49vcu': {
      'id': '9,890',
      'en': '9,890',
      'ms': '9,890',
    },
    'r83x9cgi': {
      'id': 'last update 3m',
      'en': 'last update 3m',
      'ms': 'kemas kini terakhir 3m',
    },
    'koces4cm': {
      'id': 'WEIGHT',
      'en': 'WEIGHT',
      'ms': 'BERAT BADAN',
    },
    'uujbdpzr': {
      'id': 'Demo',
      'en': 'Demos',
      'ms': 'tunjuk cara',
    },
    '2r7cpg8p': {
      'id': '58',
      'en': '58',
      'ms': '58',
    },
    'uqvajhh1': {
      'id': 'kg',
      'en': 'kg',
      'ms': 'kg',
    },
    'ny8j7c0t': {
      'id': 'last update 3m',
      'en': 'last update 3m',
      'ms': 'kemas kini terakhir 3m',
    },
    'i6hc9huo': {
      'id': 'WEIGHT',
      'en': 'WEIGHT',
      'ms': 'BERAT BADAN',
    },
    'o0070ohd': {
      'id': '58',
      'en': '58',
      'ms': '58',
    },
    'iawxqkhq': {
      'id': 'kg',
      'en': 'kg',
      'ms': 'kg',
    },
    'h84p6tu2': {
      'id': 'AGE',
      'en': 'AGE',
      'ms': 'UMUR',
    },
    '1o6tt4w4': {
      'id': '23',
      'en': '23',
      'ms': '23',
    },
    'jlkd098n': {
      'id': 'yo',
      'en': 'yo',
      'ms': 'yo',
    },
    'z8baidxj': {
      'id': 'CURRENT',
      'en': 'CURRENT',
      'ms': 'SEMASA',
    },
    'etg7age4': {
      'id': '176',
      'en': '176',
      'ms': '176',
    },
    'wcy6e30e': {
      'id': 'cm',
      'en': 'cm',
      'ms': 'cm',
    },
    'neydht10': {
      'id': 'COCUS PREMIUM',
      'en': 'GO PREMIUM',
      'ms': 'PERGI PREMIUM',
    },
    'q0pe4u3a': {
      'id': 'Buka Semua Fitur Untuk Maksimalkan Budidayamu!',
      'en': 'Unlock All Features To Maximize Your Cultivation!',
      'ms': 'Buka Kunci Semua Ciri Untuk Memaksimumkan Penanaman Anda!',
    },
    'psevqh44': {
      'id': 'Rp5 ribu/bulan',
      'en': 'IDR 12 thousand/year',
      'ms': 'IDR 12 ribu/tahun',
    },
    '9w9nruwx': {
      'id': 'Langganan',
      'en': 'Subscriber',
      'ms': 'pelanggan',
    },
    'vq3pwxp4': {
      'id': 'Keluar Akun',
      'en': 'Account Sign Out',
      'ms': 'Log Keluar Akaun',
    },
    '4so6bfsn': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // DetailProduk
  {
    'k69cyvw5': {
      'id': '1',
      'en': '1',
      'ms': '1',
    },
    'okzcfscp': {
      'id': 'Serving (200 g)',
      'en': 'Serving (200 g)',
      'ms': 'Hidangan (200 g)',
    },
    '0ce34p0w': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // Subscription
  {
    'seulworz': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // setting_drum
  {
    'fuk57k6n': {
      'id': 'Lama Pakam (ms)',
      'en': 'Feed given (%)',
      'ms': 'Suapan diberi (%)',
    },
    'lap4q1an': {
      'id': 'Jam Pakan 1',
      'en': 'Feeding Hours 1',
      'ms': 'Waktu Pemakanan 1',
    },
    'fxfkhy8c': {
      'id': 'Jam Pakan 2',
      'en': 'Feeding Hours 2',
      'ms': 'Waktu Pemakanan 2',
    },
    'c8ffa2j0': {
      'id': 'Jam Pakan 3',
      'en': 'Feeding Hours 3',
      'ms': 'Waktu Pemakanan 3',
    },
    'oana7b07': {
      'id': 'Jam Ganti Air',
      'en': 'Water Change Hours',
      'ms': 'Waktu Tukar Air',
    },
    'wewvd8ec': {
      'id': 'Persen Ganti Air (%)',
      'en': 'Water Change Percent (%)',
      'ms': 'Peratus Perubahan Air (%)',
    },
    '3wrf6052': {
      'id': 'Hari Ganti Air',
      'en': 'Water Change Day',
      'ms': 'Hari Tukar Air',
    },
    'ymw6dghz': {
      'id': 'Senin',
      'en': 'Monday',
      'ms': 'Isnin',
    },
    '06hgyl6n': {
      'id': 'Selasa',
      'en': 'Tuesday',
      'ms': 'Selasa',
    },
    'lznv20rt': {
      'id': 'Rabu',
      'en': 'Wednesday',
      'ms': 'Rabu',
    },
    '24b6v0vp': {
      'id': 'Kamis',
      'en': 'Thursday',
      'ms': 'Khamis',
    },
    'uvob08yw': {
      'id': 'Jumat',
      'en': 'Friday',
      'ms': 'Jumaat',
    },
    'xt5pd3mk': {
      'id': 'Sabtu',
      'en': 'Saturday',
      'ms': 'Sabtu',
    },
    'dc53i9mo': {
      'id': 'Minggu',
      'en': 'Sunday',
      'ms': 'Ahad',
    },
    'vgf19yom': {
      'id': 'Setiap Hari',
      'en': 'Every day',
      'ms': 'Setiap hari',
    },
    'o2z28r70': {
      'id': 'Pilih hari',
      'en': 'Choose a day',
      'ms': 'Pilih satu hari',
    },
    'bzgkwvak': {
      'id': 'Search for an item...',
      'en': 'Search for an item...',
      'ms': 'Cari item...',
    },
    'bggyrzxn': {
      'id': 'Siklus tanggal',
      'en': 'Date cycle',
      'ms': 'Kitaran tarikh',
    },
    'erxapkrq': {
      'id': 'Ikan',
      'en': 'Fish',
      'ms': 'ikan',
    },
    'g6cs45n8': {
      'id': ':',
      'en': ':',
      'ms': ':',
    },
    'qdygko23': {
      'id': 'Berat Tebar',
      'en': 'Spread Weight',
      'ms': 'Spread Berat',
    },
    'xsu0ov15': {
      'id': ':',
      'en': ':',
      'ms': ':',
    },
    'y2ryfcyc': {
      'id': 'Berat Panen',
      'en': 'Harvest Weight',
      'ms': 'Berat Tuai',
    },
    'laro3ouz': {
      'id': ':',
      'en': ':',
      'ms': ':',
    },
    '3s6upmmc': {
      'id': 'Tanggal Panen',
      'en': 'Harvest Date',
      'ms': 'Tarikh Menuai',
    },
    '3rezc1ch': {
      'id': ':',
      'en': ':',
      'ms': ':',
    },
    'cm3i5wi7': {
      'id': 'Waktu Buddaya',
      'en': 'Culture Time',
      'ms': 'Masa Budaya',
    },
    '2bpvogi7': {
      'id': ':',
      'en': ':',
      'ms': ':',
    },
    'mn38ym2k': {
      'id': 'Siklus ke',
      'en': 'cycle to',
      'ms': 'kitaran ke',
    },
    'e1qd68pm': {
      'id': ':',
      'en': ':',
      'ms': ':',
    },
    'za73nqa3': {
      'id': 'Riwayat',
      'en': 'History',
      'ms': 'Sejarah',
    },
    'km890g85': {
      'id': 'Ganti Siklus',
      'en': 'Switch Cycle',
      'ms': 'Kitaran Tukar',
    },
    'j6iphuua': {
      'id': 'Simpan Pengaturan',
      'en': 'Save Settings',
      'ms': 'Simpan Tetapan',
    },
    '3zagbahe': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // belanjaBahan
  {
    'f9om3206': {
      'id': 'Cari Bahan...',
      'en': 'Search Material...',
      'ms': 'Bahan Carian...',
    },
    'tlrdbmdr': {
      'id': 'Semua',
      'en': 'All',
      'ms': 'Semua',
    },
    'okuyc63c': {
      'id': '5.0',
      'en': '5.0',
      'ms': '5.0',
    },
    'bhky9ol7': {
      'id': 'Bibit',
      'en': 'Seeds',
      'ms': 'Biji benih',
    },
    'mpuqcg8i': {
      'id': '5.0',
      'en': '5.0',
      'ms': '5.0',
    },
    'jvs8xkfr': {
      'id': 'Pakan',
      'en': 'Feed',
      'ms': 'suapan',
    },
    't8lzhp21': {
      'id': '5.0',
      'en': '5.0',
      'ms': '5.0',
    },
    'jbkncvak': {
      'id': 'Paket',
      'en': 'Package',
      'ms': 'Pakej',
    },
    'l7elbury': {
      'id': '5.0',
      'en': '5.0',
      'ms': '5.0',
    },
    'do6py7rw': {
      'id': 'Cocus',
      'en': 'Cocus',
      'ms': 'Cocus',
    },
    'tblj1ize': {
      'id': '5.0',
      'en': '5.0',
      'ms': '5.0',
    },
    '92irpcu6': {
      'id': 'Urutkan',
      'en': 'sort',
      'ms': 'menyusun',
    },
    'we2902oe': {
      'id': 'Terbaru',
      'en': 'Latest',
      'ms': 'Terkini',
    },
    'yab5eyi1': {
      'id': 'Terdekat',
      'en': 'Nearby',
      'ms': 'Berdekatan',
    },
    'lv85imfe': {
      'id': 'Termurah',
      'en': 'Cheapest',
      'ms': 'termurah',
    },
    '543r3bjh': {
      'id': 'Termahal',
      'en': 'Most expensive',
      'ms': 'Yang paling mahal',
    },
    'yhivbxbn': {
      'id': 'Terpopuler',
      'en': 'Most popular',
      'ms': 'Paling popular',
    },
    'z28ut1y6': {
      'id': 'Rentang Harga',
      'en': 'Price Range',
      'ms': 'Julat harga',
    },
    'pifsv13m': {
      'id': 'Minimal',
      'en': 'At a minimum',
      'ms': 'Sekurang-kurangnya',
    },
    'w6bbsp5s': {
      'id': 'Maksimal',
      'en': 'Maximum',
      'ms': 'maksimum',
    },
    '2966ozx3': {
      'id': 'Filter',
      'en': 'Filter',
      'ms': 'Penapis',
    },
    'vsm4yca5': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // tambahDrum
  {
    '7kgesznf': {
      'id': 'Anda Yakin Ingin Menambah Drum Cocus?',
      'en': 'Are You Sure You Want To Add Cocus Drums?',
      'ms': 'Adakah Anda Pasti Ingin Menambah Gendang Cocus?',
    },
    'o7wq1aux': {
      'id':
          'Catatan : Drum tidak bisa ditambahkan untuk 2 akun, mohon hapus drum dari akun sebelumnya jika ingin migrasi akun atau kepemilikan.',
      'en':
          'Note: Drums cannot be added for 2 accounts, please delete drums from the previous account if you want to migrate accounts or ownership.',
      'ms':
          'Nota: Drum tidak boleh ditambah untuk 2 akaun, sila padamkan drum daripada akaun sebelumnya jika anda ingin memindahkan akaun atau pemilikan.',
    },
    'akj1ftcm': {
      'id': 'Yakin',
      'en': 'Certain',
      'ms': 'pasti',
    },
    'vjhqi54r': {
      'id': 'Batal',
      'en': 'Cancelled',
      'ms': 'Dibatalkan',
    },
    '7iyput6w': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // halamaPindaiQR
  {
    '47yxfkoh': {
      'id': 'Pindai QR Drum',
      'en': 'Scan QR Drums',
      'ms': 'Imbas Gendang QR',
    },
    '3nv5hrx6': {
      'id':
          'Untuk menambahkan drum, anda perlu memindai QR yang ada pada sertifikat kepemilikan drum. Pastikan untuk mengizinkan aplikasi mengakses kamera.',
      'en':
          'To add a drum, you need to scan the QR on the drum ownership certificate. Be sure to allow the app to access the camera.',
      'ms':
          'Untuk menambah dram, anda perlu mengimbas QR pada sijil pemilikan dram. Pastikan anda membenarkan apl mengakses kamera.',
    },
    'su05439x': {
      'id': 'Pindai',
      'en': 'Scan',
      'ms': 'Imbas',
    },
    'jp4mz89h': {
      'id': 'Cancel',
      'en': 'Cancel',
      'ms': 'Batal',
    },
  },
  // riwayatSetting
  {
    'biw4dodj': {
      'id': 'Riwayat Pengaturan',
      'en': 'Settings History',
      'ms': 'Sejarah Tetapan',
    },
    's8r21bii': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // prediksiPenyakit
  {
    '0lbmq9l7': {
      'id': 'Penyakit',
      'en': 'Disease',
      'ms': 'penyakit',
    },
    'lh1uzcwf': {
      'id': 'Nama Penyakit',
      'en': 'Disease Name',
      'ms': 'Nama Penyakit',
    },
    'b6mfe8br': {
      'id': 'Akurasi',
      'en': 'accuracy',
      'ms': 'ketepatan',
    },
    'v65ot5ia': {
      'id': '50%',
      'en': '50%',
      'ms': '50%',
    },
    'kjygvol9': {
      'id': 'Ambil/Unggah Gambar',
      'en': 'Take/Upload Pictures',
      'ms': 'Ambil/Muat Naik Gambar',
    },
    'eo4jcjsm': {
      'id': 'Prediksi Penyakit AI',
      'en': 'AI Disease Prediction',
      'ms': 'Ramalan Penyakit AI',
    },
    'x0bf2vbr': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // AIChat
  {
    't06esf74': {
      'id': 'Ketik Sesuatu',
      'en': 'Type Something',
      'ms': 'Taip Sesuatu',
    },
    'csqn1j9m': {
      'id': 'Asisten Ikan Chat',
      'en': 'Chat Fish Assistant',
      'ms': 'Pembantu Ikan Sembang',
    },
    'x73am7sf': {
      'id': 'Home',
      'en': 'home',
      'ms': 'rumah',
    },
  },
  // belumAdaDrumDitambahkan
  {
    '15juqk6j': {
      'id': 'Belum Ada\nDrum Ditambahkan',
      'en': 'There isn\'t any yet\nDrums Added',
      'ms': 'belum ada lagi\nDram Ditambah',
    },
  },
  // ganti_siklus
  {
    'vrsrnan0': {
      'id': 'Ganti Siklus',
      'en': 'Switch Cycle',
      'ms': 'Kitaran Tukar',
    },
    'ca5xgn7n': {
      'id': 'Berat Tebar (g)',
      'en': 'Spreading Weight (g)',
      'ms': 'Berat Hamparan (g)',
    },
    '1co7ko33': {
      'id': 'Target Panen (g)',
      'en': 'Harvest Target (g)',
      'ms': 'Sasaran Tuai (g)',
    },
    'snhp5gdq': {
      'id': 'Ikan',
      'en': 'Fish',
      'ms': 'ikan',
    },
    'vcemtky3': {
      'id': 'Lele',
      'en': 'Catfish',
      'ms': 'ikan keli',
    },
    '0v6we822': {
      'id': 'Lele',
      'en': 'Catfish',
      'ms': 'ikan keli',
    },
    '2lr4izbb': {
      'id': 'Nila',
      'en': 'Indigo',
      'ms': 'nila',
    },
    'rfptqv4u': {
      'id': 'Gabus',
      'en': 'Cork',
      'ms': 'gabus',
    },
    '6gguw37u': {
      'id': 'Mujahir',
      'en': 'Mujahir',
      'ms': 'Mujahir',
    },
    'bciegh9r': {
      'id': 'Gurame',
      'en': 'carp',
      'ms': 'karp',
    },
    'e9mrg26x': {
      'id': 'Pilih',
      'en': 'Choose',
      'ms': 'pilih',
    },
    'lan9cw8z': {
      'id': 'Cari',
      'en': 'Search',
      'ms': 'Cari',
    },
    'ubxzjtwb': {
      'id': 'Tanggal Tebar',
      'en': 'Spread Date',
      'ms': 'Tarikh Sebaran',
    },
    'tx6amjr5': {
      'id': 'Tanggal Panen',
      'en': 'Harvest Date',
      'ms': 'Tarikh Menuai',
    },
    '6eb5x1ji': {
      'id': 'Jumlah Waktu',
      'en': 'Total Time',
      'ms': 'Jumlah masa',
    },
    'p8e9knmb': {
      'id': 'Simpan',
      'en': 'Save',
      'ms': 'Jimat',
    },
  },
  // pakanSekarang
  {
    'gb7rnuj9': {
      'id': 'Beri Pakan Sekarang',
      'en': 'Feed Now',
      'ms': 'Suap Sekarang',
    },
    'vy7v98pc': {
      'id': 'Lama Pakan (ms)',
      'en': 'Feeding Time (ms)',
      'ms': 'Masa Makan (ms)',
    },
    'irtkovhg': {
      'id': 'Beri Pakan',
      'en': 'Feed',
      'ms': 'suapan',
    },
  },
  // kurasSekarang
  {
    'k16hlmjr': {
      'id': 'Ganti Air Sekarang',
      'en': 'Change Water Now',
      'ms': 'Tukar Air Sekarang',
    },
    '7hzxq8wi': {
      'id':
          'tekan tombol dibawah untuk kuras dan tekan lagi untuk mengisi air.',
      'en': 'Will be executed 1 minute or more after the request.',
      'ms': 'Akan dilaksanakan 1 minit atau lebih selepas permintaan.',
    },
  },
  // paywall
  {
    '8vefukhx': {
      'id': 'COCUS PREMIUM',
      'en': 'GO PREMIUM',
      'ms': 'PERGI PREMIUM',
    },
    '5gs7r1nd': {
      'id': 'Dapatkan Akses Premium',
      'en': 'Get Unlimited Access',
      'ms': 'Dapatkan Akses Tanpa Had',
    },
    'ph18bkk4': {
      'id': 'Peringatan jumlah pakan',
      'en': 'Access to hundreds of guided lessons and science backup programs',
      'ms':
          'Akses kepada beratus-ratus pelajaran berpandu dan program sandaran sains',
    },
    'k142pvjg': {
      'id': '5x deteksi penyakit/bulan',
      'en': 'Learn to manage feelings and thoughts with everyday mindfulness',
      'ms':
          'Belajar mengurus perasaan dan fikiran dengan kesedaran setiap hari',
    },
    'r7bord4i': {
      'id': '10x chat Asisten/bulan',
      'en': 'Learn to manage feelings and thoughts with everyday mindfulness',
      'ms':
          'Belajar mengurus perasaan dan fikiran dengan kesedaran setiap hari',
    },
    '8w4fi2b9': {
      'id': 'per bulan',
      'en': '\$4.99/month, billed annually \$60',
      'ms': '\$4.99/bulan, dibilkan setiap tahun \$60',
    },
    '9rnwwsmf': {
      'id': 'per tahun',
      'en': '\$4.99/month, billed annually \$60',
      'ms': '\$4.99/bulan, dibilkan setiap tahun \$60',
    },
  },
  // Miscellaneous
  {
    '7rm99r5q': {
      'id': '',
      'en': '',
      'ms': '',
    },
    '7h70ug4g': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'lrx4lq27': {
      'id': '',
      'en': '',
      'ms': '',
    },
    '5ye057qu': {
      'id': '',
      'en': '',
      'ms': '',
    },
    '0mhjb00e': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'xr7lux1i': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'm7ogfrqi': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'cmhpy0jt': {
      'id': '',
      'en': '',
      'ms': '',
    },
    '7xwfs13t': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'gxu5y9fe': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'byhqgnxl': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'n0jb3hjn': {
      'id': '',
      'en': '',
      'ms': '',
    },
    '3c73gqkz': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'dqcd3shi': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'k1f4tn81': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'gers6jaq': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'jt5geiwq': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'i2yica1q': {
      'id': '',
      'en': '',
      'ms': '',
    },
    '1ngayasw': {
      'id': '',
      'en': '',
      'ms': '',
    },
    '1w5o3zul': {
      'id': '',
      'en': '',
      'ms': '',
    },
    '127932ik': {
      'id': '',
      'en': '',
      'ms': '',
    },
    '3kpnvp7q': {
      'id': '',
      'en': '',
      'ms': '',
    },
    '5cgr3ubd': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'lp62t2h1': {
      'id': '',
      'en': '',
      'ms': '',
    },
    '1bzr40rv': {
      'id': '',
      'en': '',
      'ms': '',
    },
    '40zvtshj': {
      'id': '',
      'en': '',
      'ms': '',
    },
    'urphqg0b': {
      'id': '',
      'en': '',
      'ms': '',
    },
  },
].reduce((a, b) => a..addAll(b));
