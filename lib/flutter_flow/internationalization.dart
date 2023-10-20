import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'si'];

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
    String? enText = '',
    String? siText = '',
  }) =>
      [enText, siText][languageIndex] ?? '';

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
  // login
  {
    'iwuz9bak': {
      'en': 'VetCare',
      'si': '',
    },
    'i84ec41l': {
      'en': 'Welcome Back,',
      'si': '',
    },
    'kgz92ow8': {
      'en': 'Access your account below or',
      'si': '',
    },
    '8tdo6t1y': {
      'en': 'Create Account',
      'si': '',
    },
    'yhr68z3l': {
      'en': 'Your email...',
      'si': '',
    },
    '7ddisqdi': {
      'en': 'Password',
      'si': '',
    },
    'ywjpxh6y': {
      'en': 'Forgot Password?',
      'si': '',
    },
    'gqqma7g5': {
      'en': 'Login',
      'si': '',
    },
    '4icsh38x': {
      'en': 'Home',
      'si': '',
    },
  },
  // createAccount
  {
    'aomsxjrs': {
      'en': 'Welcome,',
      'si': '',
    },
    'f65in5k5': {
      'en': 'Create your account below, or',
      'si': '',
    },
    '07a9ekz5': {
      'en': 'Login',
      'si': '',
    },
    'ojfazv8f': {
      'en': 'Your email...',
      'si': '',
    },
    '7x9v6e4u': {
      'en': 'Password',
      'si': '',
    },
    'kweriktp': {
      'en': 'Create Account',
      'si': '',
    },
    'hy09b07q': {
      'en': 'Home',
      'si': '',
    },
  },
  // createYourProfile
  {
    'iqp9zewa': {
      'en': 'Your Profile',
      'si': '',
    },
    'j4w0pw57': {
      'en': '2/2',
      'si': '',
    },
    '2vqpqpon': {
      'en':
          'Fill out your profile now in order to complete setup of your profile.',
      'si': '',
    },
    '7g8uk7sa': {
      'en': 'Your Name',
      'si': '',
    },
    'zz77fdb7': {
      'en': 'UserName',
      'si': '',
    },
    'rnwx9v79': {
      'en': '@',
      'si': '',
    },
    'alau2r2i': {
      'en': 'Your Bio',
      'si': '',
    },
    'xxmmfzhk': {
      'en': 'Complete Setup',
      'si': '',
    },
    'f4sztdw1': {
      'en': 'Home',
      'si': '',
    },
  },
  // forgotPassword
  {
    'vm93tcvg': {
      'en': 'Forgot Password',
      'si': '',
    },
    '7vn0avjg': {
      'en': 'Enter your email',
      'si': '',
    },
    '4iqnqqms': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
      'si': '',
    },
    'tn2o7l12': {
      'en': 'Send Reset Link',
      'si': '',
    },
    'za5mgkjl': {
      'en': 'Home',
      'si': '',
    },
  },
  // editSettings
  {
    '3hk27u7a': {
      'en': 'Switch to Dark Mode',
      'si': '',
    },
    'n2ikqw5e': {
      'en': 'Switch to Light Mode',
      'si': '',
    },
    'sj9vcg7f': {
      'en': 'Account Settings',
      'si': '',
    },
    'f8nvzaat': {
      'en': 'Edit Profile',
      'si': '',
    },
    '9fx8mo3j': {
      'en': 'Change Password',
      'si': '',
    },
    'w086rk5x': {
      'en': 'Log Out',
      'si': '',
    },
    '18u7dxe5': {
      'en': 'Settings',
      'si': '',
    },
    'fvodtpzz': {
      'en': 'Settings',
      'si': '',
    },
  },
  // editUserProfile
  {
    'tn7ddkol': {
      'en': 'Your Profile',
      'si': '',
    },
    'psxlze8i': {
      'en':
          'Fill out your profile now in order to complete setup of your profile.',
      'si': '',
    },
    'pxbruanw': {
      'en': 'Your Name',
      'si': '',
    },
    '0isqp0ax': {
      'en': 'UserName',
      'si': '',
    },
    'kjm928o6': {
      'en': 'Your Bio',
      'si': '',
    },
    'yzqxvvu0': {
      'en': 'Save Changes',
      'si': '',
    },
    'sp4swaz5': {
      'en': 'Home',
      'si': '',
    },
  },
  // changePassword
  {
    '9r3xsmts': {
      'en': 'Change Password',
      'si': '',
    },
    '4gigza0o': {
      'en': 'Enter your email',
      'si': '',
    },
    'hgeo06rc': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account above.',
      'si': '',
    },
    '0753a6i3': {
      'en': 'Send Reset Link',
      'si': '',
    },
    '52wg1c4o': {
      'en': 'Home',
      'si': '',
    },
  },
  // chatPage
  {
    'qp1zheoi': {
      'en': 'Group Chat',
      'si': '',
    },
    'un1olygc': {
      'en': 'Home',
      'si': '',
    },
  },
  // allChatsPage
  {
    'l5fw3ryh': {
      'en': 'Messages',
      'si': '',
    },
    'nf53v8zt': {
      'en': 'Chats',
      'si': '',
    },
  },
  // addChatUsers
  {
    'bvz2el3n': {
      'en': 'Add Friends to chat',
      'si': '',
    },
    'roevnj19': {
      'en': 'Select the friends to add to chat.',
      'si': '',
    },
    'ogacpl9r': {
      'en': 'Search for friends...',
      'si': '',
    },
    '6khfms91': {
      'en': 'Invite to Chat',
      'si': '',
    },
    'ebolxezl': {
      'en': 'Home',
      'si': '',
    },
  },
  // createGroupChat
  {
    'r3tz1kr8': {
      'en': 'Create Group Chat',
      'si': '',
    },
    'duin1edh': {
      'en': 'Select the friends to add to chat.',
      'si': '',
    },
    'd2765p9v': {
      'en': 'Search for friends...',
      'si': '',
    },
    'qt36i5nl': {
      'en': 'Create Chat',
      'si': '',
    },
    '5ca0q4dd': {
      'en': 'Home',
      'si': '',
    },
  },
  // vetdashboard
  {
    'cgothh6q': {
      'en': 'Hi there 👋  Welcome to VetCare! 🐶',
      'si': '',
    },
    '37f7qtdr': {
      'en': 'Pets Count',
      'si': '',
    },
    'csea5x4p': {
      'en': '24',
      'si': '',
    },
    'ygqdtena': {
      'en': 'Vets Count',
      'si': '',
    },
    'nhqj5e3w': {
      'en': '3,200',
      'si': '',
    },
    'qmkt9lzd': {
      'en': 'Pets',
      'si': '',
    },
  },
  // VetSinglePet
  {
    'l2b7wmit': {
      'en': 'Dogee',
      'si': '',
    },
    '6by5kepw': {
      'en': 'Pet Details',
      'si': '',
    },
    '742abv82': {
      'en': 'BullDog',
      'si': '',
    },
    's8qjggvc': {
      'en': '123 Main St, City, State',
      'si': '',
    },
    'cm3rkviq': {
      'en': 'Last Appointment: 01/01/2022',
      'si': '',
    },
    'bts6vodi': {
      'en': 'Prescription List',
      'si': '',
    },
    'yg28dqgo': {
      'en': 'Randy Rudolph',
      'si': '',
    },
    'l8v27v3b': {
      'en': 'Randie Mcmullens',
      'si': '',
    },
    'p7ob9ilc': {
      'en': 'Raney Bold',
      'si': '',
    },
    '8y5jxmzz': {
      'en': 'Ragina Smith',
      'si': '',
    },
    '46yzcf0s': {
      'en': 'Raku Davis',
      'si': '',
    },
    'goyio2lp': {
      'en': 'Raku Davis',
      'si': '',
    },
  },
  // ViewAllAppointements
  {
    'tmu4581s': {
      'en': 'Appointments',
      'si': '',
    },
    '2rolmrs6': {
      'en': 'Search ...',
      'si': '',
    },
    'u1blm2it': {
      'en': 'Upcoming Appointements',
      'si': '',
    },
    'nubgfk0u': {
      'en': 'Vet_name',
      'si': '',
    },
    'nr3kzkht': {
      'en': 'vet_speciality',
      'si': '',
    },
    '7mai5qpy': {
      'en': 'res_date',
      'si': '',
    },
    '53vavhfh': {
      'en': 'res_time',
      'si': '',
    },
    '5me2j82w': {
      'en': 'Scheduled Appointments',
      'si': '',
    },
    '292eshsc': {
      'en': 'user@domainname.com',
      'si': '',
    },
    '72wb38tu': {
      'en': 'View',
      'si': '',
    },
    'euy1n494': {
      'en': 'Appointments',
      'si': '',
    },
  },
  // SelectDate
  {
    'err6dsmi': {
      'en': 'Month',
      'si': '',
    },
    'ijzo6uv6': {
      'en': 'SelectTime',
      'si': '',
    },
    'he2tio46': {
      'en': 'Week',
      'si': '',
    },
    'e6u3lbdi': {
      'en': 'Coming Up',
      'si': '',
    },
    '62pyvvvu': {
      'en': 'Doctors Check In',
      'si': '',
    },
    'ple25uji': {
      'en': '2:20pm',
      'si': '',
    },
    'iq84wd7y': {
      'en': 'Wed, 03/08/2022',
      'si': '',
    },
    'mke29n30': {
      'en': 'Past Due',
      'si': '',
    },
    'qr6wzbqt': {
      'en': 'Check In',
      'si': '',
    },
    '56a72niy': {
      'en': '2:20pm',
      'si': '',
    },
    'xbi75g9i': {
      'en': 'Wed, 03/08/2022',
      'si': '',
    },
    '5d4xv7j0': {
      'en': 'Select Date',
      'si': '',
    },
    'q5nk5rm2': {
      'en': '1',
      'si': '',
    },
    'xcjix2a1': {
      'en': 'Home',
      'si': '',
    },
  },
  // AddPrec
  {
    '54domoo4': {
      'en': 'Add Prescription',
      'si': '',
    },
    'hdkmuiww': {
      'en': 'PrescriptionId',
      'si': '',
    },
    '3vzfdg0h': {
      'en': 'Prescribed Date',
      'si': '',
    },
    '05hta9di': {
      'en': 'Pet Name',
      'si': '',
    },
    'vur9d6ys': {
      'en': 'Vet Name',
      'si': '',
    },
    'dimf0z3c': {
      'en': 'Exp Date',
      'si': '',
    },
    'higupq3a': {
      'en': 'Submit Prescription',
      'si': '',
    },
    '2gttizel': {
      'en': 'Home',
      'si': '',
    },
  },
  // VetAddAppointment
  {
    'tuz4jfov': {
      'en': 'Edit Appointment',
      'si': '',
    },
    '4cjro8f9': {
      'en': 'Veterinarian name',
      'si': '',
    },
    '4k32vx5x': {
      'en': 'Speciality',
      'si': '',
    },
    'tr81q6pj': {
      'en': 'Pet owner name',
      'si': '',
    },
    '1wmvmot3': {
      'en': 'Date',
      'si': '',
    },
    '99rmitqg': {
      'en': 'Time\n',
      'si': '',
    },
    'rccnhhjk': {
      'en': 'Update',
      'si': '',
    },
    'bikcyjnd': {
      'en': 'Home',
      'si': '',
    },
  },
  // DeleteAppointment
  {
    'szm3n7ke': {
      'en': 'Delete Appointment',
      'si': '',
    },
    '3nv6b4cc': {
      'en': 'Veterinarian name',
      'si': '',
    },
    'dhxagx0z': {
      'en': 'Speciality',
      'si': '',
    },
    'vbo140s7': {
      'en': 'Pet owner name',
      'si': '',
    },
    'wf66dbw8': {
      'en': 'Date',
      'si': '',
    },
    'j7p3qr9w': {
      'en': 'Time\n',
      'si': '',
    },
    'b87nk8p0': {
      'en': 'Delete',
      'si': '',
    },
    'ermqw8yb': {
      'en': 'Home',
      'si': '',
    },
  },
  // owner-ViewAppointments
  {
    'oikturus': {
      'en': 'Make a new Appointment',
      'si': '',
    },
    '8hxgdcvr': {
      'en': 'Upcoming',
      'si': '',
    },
    'symgfwu7': {
      'en': 'Vet_Name',
      'si': '',
    },
    'yrkqrk8t': {
      'en': 'vet_speciality',
      'si': '',
    },
    'skpape5z': {
      'en': 'date',
      'si': '',
    },
    'reih9sal': {
      'en': 'time',
      'si': '',
    },
    'b1oovhwc': {
      'en': 'Completed',
      'si': '',
    },
    '9gmgbcbc': {
      'en': '@username',
      'si': '',
    },
    'ii78mczn': {
      'en': 'pet_name',
      'si': '',
    },
    'ekcfni8p': {
      'en': 'date',
      'si': '',
    },
    'tj3p71y3': {
      'en': 'time',
      'si': '',
    },
    'qhzf4ett': {
      'en': 'Profile',
      'si': '',
    },
  },
  // ViewPrec
  {
    'd4as1dlb': {
      'en': 'Prescriptions',
      'si': '',
    },
    '8i646r02': {
      'en': 'Home',
      'si': '',
    },
  },
  // EditPres
  {
    'l8qrpv93': {
      'en': 'Edit Prescription',
      'si': '',
    },
    '1se1bo0w': {
      'en': 'Call Us',
      'si': '',
    },
    't02pryt4': {
      'en': 'Email Us',
      'si': '',
    },
    'mvlyuu4v': {
      'en': 'Search FAQs',
      'si': '',
    },
    '48666muc': {
      'en': 'PrescriptionId',
      'si': '',
    },
    'k19f903g': {
      'en': 'Prescribed Date',
      'si': '',
    },
    '6er63e2h': {
      'en': 'Pet Name',
      'si': '',
    },
    'o9okq13r': {
      'en': 'Vet Name',
      'si': '',
    },
    'odyllxoo': {
      'en': 'Exp Date',
      'si': '',
    },
    'jn3marl8': {
      'en': 'Page Title',
      'si': '',
    },
    '7sgquo12': {
      'en': 'Home',
      'si': '',
    },
  },
  // PresList
  {
    'iesykr07': {
      'en': 'Prescriptions',
      'si': '',
    },
    '4fuagayw': {
      'en': 'Search for prescriptions..',
      'si': '',
    },
    'txl7ljvo': {
      'en': 'Patients matching search',
      'si': '',
    },
    '8tsaki2d': {
      'en': '24',
      'si': '',
    },
    'ziw9u3br': {
      'en': 'Randy Rudolph',
      'si': '',
    },
    '384zzrj1': {
      'en': 'Randie Mcmullens',
      'si': '',
    },
    'eu4dkcci': {
      'en': 'Raney Bold',
      'si': '',
    },
    'x39e7lqb': {
      'en': 'Ragina Smith',
      'si': '',
    },
    '3yrqrhne': {
      'en': 'Ra Kuo',
      'si': '',
    },
    'i5jij8oy': {
      'en': 'Raku Davis',
      'si': '',
    },
    'drlkoqhz': {
      'en': 'Raku Davis',
      'si': '',
    },
    'hred6ok5': {
      'en': 'prescription',
      'si': '',
    },
  },
  // EditPet
  {
    'e23ie10m': {
      'en': 'Edit Pet',
      'si': '',
    },
    'l1mr29ct': {
      'en': 'UPDATE',
      'si': '',
    },
    'kz643yld': {
      'en': 'Home',
      'si': '',
    },
  },
  // Miscellaneous
  {
    '4z98jnh2': {
      'en': '',
      'si': '',
    },
    'blr7jlfb': {
      'en': '',
      'si': '',
    },
    '67vzvli4': {
      'en': '',
      'si': '',
    },
    '7gf3j7e4': {
      'en': '',
      'si': '',
    },
    'znkvlzhe': {
      'en': '',
      'si': '',
    },
    'oigp4nxe': {
      'en': '',
      'si': '',
    },
    'i3pjkrll': {
      'en': '',
      'si': '',
    },
    'aezt49x0': {
      'en': '',
      'si': '',
    },
    '5xsrsnx1': {
      'en': '',
      'si': '',
    },
    'u2ktj0ks': {
      'en': '',
      'si': '',
    },
    'avgo32fm': {
      'en': '',
      'si': '',
    },
    '56krqm57': {
      'en': '',
      'si': '',
    },
    '4jg3va72': {
      'en': '',
      'si': '',
    },
    'w7lme0bv': {
      'en': '',
      'si': '',
    },
    '32rbvs8v': {
      'en': '',
      'si': '',
    },
    'jdn0hmoi': {
      'en': '',
      'si': '',
    },
    '7dz8x2o1': {
      'en': '',
      'si': '',
    },
    'xryryjjt': {
      'en': '',
      'si': '',
    },
    'gxvbed2g': {
      'en': '',
      'si': '',
    },
    'jn16amih': {
      'en': '',
      'si': '',
    },
    'x7jq5wtu': {
      'en': '',
      'si': '',
    },
    '7syvx64v': {
      'en': '',
      'si': '',
    },
    '4lbbu30o': {
      'en': '',
      'si': '',
    },
    '63lvngjm': {
      'en': '',
      'si': '',
    },
    'mqvut5mz': {
      'en': '',
      'si': '',
    },
    'el0ry1ys': {
      'en': '',
      'si': '',
    },
  },
].reduce((a, b) => a..addAll(b));
