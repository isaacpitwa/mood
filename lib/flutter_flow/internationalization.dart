import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'lv'];

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
    String? lvText = '',
  }) =>
      [enText, lvText][languageIndex] ?? '';

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
  // LoginPage
  {
    '9aapou0v': {
      'en': 'Sign In now',
      'lv': 'Pierakstieties tūlīt',
    },
    'yejriiue': {
      'en': 'Welcome back.',
      'lv': 'Laipni lūdzam atpakaļ.',
    },
    'nddonus0': {
      'en': 'You have been missed!',
      'lv': 'Tevis pietrūka!',
    },
    'ng0mepzr': {
      'en': 'Email',
      'lv': 'E-pasts',
    },
    '1wy0ch2i': {
      'en': 'Password',
      'lv': 'Parole',
    },
    '7y4l32bk': {
      'en': 'Remember me',
      'lv': 'Atceries mani',
    },
    'dbgqbu0e': {
      'en': 'Forgot Password?',
      'lv': 'Aizmirsi paroli',
    },
    'njykgc2u': {
      'en': 'Sign In',
      'lv': 'Ielogoties',
    },
    '11wy0sa5': {
      'en': 'Or ',
      'lv': 'Or',
    },
    'f11zrxd8': {
      'en': 'Continue with Google',
      'lv': 'Turpiniet ar Google',
    },
    'jpx2m3np': {
      'en': 'Continue with Apple',
      'lv': 'Turpiniet ar Apple',
    },
    '2rsn0p8u': {
      'en': 'Don\'t you have an account?',
      'lv': 'Vai jums nav konta?',
    },
    'w0njy9qk': {
      'en': 'Register ',
      'lv': 'Reģistrēties',
    },
    'uf21uymt': {
      'en': 'Home',
      'lv': 'Mājas',
    },
  },
  // SiginUp
  {
    'mpadqnd6': {
      'en': 'Sign up',
      'lv': 'Pierakstīties',
    },
    'nf8vp5w9': {
      'en': 'Create an account so',
      'lv': 'Izveidojiet kontu tā',
    },
    'oe8bbp0n': {
      'en': 'You can track your daily moods.',
      'lv': 'Jūs varat izsekot savam ikdienas noskaņojumam.',
    },
    'vah4s48c': {
      'en': 'Email Address',
      'lv': 'Epasta adrese',
    },
    '5gh483x6': {
      'en': 'Password',
      'lv': 'Parole',
    },
    'ybl8b4kk': {
      'en': 'Confirm Password',
      'lv': 'apstipriniet paroli',
    },
    'szwfjrta': {
      'en': 'Sign up',
      'lv': 'Pierakstīties',
    },
    '4vp3p4nt': {
      'en': 'Or',
      'lv': 'Or',
    },
    'tklz1wu7': {
      'en': 'Continue with Google',
      'lv': 'Turpiniet ar Google',
    },
    'hejf7rrb': {
      'en': 'Continue with Apple',
      'lv': 'Turpiniet ar Apple',
    },
    'ox1kmjcr': {
      'en': 'Already have an account?',
      'lv': 'Jau ir konts?',
    },
    'y40dp326': {
      'en': 'sign in',
      'lv': 'ielogoties',
    },
    '2u6ddqeu': {
      'en': 'Home',
      'lv': 'Mājas',
    },
  },
  // profile
  {
    'albn0ryp': {
      'en': 'Settings',
      'lv': 'Iestatījumi',
    },
    'wnlzpy9i': {
      'en': 'Reminders',
      'lv': 'Atgādinājumi',
    },
    'z0ig3r2i': {
      'en': 'Logout',
      'lv': 'Izlogoties',
    },
    'k4jyf0cb': {
      'en': 'Language',
      'lv': 'Valoda',
    },
    'nwkqdhqj': {
      'en': 'Profile',
      'lv': 'Profils',
    },
    'ixyqrne4': {
      'en': '__',
      'lv': '__',
    },
  },
  // forgotpassword
  {
    'jkfhww8a': {
      'en': 'Back',
      'lv': 'Atpakaļ',
    },
    'o7q3s8zr': {
      'en': 'Forgot Password',
      'lv': 'Aizmirsi paroli',
    },
    'visu1t6b': {
      'en': 'Enter your email address to \nreset your password.',
      'lv': 'Ievadiet savu e-pasta adresi uz\natiestatiet savu paroli.',
    },
    'x5lqeucd': {
      'en': 'Enter your email...',
      'lv': 'Ievadi savu epastu...',
    },
    '7vgppgae': {
      'en': 'Send password reset',
      'lv': 'Sūtīt paroles atiestatīšanu',
    },
    'mzxw1ark': {
      'en': 'Already have an account?',
      'lv': 'Jau ir konts?',
    },
    'r5uyuqoo': {
      'en': 'sign in',
      'lv': 'ielogoties',
    },
    'il85nclq': {
      'en': 'Home',
      'lv': 'Mājas',
    },
  },
  // dailyReminders
  {
    'k9tfyt34': {
      'en': 'Daily Reminders',
      'lv': 'Ikdienas atgādinājumi',
    },
    'jx7i1mpb': {
      'en':
          'By creating repetition with your check-ins, \nyou can uncover more about your moods.',
      'lv':
          'Izveidojot atkārtojumus ar savām reģistrēšanās reizēm,\nvarat uzzināt vairāk par savu noskaņojumu.',
    },
    'rs9eiz66': {
      'en': 'Daily Reminders',
      'lv': 'Ikdienas atgādinājumi',
    },
    '1i6bbxfh': {
      'en': '__',
      'lv': '__',
    },
  },
  // Insights
  {
    'x27fod7o': {
      'en': 'Insights',
      'lv': 'Ieskati',
    },
    '85jgqsry': {
      'en': 'Mood analysis',
      'lv': 'Garastāvokļa analīze',
    },
    't8566tgl': {
      'en': 'Last Week',
      'lv': 'Pagājušajā nedēļā',
    },
    '59qtsdtp': {
      'en': 'Last Week',
      'lv': 'Pagājušajā nedēļā',
    },
    'rmna9zr3': {
      'en': 'Last Month',
      'lv': 'Pagājušajā mēnesī',
    },
    'd5clr4bd': {
      'en': 'Please select...',
      'lv': 'Lūdzu izvēlieties...',
    },
    'wuuuvwvm': {
      'en': 'Search for an item...',
      'lv': 'Meklēt preci...',
    },
    'f9nmfwan': {
      'en': 'How your mood changes over time.',
      'lv': 'Kā laika gaitā mainās jūsu garastāvoklis.',
    },
    'd5pu64da': {
      'en': 'Date',
      'lv': '',
    },
    'bmj0i6w0': {
      'en': 'Mood',
      'lv': '',
    },
    'bjf66qrf': {
      'en': 'Point',
      'lv': '',
    },
    'rbmdj1js': {
      'en': 'Insights',
      'lv': 'Ieskats',
    },
  },
  // AddMood
  {
    'bb2mk9p3': {
      'en': 'What’s your mood now ?',
      'lv': 'Kāds ir tavs noskaņojums tagad?',
    },
    'cjd7z75i': {
      'en': 'Select mood that reflects the most how  you are feeling.',
      'lv': 'Izvēlieties noskaņojumu, kas visvairāk atspoguļo jūsu pašsajūtu.',
    },
    '120tzfcj': {
      'en': '🤩',
      'lv': '',
    },
    'omf3hhvd': {
      'en': '😍',
      'lv': '',
    },
    '9zsmqn29': {
      'en': '🥺',
      'lv': '',
    },
    'kiw4xsyq': {
      'en': '🤮',
      'lv': '',
    },
    'wu3njcvo': {
      'en': '😡',
      'lv': '',
    },
    '5pdhngf2': {
      'en': '🤩',
      'lv': '',
    },
    'vvnxhwdc': {
      'en': 'Please select...',
      'lv': '',
    },
    '3zlxyqw2': {
      'en': 'Search for an item...',
      'lv': '',
    },
    '8xiz7zh1': {
      'en': 'How would you describe your condition?',
      'lv': 'Kā jūs raksturotu savu stāvokli?',
    },
    'f62l8vyg': {
      'en': 'Type your message here',
      'lv': 'Ierakstiet savu ziņojumu šeit',
    },
    '967mdk84': {
      'en': 'Save your mood',
      'lv': 'Saglabājiet savu garastāvokli',
    },
    '9i0em4dq': {
      'en': 'Add Mood',
      'lv': 'Pievienot noskaņojumu',
    },
  },
  // dashboard
  {
    'mlqp11g0': {
      'en': 'Dashboard',
      'lv': 'Mērinstrumentu panelis',
    },
    '3d7onptp': {
      'en': 'MOOD CHECK',
      'lv': 'MOST PĀRBAUDE',
    },
    'rb1w0poa': {
      'en': 'Recommended Activities',
      'lv': 'Ieteicamās aktivitātes',
    },
    'lyo3pd71': {
      'en': 'Dashboard',
      'lv': 'Mērinstrumentu panelis',
    },
  },
  // SocialContacts
  {
    'eytpwbjz': {
      'en': 'Follow Mood',
      'lv': 'Sekojiet garastāvoklim',
    },
    'vewlozao': {
      'en': 'Get more useful information\non our social network',
      'lv': 'Iegūstiet vairāk noderīgas informācijas\nmūsu sociālajā tīklā',
    },
  },
  // CreatedMoodWidget
  {
    'z198tjvu': {
      'en': ' Activities to do in  this mood',
      'lv': '',
    },
  },
  // EmptyMoodRecord
  {
    'mbyc8lkt': {
      'en': 'MOOD CHECK',
      'lv': 'MOST PĀRBAUDE',
    },
    'qf59h6kw': {
      'en': 'You’re have no mood record.',
      'lv': 'Jums šodien ir slikts garastāvoklis',
    },
    'ubrfx7st': {
      'en':
          'Tracking your mood empowers self-awareness, Understanding leads to positive change, Embrace the journey of self-discovery.',
      'lv':
          'Gatavība nirt dienas laikā ir normāli, taču sekojiet tam līdzi, lai tā nenokristu zemu.',
    },
  },
  // Miscellaneous
  {
    'zg3tovv3': {
      'en': '',
      'lv': '',
    },
    'r4129dqi': {
      'en': '',
      'lv': '',
    },
    '04tdhsy7': {
      'en': '',
      'lv': '',
    },
    'khsv6z6q': {
      'en': '',
      'lv': '',
    },
    'o5lnq6jy': {
      'en': '',
      'lv': '',
    },
    '9andbo0g': {
      'en': '',
      'lv': '',
    },
    'kryrag5n': {
      'en': '',
      'lv': '',
    },
    'zarevbjy': {
      'en': '',
      'lv': '',
    },
    'mj6fs8yb': {
      'en': '',
      'lv': '',
    },
    'sa7rygji': {
      'en': '',
      'lv': '',
    },
    '6xby0tmi': {
      'en': '',
      'lv': '',
    },
    'aabvbn2x': {
      'en': '',
      'lv': '',
    },
    'nro35s33': {
      'en': '',
      'lv': '',
    },
    'ti6965j6': {
      'en': '',
      'lv': '',
    },
    'nfv700gd': {
      'en': '',
      'lv': '',
    },
    '2yyyozzr': {
      'en': '',
      'lv': '',
    },
    'lpw0p8oy': {
      'en': '',
      'lv': '',
    },
    '5xroerkc': {
      'en': '',
      'lv': '',
    },
    '0hfluwqd': {
      'en': '',
      'lv': '',
    },
    'zxlqhwlo': {
      'en': '',
      'lv': '',
    },
    '2012hudd': {
      'en': '',
      'lv': '',
    },
    'sz1lvlqe': {
      'en': '',
      'lv': '',
    },
    'yj7zkqsn': {
      'en': '',
      'lv': '',
    },
  },
].reduce((a, b) => a..addAll(b));
