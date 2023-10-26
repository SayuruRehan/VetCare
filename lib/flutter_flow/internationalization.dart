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
    '0ulph4nu': {
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
    'h60re5xh': {
      'en': 'VetCare',
      'si': '',
    },
    'aomsxjrs': {
      'en': 'Welcome!',
      'si': '',
    },
    'f65in5k5': {
      'en': 'Create your account or',
      'si': '',
    },
    '07a9ekz5': {
      'en': 'Already have an account? Login',
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
    'sajr400d': {
      'en': 'Bio',
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
    'ep7y2fzw': {
      'en': 'Bio',
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
    'a11b427t': {
      'en': '',
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
    'd65uu4rr': {
      'en': 'Add New Pet',
      'si': '',
    },
    'cgothh6q': {
      'en': 'Hi there 👋  Welcome to VetCare! 🐶',
      'si': '',
    },
    '37f7qtdr': {
      'en': 'No. of Pets Admitted',
      'si': '',
    },
    'ygqdtena': {
      'en': 'No. of Vets Available',
      'si': '',
    },
    'ql3r2evb': {
      'en': 'No. of Appointments',
      'si': '',
    },
    'qmkt9lzd': {
      'en': 'Pets',
      'si': '',
    },
  },
  // VetSinglePet
  {
    '6by5kepw': {
      'en': 'Pet Details',
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
    '5me2j82w': {
      'en': 'Scheduled Appointments',
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
      'en': 'Add Appointment',
      'si': '',
    },
    'omo5i9wv': {
      'en': 'Option 1',
      'si': '',
    },
    'td93szsk': {
      'en': 'Select Veterinarian',
      'si': '',
    },
    'd3vxhgr2': {
      'en': 'Search for an item...',
      'si': '',
    },
    '2ph57ykt': {
      'en': 'Option 1',
      'si': '',
    },
    '2sojj7gp': {
      'en': 'Select speciality',
      'si': '',
    },
    'o4tgg062': {
      'en': 'Search for an item...',
      'si': '',
    },
    'tr81q6pj': {
      'en': 'Pet name',
      'si': '',
    },
    '1wmvmot3': {
      'en': 'Date ',
      'si': '',
    },
    '99rmitqg': {
      'en': 'Time\n',
      'si': '',
    },
    'rccnhhjk': {
      'en': 'Add',
      'si': '',
    },
    'rl3onry7': {
      'en': 'View',
      'si': '',
    },
    'bikcyjnd': {
      'en': 'Home',
      'si': '',
    },
  },
  // AddPet
  {
    'g46d4a6s': {
      'en': 'Pet Name',
      'si': '',
    },
    'ozl8xzfp': {
      'en': 'Breed',
      'si': '',
    },
    'y1otmvnp': {
      'en': 'Age',
      'si': '',
    },
    'bqf49lb7': {
      'en': 'Weight\n',
      'si': '',
    },
    'ypeitrso': {
      'en': 'Gender',
      'si': '',
    },
    'op8lmf88': {
      'en': 'Owner Name\n',
      'si': '',
    },
    '3pdwefm5': {
      'en': 'Owner Phone Number\n',
      'si': '',
    },
    '5wpyhthy': {
      'en': 'ADD',
      'si': '',
    },
    'i1p98glj': {
      'en': 'Field is required',
      'si': '',
    },
    'ltvupa9s': {
      'en': 'Please choose an option from the dropdown',
      'si': '',
    },
    '9p9ts8a5': {
      'en': 'Field is required',
      'si': '',
    },
    'gtumciq9': {
      'en': 'Please choose an option from the dropdown',
      'si': '',
    },
    'p1b8c2fl': {
      'en': 'Field is required',
      'si': '',
    },
    'xe9ecqvx': {
      'en': 'Please choose an option from the dropdown',
      'si': '',
    },
    'oqxl9d8r': {
      'en': 'Field is required',
      'si': '',
    },
    'su9is5ff': {
      'en': 'Please choose an option from the dropdown',
      'si': '',
    },
    'w6lny30l': {
      'en': 'Field is required',
      'si': '',
    },
    '0zjl1lvh': {
      'en': 'Please choose an option from the dropdown',
      'si': '',
    },
    '2uv93xf4': {
      'en': 'Field is required',
      'si': '',
    },
    'uk6e5om7': {
      'en': 'Please choose an option from the dropdown',
      'si': '',
    },
    'cgls1ur5': {
      'en': 'Field is required',
      'si': '',
    },
    'p8fu8it3': {
      'en': 'Please choose an option from the dropdown',
      'si': '',
    },
    '7rjb2h0j': {
      'en': 'ADD NEW PET',
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
  // EditPet
  {
    'oxdetue1': {
      'en': 'Pet Name',
      'si': '',
    },
    'n7tqp4nf': {
      'en': 'Breed',
      'si': '',
    },
    'mmkt4mow': {
      'en': 'Age of Pet',
      'si': '',
    },
    'wzxdwtjd': {
      'en': 'Name of Owner',
      'si': '',
    },
    'e8bnuwoj': {
      'en': 'Contact Number of Owner',
      'si': '',
    },
    'tydbe1f6': {
      'en': 'UPDATE',
      'si': '',
    },
    'agwmujkx': {
      'en': 'Field is required',
      'si': '',
    },
    'eay7y35t': {
      'en': 'Please choose an option from the dropdown',
      'si': '',
    },
    'wovd0ik7': {
      'en': 'Field is required',
      'si': '',
    },
    'qjz8e3an': {
      'en': 'Please choose an option from the dropdown',
      'si': '',
    },
    'bgaachnr': {
      'en': 'Field is required',
      'si': '',
    },
    '471gp820': {
      'en': 'Please choose an option from the dropdown',
      'si': '',
    },
    '6of2o2iz': {
      'en': 'EDIT PET DETAILS',
      'si': '',
    },
    'kz643yld': {
      'en': 'Home',
      'si': '',
    },
  },
  // VetUpdateAppointmen
  {
    'f47pz8l9': {
      'en': 'Update Appointment',
      'si': '',
    },
    'qp8k5xzn': {
      'en': 'Date',
      'si': '',
    },
    'g6x9mbss': {
      'en': 'Time\n',
      'si': '',
    },
    'm5oao4gm': {
      'en': 'Update',
      'si': '',
    },
    'n8vyrahr': {
      'en': 'Home',
      'si': '',
    },
  },
  // CreatePres
  {
    'bquelmnp': {
      'en': 'Pet Name',
      'si': '',
    },
    '6zyyqixx': {
      'en': 'Max',
      'si': '',
    },
    'rmdlf9c0': {
      'en': 'Vetenarians\' Name\n',
      'si': '',
    },
    'b6qo1fse': {
      'en': 'John Doe',
      'si': '',
    },
    'aq6jnnyt': {
      'en': 'Prescribed Date\n',
      'si': '',
    },
    'suxb29cu': {
      'en': 'Pres Date',
      'si': '',
    },
    'q1zijnob': {
      'en': 'Expiary Date\n',
      'si': '',
    },
    's9racx2m': {
      'en': 'EXP Date',
      'si': '',
    },
    'o6zmlp9w': {
      'en': 'Create',
      'si': '',
    },
    'tiz5dlrc': {
      'en': 'View',
      'si': '',
    },
    'q29upblm': {
      'en': 'Add Prescription',
      'si': '',
    },
    'rawga544': {
      'en': 'Pres',
      'si': '',
    },
  },
  // EditPres
  {
    'i754unsu': {
      'en': 'Update',
      'si': '',
    },
    'i14bn2en': {
      'en': 'Edit Prescription',
      'si': '',
    },
    'l2dxzka3': {
      'en': 'Home',
      'si': '',
    },
  },
  // InviteUsers
  {
    '6henriot': {
      'en': 'Invite User',
      'si': '',
    },
    'q2caqngf': {
      'en': 'Home',
      'si': '',
    },
  },
  // AddAppoint
  {
    'r0dgab2u': {
      'en': 'Add Appointment',
      'si': '',
    },
    'dyzpcjrd': {
      'en': 'Vet Name',
      'si': '',
    },
    'k1ewcsg6': {
      'en': 'John Doe',
      'si': '',
    },
    'ce6o1pmb': {
      'en': 'Vet Speciality\n',
      'si': '',
    },
    '7g90axcm': {
      'en': 'Surgeon',
      'si': '',
    },
    'lv5gt7td': {
      'en': 'Pet Name',
      'si': '',
    },
    'k538te0w': {
      'en': 'Max',
      'si': '',
    },
    'h361str2': {
      'en': 'Appointment Date',
      'si': '',
    },
    'cp0w3u6b': {
      'en': ' Date',
      'si': '',
    },
    'kxa18bdj': {
      'en': 'Appointment Time',
      'si': '',
    },
    'oqjpvyc2': {
      'en': 'Time',
      'si': '',
    },
    'sgusnrdr': {
      'en': 'Create',
      'si': '',
    },
    '3vtzzsgd': {
      'en': 'View',
      'si': '',
    },
    '2r10ler5': {
      'en': 'Home',
      'si': '',
    },
  },
  // ViewAppoint
  {
    'xh21xn3u': {
      'en': 'Page Title',
      'si': '',
    },
    'jkbf95kk': {
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
