# frozen_string_literal: true
require 'ruby/intl/version'

require 'date'
require 'javascript/intl'

module Ruby
  module Intl
    class Error < StandardError; end

    def self.get_canonical_locales(locales)
      lang, territory = locales.split("-")

      return ["#{lang.downcase}-#{territory.upcase}"] if territory
      [lang.downcase]
    end
  end
end

require_relative './intl/date_time_format'
require_relative './intl/relative_time_format'


Ruby::Intl::CALENDAR = {
  'es' =>
    {
      months: {
        format: {
          abbreviated: {
            1 => 'ene.',
            2 => 'feb.',
            3 => 'mar.',
            4 => 'abr.',
            5 => 'may.',
            6 => 'jun.',
            7 => 'jul.',
            8 => 'ago.',
            9 => 'sept.',
            10 => 'oct.',
            11 => 'nov.',
            12 => 'dic.'
          },
          narrow: {
            1 => 'E',
            2 => 'F',
            3 => 'M',
            4 => 'A',
            5 => 'M',
            6 => 'J',
            7 => 'J',
            8 => 'A',
            9 => 'S',
            10 => 'O',
            11 => 'N',
            12 => 'D'
          },
          wide: {
            1 => 'enero',
            2 => 'febrero',
            3 => 'marzo',
            4 => 'abril',
            5 => 'mayo',
            6 => 'junio',
            7 => 'julio',
            8 => 'agosto',
            9 => 'septiembre',
            10 => 'octubre',
            11 => 'noviembre',
            12 => 'diciembre'
          }
        },
        "stand-alone": {
          abbreviated: {
            1 => 'ene.',
            2 => 'feb.',
            3 => 'mar.',
            4 => 'abr.',
            5 => 'may.',
            6 => 'jun.',
            7 => 'jul.',
            8 => 'ago.',
            9 => 'sept.',
            10 => 'oct.',
            11 => 'nov.',
            12 => 'dic.'
          },
          narrow: {
            1 => 'E',
            2 => 'F',
            3 => 'M',
            4 => 'A',
            5 => 'M',
            6 => 'J',
            7 => 'J',
            8 => 'A',
            9 => 'S',
            10 => 'O',
            11 => 'N',
            12 => 'D'
          },
          wide: {
            1 => 'enero',
            2 => 'febrero',
            3 => 'marzo',
            4 => 'abril',
            5 => 'mayo',
            6 => 'junio',
            7 => 'julio',
            8 => 'agosto',
            9 => 'septiembre',
            10 => 'octubre',
            11 => 'noviembre',
            12 => 'diciembre'
          }
        }
      },
      days: {
        format: {
          abbreviated: {
            sun: 'dom.',
            mon: 'lun.',
            tue: 'mar.',
            wed: 'mi??.',
            thu: 'jue.',
            fri: 'vie.',
            sat: 's??b.'
          },
          narrow: {
            sun: 'D',
            mon: 'L',
            tue: 'M',
            wed: 'X',
            thu: 'J',
            fri: 'V',
            sat: 'S'
          },
          short: {
            sun: 'DO',
            mon: 'LU',
            tue: 'MA',
            wed: 'MI',
            thu: 'JU',
            fri: 'VI',
            sat: 'SA'
          },
          wide: {
            sun: 'domingo',
            mon: 'lunes',
            tue: 'martes',
            wed: 'mi??rcoles',
            thu: 'jueves',
            fri: 'viernes',
            sat: 's??bado'
          }
        },
        "stand-alone": {
          abbreviated: {
            sun: 'dom.',
            mon: 'lun.',
            tue: 'mar.',
            wed: 'mi??.',
            thu: 'jue.',
            fri: 'vie.',
            sat: 's??b.'
          },
          narrow: {
            sun: 'D',
            mon: 'L',
            tue: 'M',
            wed: 'X',
            thu: 'J',
            fri: 'V',
            sat: 'S'
          },
          short: {
            sun: 'DO',
            mon: 'LU',
            tue: 'MA',
            wed: 'MI',
            thu: 'JU',
            fri: 'VI',
            sat: 'SA'
          },
          wide: {
            sun: 'domingo',
            mon: 'lunes',
            tue: 'martes',
            wed: 'mi??rcoles',
            thu: 'jueves',
            fri: 'viernes',
            sat: 's??bado'
          }
        }
      },
      eras: {
        name: {
          0 => 'antes de la era com??n',
          1 => 'era com??n'
        }, abbr: {
          0 => 'a. e. c.',
          1 => 'e. c.'
        }
      },
      quarters: {
        format: {
          abbreviated: {
            1 => 'T1',
            2 => 'T2',
            3 => 'T3',
            4 => 'T4'
          }, narrow: {
            1 => '1',
            2 => '2',
            3 => '3',
            4 => '4'
          }, wide: {
            1 => '1.er trimestre',
            2 => '2.?? trimestre',
            3 => '3.er trimestre',
            4 => '4.?? trimestre'
          }
        },
        "stand-alone": {
          abbreviated: {
            1 => 'T1',
            2 => 'T2',
            3 => 'T3',
            4 => 'T4'
          }, narrow: {
            1 => '1',
            2 => '2',
            3 => '3',
            4 => '4'
          }, wide: {
            1 => '1.er trimestre',
            2 => '2.?? trimestre',
            3 => '3.er trimestre',
            4 => '4.?? trimestre'
          }
        }
      },
      periods: {
        format: {
          abbreviated: {
            am: 'a. m.',
            noon: 'del mediod??a',
            pm: 'p. m.',
            morning1: 'de la madrugada',
            morning2: 'de la ma??ana',
            evening1: 'de la tarde',
            night1: 'de la noche'
          },
          narrow: {
            am: 'a. m.',
            noon: 'del mediod??a',
            pm: 'p. m.',
            morning1: 'de la madrugada',
            morning2: 'de la ma??ana',
            evening1: 'de la tarde',
            night1: 'de la noche'
          },
          wide: {
            am: 'a. m.',
            noon: 'del mediod??a',
            pm: 'p. m.',
            morning1: 'de la madrugada',
            morning2: 'de la ma??ana',
            evening1: 'de la tarde',
            night1: 'de la noche'
          }
        },
        "stand-alone": {
          abbreviated: {
            am: 'a. m.',
            noon: 'mediod??a',
            pm: 'p. m.',
            morning1: 'madrugada',
            morning2: 'ma??ana',
            evening1: 'tarde',
            night1: 'noche'
          },
          narrow: {
            am: 'a. m.',
            noon: 'mediod??a',
            pm: 'p. m.',
            morning1: 'madrugada',
            morning2: 'ma??ana',
            evening1: 'tarde',
            night1: 'noche'
          },
          wide: {
            am: 'a. m.',
            noon: 'mediod??a',
            pm: 'p. m.',
            morning1: 'madrugada',
            morning2: 'ma??ana',
            evening1: 'tarde',
            night1: 'noche'
          }
        }
      },
      fields: {
        era: 'era',
        "era-short": 'era',
        "era-narrow": 'era',
        year: 'a??o',
        "year-short": 'a',
        "year-narrow": 'a',
        quarter: 'trimestre',
        "quarter-short": 'trim.',
        "quarter-narrow": 'trim.',
        month: 'mes',
        "month-short": 'm',
        "month-narrow": 'm',
        week: 'semana',
        "week-short": 'sem.',
        "week-narrow": 'sem.',
        weekOfMonth: 'semana del mes',
        "weekOfMonth-short": 'sem. de mes',
        "weekOfMonth-narrow": 'sem. de mes',
        day: 'd??a',
        "day-short": 'd',
        "day-narrow": 'd',
        dayOfYear: 'd??a del a??o',
        "dayOfYear-short": 'd??a del a',
        "dayOfYear-narrow": 'd??a del a',
        weekday: 'd??a de la semana',
        "weekday-short": 'd??a de sem.',
        "weekday-narrow": 'd??a de sem.',
        weekdayOfMonth: 'd??a de la semana del mes',
        "weekdayOfMonth-short": 'd??a de sem. de mes',
        "weekdayOfMonth-narrow": 'd??a de sem. de mes',
        "dayperiod-short": 'a. m./p. m.',
        dayperiod: 'a. m./p. m.',
        "dayperiod-narrow": 'a. m./p. m.',
        hour: 'hora',
        "hour-short": 'h',
        "hour-narrow": 'h',
        minute: 'minuto',
        "minute-short": 'min',
        "minute-narrow": 'min',
        second: 'segundo',
        "second-short": 's',
        "second-narrow": 's',
        zone: 'zona horaria',
        "zone-short": 'zona',
        "zone-narrow": 'zona'
      },
      formats: {
        date: {
          full: {
            pattern: "EEEE, d 'de' MMMM 'de' y"
          }, long: {
            pattern: "d 'de' MMMM 'de' y"
          }, medium: {
            pattern: 'd MMM y'
          }, short: {
            pattern: 'd/M/yy'
          }
        },
        time: {
          full: {
            pattern: 'H:mm:ss (zzzz)'
          }, long: {
            pattern: 'H:mm:ss z'
          }, medium: {
            pattern: 'H:mm:ss'
          }, short: {
            pattern: 'H:mm'
          }
        },
        datetime: {
          full: {
            pattern: '{{date}}, {{time}}'
          }, long: {
            pattern: '{{date}}, {{time}}'
          }, medium: {
            pattern: '{{date}} {{time}}'
          }, short: {
            pattern: '{{date}} {{time}}'
          }
        }
      },
      additional_formats: {
        'Bh' => 'h B',
        'Bhm' => 'h:mm B',
        'Bhms' => 'h:mm:ss B',
        'd' => 'd',
        'E' => 'ccc',
        'EBhm' => 'E h:mm B',
        'EBhms' => 'E h:mm:ss B',
        'Ed' => 'E d',
        'Ehm' => 'E, h:mm a',
        'EHm' => 'E, H:mm',
        'Ehms' => 'E, h:mm:ss a',
        'EHms' => 'E, H:mm:ss',
        'Gy' => 'y G',
        'GyMMM' => 'MMM y G',
        'GyMMMd' => 'd MMM y G',
        'GyMMMEd' => 'E, d MMM y G',
        'GyMMMM' => "MMMM 'de' y G",
        'GyMMMMd' => "d 'de' MMMM 'de' y G",
        'GyMMMMEd' => "E, d 'de' MMMM 'de' y G",
        'h' => 'h a',
        'H' => 'H',
        'hm' => 'h:mm a',
        'Hm' => 'H:mm',
        'hms' => 'h:mm:ss a',
        'Hms' => 'H:mm:ss',
        'hmsv' => 'h:mm:ss a v',
        'Hmsv' => 'H:mm:ss v',
        'hmsvvvv' => 'h:mm:ss a (vvvv)',
        'Hmsvvvv' => 'H:mm:ss (vvvv)',
        'hmv' => 'h:mm a v',
        'Hmv' => 'H:mm v',
        'M' => 'L',
        'Md' => 'd/M',
        'MEd' => 'E, d/M',
        'MMd' => 'd/M',
        'MMdd' => 'd/M',
        'MMM' => 'LLL',
        'MMMd' => 'd MMM',
        'MMMEd' => 'E, d MMM',
        'MMMMd' => "d 'de' MMMM",
        'MMMMEd' => "E, d 'de' MMMM",
        'MMMMW' => "'semana' W 'de' MMM",
        'ms' => 'mm:ss',
        'y' => 'y',
        'yM' => 'M/y',
        'yMd' => 'd/M/y',
        'yMEd' => 'EEE, d/M/y',
        'yMM' => 'M/y',
        'yMMM' => 'MMM y',
        'yMMMd' => 'd MMM y',
        'yMMMEd' => 'EEE, d MMM y',
        'yMMMM' => "MMMM 'de' y",
        'yMMMMd' => "d 'de' MMMM 'de' y",
        'yMMMMEd' => "EEE, d 'de' MMMM 'de' y",
        'yQQQ' => 'QQQ y',
        'yQQQQ' => "QQQQ 'de' y",
        'yw' => "'semana' w 'de' Y"
      }
    },
  'en-GB' => {
    formats: {
      date: {}, time: {
        full: {
          pattern: 'HH:mm:ss zzzz'
        }, long: {
          pattern: 'HH:mm:ss z'
        }, medium: {
          pattern: 'HH:mm:ss'
        }, short: {
          pattern: 'HH:mm'
        }
      }, datetime: {}
    }
  },
  'en-CA' =>
    {
      months: {
        format: {
          abbreviated: {
            1 => 'Jan.',
            2 => 'Feb.',
            3 => 'Mar.',
            4 => 'Apr.',
            5 => 'May',
            6 => 'Jun.',
            7 => 'Jul.',
            8 => 'Aug.',
            9 => 'Sep.',
            10 => 'Oct.',
            11 => 'Nov.',
            12 => 'Dec.'
          }
        }
      },
      days: {
        format: {
          abbreviated: {
            sun: 'Sun.',
            mon: 'Mon.',
            tue: 'Tue.',
            wed: 'Wed.',
            thu: 'Thu.',
            fri: 'Fri.',
            sat: 'Sat.'
          }
        }
      },
      periods: {
        format: {
          abbreviated: {
            am: 'a.m.',
            pm: 'p.m.'
          }, narrow: {
            midnight: 'mid',
            am: 'am',
            pm: 'pm',
            morning1: 'mor',
            afternoon1: 'aft',
            evening1: 'eve',
            night1: 'night'
          }, wide: {
            am: 'a.m.',
            pm: 'p.m.'
          }
        },
        "stand-alone": {
          abbreviated: {
            am: 'a.m.',
            pm: 'p.m.'
          }, narrow: {
            midnight: 'mid',
            morning1: 'mor',
            afternoon1: 'aft',
            evening1: 'eve'
          }, wide: {
            am: 'a.m.',
            pm: 'p.m.'
          }
        }
      },
      fields: {
        "year-short": 'yr.',
        "year-narrow": 'yr.',
        "quarter-short": 'qtr.',
        "quarter-narrow": 'qtr.',
        "month-short": 'mo.',
        "month-narrow": 'mo.',
        "week-short": 'wk.',
        "week-narrow": 'wk.',
        "dayperiod-short": 'a.m./p.m.',
        dayperiod: 'a.m./p.m.',
        "dayperiod-narrow": 'a.m./p.m.',
        "hour-short": 'hr.',
        "hour-narrow": 'hr.',
        "minute-short": 'min.',
        "minute-narrow": 'min.',
        "second-short": 'sec.',
        "second-narrow": 'sec.'
      },
      formats: {
        date: {
          full: {
            pattern: 'EEEE, MMMM d, y'
          }, long: {
            pattern: 'MMMM d, y'
          }, medium: {
            pattern: 'MMM d, y'
          }, short: {
            pattern: 'd/M/yy'
          }
        }, time: {}, datetime: {}
      },
      additional_formats: {
        'GyMMMd' => 'MMM d, y G',
        'GyMMMEd' => 'E, MMM d, y G',
        'Md' => 'd/M',
        'MEd' => 'E, d/M',
        'MMdd' => 'dd/MM',
        'MMMd' => 'MMM d',
        'MMMEd' => 'E, MMM d',
        'MMMMd' => 'MMMM d',
        'yM' => 'M/y',
        'yMd' => 'd/M/y',
        'yMEd' => 'E, d/M/y',
        'yMMMd' => 'MMM d, y',
        'yMMMEd' => 'E, MMM d, y',
        'yw' => "'week' w 'of' Y"
      }
    },
  'en-AU' =>
    {
      days: {
        format: {
          narrow: {
            sun: 'Su.',
            mon: 'M.',
            tue: 'Tu.',
            wed: 'W.',
            thu: 'Th.',
            fri: 'F.',
            sat: 'Sa.'
          }, short: {
            sun: 'Su',
            mon: 'Mon',
            tue: 'Tu',
            wed: 'Wed',
            thu: 'Th',
            fri: 'Fri',
            sat: 'Sat'
          }
        },
        "stand-alone": {
          narrow: {
            sun: 'Su.',
            mon: 'M.',
            tue: 'Tu.',
            wed: 'W.',
            thu: 'Th.',
            fri: 'F.',
            sat: 'Sa.'
          }, short: {
            sun: 'Su',
            mon: 'Mon',
            tue: 'Tu',
            wed: 'Wed',
            thu: 'Th',
            fri: 'Fri',
            sat: 'Sat'
          }
        }
      },
      periods: {
        format: {
          abbreviated: {
            midnight: 'midnight',
            noon: 'midday',
            morning1: 'morning',
            afternoon1: 'afternoon',
            evening1: 'evening',
            night1: 'night'
          },
          narrow: {
            midnight: 'midnight',
            am: 'am',
            noon: 'midday',
            pm: 'pm',
            morning1: 'morning',
            afternoon1: 'afternoon',
            evening1: 'evening',
            night1: 'night'
          },
          wide: {
            midnight: 'midnight',
            noon: 'midday',
            morning1: 'in the morning',
            afternoon1: 'in the afternoon',
            evening1: 'in the evening',
            night1: 'at night'
          }
        },
        "stand-alone": {
          abbreviated: {
            noon: 'midday'
          }, narrow: {
            noon: 'midday'
          }, wide: {
            noon: 'midday'
          }
        }
      },
      fields: {
        "month-short": 'mo.',
        "month-narrow": 'mo.',
        "weekOfMonth-short": 'wk of mo.',
        "weekdayOfMonth-short": 'wkday of mo.',
        "hour-short": 'h',
        "hour-narrow": 'h',
        "minute-short": 'min.',
        "minute-narrow": 'min.',
        "second-short": 'sec.',
        "second-narrow": 'sec.'
      },
      formats: {
        date: {
          short: {
            pattern: 'd/M/yy'
          }
        }, time: {}, datetime: {}
      },
      additional_formats: {
        'Md' => 'd/M',
        'MEd' => 'E, d/M'
      }
    },
  'en' =>
  {
    months: {
      format: {
        abbreviated: {
          1 => 'Jan',
          2 => 'Feb',
          3 => 'Mar',
          4 => 'Apr',
          5 => 'May',
          6 => 'Jun',
          7 => 'Jul',
          8 => 'Aug',
          9 => 'Sep',
          10 => 'Oct',
          11 => 'Nov',
          12 => 'Dec'
        },
        wide: {
          1 => 'January',
          2 => 'February',
          3 => 'March',
          4 => 'April',
          5 => 'May',
          6 => 'June',
          7 => 'July',
          8 => 'August',
          9 => 'September',
          10 => 'October',
          11 => 'November',
          12 => 'December'
        }
      },
      "stand-alone": {
        narrow: {
          1 => 'J',
          2 => 'F',
          3 => 'M',
          4 => 'A',
          5 => 'M',
          6 => 'J',
          7 => 'J',
          8 => 'A',
          9 => 'S',
          10 => 'O',
          11 => 'N',
          12 => 'D'
        },
        abbreviated: {
          1 => 'Jan',
          2 => 'Feb',
          3 => 'Mar',
          4 => 'Apr',
          5 => 'May',
          6 => 'Jun',
          7 => 'Jul',
          8 => 'Aug',
          9 => 'Sep',
          10 => 'Oct',
          11 => 'Nov',
          12 => 'Dec'
        },
      }
    },
    days: {
      format: {
        abbreviated: {
          sun: 'Sun',
          mon: 'Mon',
          tue: 'Tue',
          wed: 'Wed',
          thu: 'Thu',
          fri: 'Fri',
          sat: 'Sat'
        },
        short: {
          sun: 'Su',
          mon: 'Mo',
          tue: 'Tu',
          wed: 'We',
          thu: 'Th',
          fri: 'Fr',
          sat: 'Sa'
        },
        wide: {
          sun: 'Sunday',
          mon: 'Monday',
          tue: 'Tuesday',
          wed: 'Wednesday',
          thu: 'Thursday',
          fri: 'Friday',
          sat: 'Saturday'
        }
      },
      "stand-alone": {
        narrow: {
          sun: 'S',
          mon: 'M',
          tue: 'T',
          wed: 'W',
          thu: 'T',
          fri: 'F',
          sat: 'S'
        }
      }
    },
    eras: {
      name: {
        0 => 'Before Common Era',
        1 => 'Common Era'
      }, abbr: {
        0 => 'BCE',
        1 => 'CE'
      }, narrow: {
        0 => 'B',
        1 => 'A'
      }
    },
    quarters: {
      format: {
        abbreviated: {
          1 => 'Q1',
          2 => 'Q2',
          3 => 'Q3',
          4 => 'Q4'
        }, wide: {
          1 => '1st quarter',
          2 => '2nd quarter',
          3 => '3rd quarter',
          4 => '4th quarter'
        }
      }, "stand-alone": {
        narrow: {
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4'
        }
      }
    },
    periods: {
      format: {
        abbreviated: {
          :midnight => 'midnight',
          :am => 'AM',
          'variant' => {
            am: 'am',
            pm: 'pm'
          }, :noon => 'noon',
          :pm => 'PM',
          :morning1 => 'in the morning',
          :afternoon1 => 'in the afternoon',
          :evening1 => 'in the evening',
          :night1 => 'at night'
        },
        narrow: {
          midnight: 'mi',
          am: 'a',
          noon: 'n',
          pm: 'p',
          morning1: 'in the morning',
          afternoon1: 'in the afternoon',
          evening1: 'in the evening',
          night1: 'at night'
        },
        wide: {
          :midnight => 'midnight',
          :am => 'AM',
          'variant' => {
            am: 'am',
            pm: 'pm'
          }, :noon => 'noon',
          :pm => 'PM',
          :morning1 => 'in the morning',
          :afternoon1 => 'in the afternoon',
          :evening1 => 'in the evening',
          :night1 => 'at night'
        }
      },
      "stand-alone": {
        abbreviated: {
          midnight: 'midnight',
          am: 'AM',
          noon: 'noon',
          pm: 'PM',
          morning1: 'morning',
          afternoon1: 'afternoon',
          evening1: 'evening',
          night1: 'night'
        },
        wide: {
          midnight: 'midnight',
          am: 'AM',
          noon: 'noon',
          pm: 'PM',
          morning1: 'morning',
          afternoon1: 'afternoon',
          evening1: 'evening',
          night1: 'night'
        }
      }
    },
    fields: {
      era: 'era',
      "era-short": 'era',
      year: 'year',
      "year-short": 'yr.',
      quarter: 'quarter',
      "quarter-short": 'qtr.',
      month: 'month',
      "month-short": 'mo.',
      week: 'week',
      "week-short": 'wk.',
      weekOfMonth: 'week of month',
      "weekOfMonth-short": 'wk. of mo.',
      day: 'day',
      "day-short": 'day',
      dayOfYear: 'day of year',
      "dayOfYear-short": 'day of yr.',
      weekday: 'day of the week',
      "weekday-short": 'day of wk.',
      weekdayOfMonth: 'weekday of the month',
      "weekdayOfMonth-short": 'wkday. of mo.',
      "dayperiod-short": 'AM/PM',
      dayperiod: 'AM/PM',
      hour: 'hour',
      "hour-short": 'hr.',
      minute: 'minute',
      "minute-short": 'min.',
      second: 'second',
      "second-short": 'sec.',
      zone: 'time zone',
      "zone-short": 'zone'
    },
    formats: {
      date: {
        full: {
          pattern: 'EEEE, MMMM d, y'
        }, long: {
          pattern: 'MMMM d, y'
        }, medium: {
          pattern: 'MMM d, y'
        }, short: {
          pattern: 'M/d/yy'
        }
      },
      time: {
        full: {
          pattern: 'h:mm:ss a zzzz'
        }, long: {
          pattern: 'h:mm:ss a z'
        }, medium: {
          pattern: 'h:mm:ss a'
        }, short: {
          pattern: 'h:mm a'
        }
      },
      datetime: {
        full: {
          pattern: "{{date}} 'at' {{time}}"
        }, long: {
          pattern: "{{date}} 'at' {{time}}"
        }, medium: {
          pattern: '{{date}}, {{time}}'
        }, short: {
          pattern: '{{date}}, {{time}}'
        }
      }
    },
    additional_formats: {
      'Bh' => 'h B',
      'Bhm' => 'h:mm B',
      'Bhms' => 'h:mm:ss B',
      'd' => 'd',
      'E' => 'ccc',
      'EBhm' => 'E h:mm B',
      'EBhms' => 'E h:mm:ss B',
      'Ed' => 'd E',
      'Ehm' => 'E h:mm a',
      'EHm' => 'E HH:mm',
      'Ehms' => 'E h:mm:ss a',
      'EHms' => 'E HH:mm:ss',
      'Gy' => 'y G',
      'GyMMM' => 'MMM y G',
      'GyMMMd' => 'MMM d, y G',
      'GyMMMEd' => 'E, MMM d, y G',
      'h' => 'h a',
      'H' => 'HH',
      'hm' => 'h:mm a',
      'Hm' => 'HH:mm',
      'hms' => 'h:mm:ss a',
      'Hms' => 'HH:mm:ss',
      'hmsv' => 'h:mm:ss a v',
      'Hmsv' => 'HH:mm:ss v',
      'hmv' => 'h:mm a v',
      'Hmv' => 'HH:mm v',
      'M' => 'L',
      'Md' => 'M/d',
      'MEd' => 'E, M/d',
      'MMM' => 'LLL',
      'MMMd' => 'MMM d',
      'MMMEd' => 'E, MMM d',
      'MMMMd' => 'MMMM d',
      'MMMMW' => "'week' W 'of' MMMM",
      'ms' => 'mm:ss',
      'y' => 'y',
      'yM' => 'M/y',
      'yMd' => 'M/d/y',
      'yMEd' => 'E, M/d/y',
      'yMMM' => 'MMM y',
      'yMMMd' => 'MMM d, y',
      'yMMMEd' => 'E, MMM d, y',
      'yMMMM' => 'MMMM y',
      'yQQQ' => 'QQQ y',
      'yQQQQ' => 'QQQQ y',
      'yw' => "'week' w 'of' Y"
    }
  },
  'ca' =>
  {
    months: {
      format: {
        abbreviated: {
          1 => 'de gen.',
          2 => 'de febr.',
          3 => 'de mar??',
          4 => 'd???abr.',
          5 => 'de maig',
          6 => 'de juny',
          7 => 'de jul.',
          8 => 'd???ag.',
          9 => 'de set.',
          10 => 'd???oct.',
          11 => 'de nov.',
          12 => 'de des.'
        },
        narrow: {
          1 => 'GN',
          2 => 'FB',
          3 => 'M??',
          4 => 'AB',
          5 => 'MG',
          6 => 'JN',
          7 => 'JL',
          8 => 'AG',
          9 => 'ST',
          10 => 'OC',
          11 => 'NV',
          12 => 'DS'
        },
        wide: {
          1 => 'de gener',
          2 => 'de febrer',
          3 => 'de mar??',
          4 => 'd???abril',
          5 => 'de maig',
          6 => 'de juny',
          7 => 'de juliol',
          8 => 'd???agost',
          9 => 'de setembre',
          10 => 'd???octubre',
          11 => 'de novembre',
          12 => 'de desembre'
        }
      },
      "stand-alone": {
        abbreviated: {
          1 => 'gen.',
          2 => 'febr.',
          3 => 'mar??',
          4 => 'abr.',
          5 => 'maig',
          6 => 'juny',
          7 => 'jul.',
          8 => 'ag.',
          9 => 'set.',
          10 => 'oct.',
          11 => 'nov.',
          12 => 'des.'
        },
        narrow: {
          1 => 'GN',
          2 => 'FB',
          3 => 'M??',
          4 => 'AB',
          5 => 'MG',
          6 => 'JN',
          7 => 'JL',
          8 => 'AG',
          9 => 'ST',
          10 => 'OC',
          11 => 'NV',
          12 => 'DS'
        },
        wide: {
          1 => 'gener',
          2 => 'febrer',
          3 => 'mar??',
          4 => 'abril',
          5 => 'maig',
          6 => 'juny',
          7 => 'juliol',
          8 => 'agost',
          9 => 'setembre',
          10 => 'octubre',
          11 => 'novembre',
          12 => 'desembre'
        }
      }
    },
    days: {
      format: {
        abbreviated: {
          sun: 'dg.',
          mon: 'dl.',
          tue: 'dt.',
          wed: 'dc.',
          thu: 'dj.',
          fri: 'dv.',
          sat: 'ds.'
        },
        narrow: {
          sun: 'dg',
          mon: 'dl',
          tue: 'dt',
          wed: 'dc',
          thu: 'dj',
          fri: 'dv',
          sat: 'ds'
        },
        short: {
          sun: 'dg.',
          mon: 'dl.',
          tue: 'dt.',
          wed: 'dc.',
          thu: 'dj.',
          fri: 'dv.',
          sat: 'ds.'
        },
        wide: {
          sun: 'diumenge',
          mon: 'dilluns',
          tue: 'dimarts',
          wed: 'dimecres',
          thu: 'dijous',
          fri: 'divendres',
          sat: 'dissabte'
        }
      },
      "stand-alone": {
        abbreviated: {
          sun: 'dg.',
          mon: 'dl.',
          tue: 'dt.',
          wed: 'dc.',
          thu: 'dj.',
          fri: 'dv.',
          sat: 'ds.'
        },
        narrow: {
          sun: 'dg',
          mon: 'dl',
          tue: 'dt',
          wed: 'dc',
          thu: 'dj',
          fri: 'dv',
          sat: 'ds'
        },
        short: {
          sun: 'dg.',
          mon: 'dl.',
          tue: 'dt.',
          wed: 'dc.',
          thu: 'dj.',
          fri: 'dv.',
          sat: 'ds.'
        },
        wide: {
          sun: 'diumenge',
          mon: 'dilluns',
          tue: 'dimarts',
          wed: 'dimecres',
          thu: 'dijous',
          fri: 'divendres',
          sat: 'dissabte'
        }
      }
    },
    eras: {
      name: {
        0 => 'abans de l???era cristiana',
        1 => 'era cristiana'
      }, abbr: {
        0 => 'AEC',
        1 => 'EC'
      }, narrow: {
        0 => 'AEC',
        1 => 'EC'
      }
    },
    quarters: {
      format: {
        abbreviated: {
          1 => '1T',
          2 => '2T',
          3 => '3T',
          4 => '4T'
        }, narrow: {
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4'
        }, wide: {
          1 => '1r trimestre',
          2 => '2n trimestre',
          3 => '3r trimestre',
          4 => '4t trimestre'
        }
      },
      "stand-alone": {
        abbreviated: {
          1 => '1T',
          2 => '2T',
          3 => '3T',
          4 => '4T'
        }, narrow: {
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4'
        }, wide: {
          1 => '1r trimestre',
          2 => '2n trimestre',
          3 => '3r trimestre',
          4 => '4t trimestre'
        }
      }
    },
    periods: {
      format: {
        abbreviated: {
          midnight: 'mitjanit',
          am: 'a. m.',
          pm: 'p. m.',
          morning1: 'matinada',
          morning2: 'mat??',
          afternoon1: 'migdia',
          afternoon2: 'tarda',
          evening1: 'vespre',
          night1: 'nit'
        },
        narrow: {
          midnight: 'mitjanit',
          am: 'a. m.',
          pm: 'p. m.',
          morning1: 'mat.',
          morning2: 'mat??',
          afternoon1: 'md',
          afternoon2: 'tarda',
          evening1: 'vespre',
          night1: 'nit'
        },
        wide: {
          midnight: 'mitjanit',
          am: 'a. m.',
          pm: 'p. m.',
          morning1: 'matinada',
          morning2: 'mat??',
          afternoon1: 'migdia',
          afternoon2: 'tarda',
          evening1: 'vespre',
          night1: 'nit'
        }
      },
      "stand-alone": {
        abbreviated: {
          midnight: 'mitjanit',
          am: 'a. m.',
          pm: 'p. m.',
          morning1: 'matinada',
          morning2: 'mat??',
          afternoon1: 'migdia',
          afternoon2: 'tarda',
          evening1: 'vespre',
          night1: 'nit'
        },
        narrow: {
          midnight: 'mitjanit',
          am: 'a. m.',
          pm: 'p. m.',
          morning1: 'matinada',
          morning2: 'mat??',
          afternoon1: 'migdia',
          afternoon2: 'tarda',
          evening1: 'vespre',
          night1: 'nit'
        },
        wide: {
          midnight: 'mitjanit',
          am: 'a. m.',
          pm: 'p. m.',
          morning1: 'matinada',
          morning2: 'mat??',
          afternoon1: 'migdia',
          afternoon2: 'tarda',
          evening1: 'vespre',
          night1: 'nit'
        }
      }
    },
    fields: {
      era: 'era',
      "era-short": 'era',
      "era-narrow": 'era',
      year: 'any',
      "year-short": 'any',
      "year-narrow": 'any',
      quarter: 'trimestre',
      "quarter-short": 'trim.',
      "quarter-narrow": 'trim.',
      month: 'mes',
      "month-short": 'mes',
      "month-narrow": 'mes',
      week: 'setmana',
      "week-short": 'setm.',
      "week-narrow": 'setm.',
      weekOfMonth: 'setmana del mes',
      "weekOfMonth-short": 'setm. del mes',
      "weekOfMonth-narrow": 'setm. del mes',
      day: 'dia',
      "day-short": 'dia',
      "day-narrow": 'dia',
      dayOfYear: 'dia de l???any',
      "dayOfYear-short": 'dia de l???any',
      "dayOfYear-narrow": 'dia de l???any',
      weekday: 'dia de la setmana',
      "weekday-short": 'dia de la setm.',
      "weekday-narrow": 'dia de la setm.',
      weekdayOfMonth: 'dia de la setmana del mes',
      "weekdayOfMonth-short": 'dia de la setm. del mes',
      "weekdayOfMonth-narrow": 'dia de la setm. del mes',
      "dayperiod-short": 'a. m./p. m.',
      dayperiod: 'a. m./p. m.',
      "dayperiod-narrow": 'a. m./p. m.',
      hour: 'hora',
      "hour-short": 'h',
      "hour-narrow": 'h',
      minute: 'minut',
      "minute-short": 'min',
      "minute-narrow": 'min',
      second: 'segon',
      "second-short": 's',
      "second-narrow": 's',
      zone: 'fus horari',
      "zone-short": 'fus horari',
      "zone-narrow": 'fus horari'
    },
    formats: {
      date: {
        full: {
          pattern: "EEEE, d MMMM 'de' y"
        }, long: {
          pattern: "d MMMM 'de' y"
        }, medium: {
          pattern: 'd MMM y'
        }, short: {
          pattern: 'd/M/yy'
        }
      },
      time: {
        full: {
          pattern: 'H:mm:ss zzzz'
        }, long: {
          pattern: 'H:mm:ss z'
        }, medium: {
          pattern: 'H:mm:ss'
        }, short: {
          pattern: 'H:mm'
        }
      },
      datetime: {
        full: {
          pattern: "{{date}} 'a' 'les' {{time}}"
        }, long: {
          pattern: "{{date}} 'a' 'les' {{time}}"
        }, medium: {
          pattern: '{{date}}, {{time}}'
        }, short: {
          pattern: '{{date}} {{time}}'
        }
      }
    },
    additional_formats: {
      'Bh' => 'h B',
      'Bhm' => 'h:mm B',
      'Bhms' => 'h:mm:ss B',
      'd' => 'd',
      'E' => 'ccc',
      'EBhm' => 'E h:mm B',
      'EBhms' => 'E h:mm:ss B',
      'Ed' => 'E d',
      'Ehm' => 'E h:mm a',
      'EHm' => 'E H:mm',
      'Ehms' => 'E h:mm:ss a',
      'EHms' => 'E H:mm:ss',
      'Gy' => 'y G',
      'GyMMM' => 'LLL y G',
      'GyMMMd' => "d MMM 'de' y G",
      'GyMMMEd' => "E, d MMM 'de' y G",
      'GyMMMM' => "LLLL 'de' y G",
      'GyMMMMd' => "d MMMM 'de' y G",
      'GyMMMMEd' => "E, d MMMM 'de' y G",
      'h' => 'h a',
      'H' => 'H',
      'hm' => 'h:mm a',
      'Hm' => 'H:mm',
      'hms' => 'h:mm:ss a',
      'Hms' => 'H:mm:ss',
      'hmsv' => 'h:mm:ss a v',
      'Hmsv' => 'H:mm:ss v',
      'hmv' => 'h:mm a v',
      'Hmv' => 'H:mm v',
      'M' => 'L',
      'Md' => 'd/M',
      'MEd' => 'E d/M',
      'MMM' => 'LLL',
      'MMMd' => 'd MMM',
      'MMMEd' => 'E, d MMM',
      'MMMMd' => 'd MMMM',
      'MMMMEd' => 'E, d MMMM',
      'MMMMW' => "'setmana' W MMMM",
      'ms' => 'mm:ss',
      'y' => 'y',
      'yM' => 'M/y',
      'yMd' => 'd/M/y',
      'yMEd' => 'E, d/M/y',
      'yMMM' => "LLL 'de' y",
      'yMMMd' => "d MMM 'de' y",
      'yMMMEd' => 'E, d MMM y',
      'yMMMM' => "LLLL 'de' y",
      'yMMMMd' => "d MMMM 'de' y",
      'yMMMMEd' => "E, d MMMM 'de' y",
      'yQQQ' => 'QQQ y',
      'yQQQQ' => 'QQQQ y',
      'yw' => "'setmana' w 'de' Y"
    }
  },
  'de' =>
  {
    months: {
      format: {
        abbreviated: {
          1 => 'Jan.',
          2 => 'Feb.',
          3 => 'M??rz',
          4 => 'Apr.',
          5 => 'Mai',
          6 => 'Juni',
          7 => 'Juli',
          8 => 'Aug.',
          9 => 'Sept.',
          10 => 'Okt.',
          11 => 'Nov.',
          12 => 'Dez.'
        },
        narrow: {
          1 => 'J',
          2 => 'F',
          3 => 'M',
          4 => 'A',
          5 => 'M',
          6 => 'J',
          7 => 'J',
          8 => 'A',
          9 => 'S',
          10 => 'O',
          11 => 'N',
          12 => 'D'
        },
        wide: {
          1 => 'Januar',
          2 => 'Februar',
          3 => 'M??rz',
          4 => 'April',
          5 => 'Mai',
          6 => 'Juni',
          7 => 'Juli',
          8 => 'August',
          9 => 'September',
          10 => 'Oktober',
          11 => 'November',
          12 => 'Dezember'
        }
      },
      "stand-alone": {
        abbreviated: {
          1 => 'Jan',
          2 => 'Feb',
          3 => 'M??r',
          4 => 'Apr',
          5 => 'Mai',
          6 => 'Jun',
          7 => 'Jul',
          8 => 'Aug',
          9 => 'Sep',
          10 => 'Okt',
          11 => 'Nov',
          12 => 'Dez'
        },
        narrow: {
          1 => 'J',
          2 => 'F',
          3 => 'M',
          4 => 'A',
          5 => 'M',
          6 => 'J',
          7 => 'J',
          8 => 'A',
          9 => 'S',
          10 => 'O',
          11 => 'N',
          12 => 'D'
        },
        wide: {
          1 => 'Januar',
          2 => 'Februar',
          3 => 'M??rz',
          4 => 'April',
          5 => 'Mai',
          6 => 'Juni',
          7 => 'Juli',
          8 => 'August',
          9 => 'September',
          10 => 'Oktober',
          11 => 'November',
          12 => 'Dezember'
        }
      }
    },
    days: {
      format: {
        abbreviated: {
          sun: 'So.',
          mon: 'Mo.',
          tue: 'Di.',
          wed: 'Mi.',
          thu: 'Do.',
          fri: 'Fr.',
          sat: 'Sa.'
        },
        narrow: {
          sun: 'S',
          mon: 'M',
          tue: 'D',
          wed: 'M',
          thu: 'D',
          fri: 'F',
          sat: 'S'
        },
        short: {
          sun: 'So.',
          mon: 'Mo.',
          tue: 'Di.',
          wed: 'Mi.',
          thu: 'Do.',
          fri: 'Fr.',
          sat: 'Sa.'
        },
        wide: {
          sun: 'Sonntag',
          mon: 'Montag',
          tue: 'Dienstag',
          wed: 'Mittwoch',
          thu: 'Donnerstag',
          fri: 'Freitag',
          sat: 'Samstag'
        }
      },
      "stand-alone": {
        abbreviated: {
          sun: 'So',
          mon: 'Mo',
          tue: 'Di',
          wed: 'Mi',
          thu: 'Do',
          fri: 'Fr',
          sat: 'Sa'
        },
        narrow: {
          sun: 'S',
          mon: 'M',
          tue: 'D',
          wed: 'M',
          thu: 'D',
          fri: 'F',
          sat: 'S'
        },
        short: {
          sun: 'So.',
          mon: 'Mo.',
          tue: 'Di.',
          wed: 'Mi.',
          thu: 'Do.',
          fri: 'Fr.',
          sat: 'Sa.'
        },
        wide: {
          sun: 'Sonntag',
          mon: 'Montag',
          tue: 'Dienstag',
          wed: 'Mittwoch',
          thu: 'Donnerstag',
          fri: 'Freitag',
          sat: 'Samstag'
        }
      }
    },
    eras: {
      name: {
        0 => 'vor unserer Zeitrechnung',
        1 => 'unserer Zeitrechnung'
      }, abbr: {
        0 => 'v. u. Z.',
        1 => 'u. Z.'
      }, narrow: {
        0 => 'v. u. Z.',
        1 => 'u. Z.'
      }
    },
    quarters: {
      format: {
        abbreviated: {
          1 => 'Q1',
          2 => 'Q2',
          3 => 'Q3',
          4 => 'Q4'
        }, narrow: {
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4'
        }, wide: {
          1 => '1. Quartal',
          2 => '2. Quartal',
          3 => '3. Quartal',
          4 => '4. Quartal'
        }
      },
      "stand-alone": {
        abbreviated: {
          1 => 'Q1',
          2 => 'Q2',
          3 => 'Q3',
          4 => 'Q4'
        }, narrow: {
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4'
        }, wide: {
          1 => '1. Quartal',
          2 => '2. Quartal',
          3 => '3. Quartal',
          4 => '4. Quartal'
        }
      }
    },
    periods: {
      format: {
        abbreviated: {
          midnight: 'Mitternacht',
          am: 'AM',
          pm: 'PM',
          morning1: 'morgens',
          morning2: 'vormittags',
          afternoon1: 'mittags',
          afternoon2: 'nachmittags',
          evening1: 'abends',
          night1: 'nachts'
        },
        narrow: {
          midnight: 'Mitternacht',
          am: 'a',
          pm: 'p',
          morning1: 'morgens',
          morning2: 'vormittags',
          afternoon1: 'mittags',
          afternoon2: 'nachmittags',
          evening1: 'abends',
          night1: 'nachts'
        },
        wide: {
          midnight: 'Mitternacht',
          am: 'AM',
          pm: 'PM',
          morning1: 'morgens',
          morning2: 'vormittags',
          afternoon1: 'mittags',
          afternoon2: 'nachmittags',
          evening1: 'abends',
          night1: 'nachts'
        }
      },
      "stand-alone": {
        abbreviated: {
          midnight: 'Mitternacht',
          am: 'AM',
          pm: 'PM',
          morning1: 'Morgen',
          morning2: 'Vormittag',
          afternoon1: 'Mittag',
          afternoon2: 'Nachmittag',
          evening1: 'Abend',
          night1: 'Nacht'
        },
        narrow: {
          midnight: 'Mitternacht',
          am: 'a',
          pm: 'p',
          morning1: 'Morgen',
          morning2: 'Vormittag',
          afternoon1: 'Mittag',
          afternoon2: 'Nachmittag',
          evening1: 'Abend',
          night1: 'Nacht'
        },
        wide: {
          midnight: 'Mitternacht',
          am: 'AM',
          pm: 'PM',
          morning1: 'Morgen',
          morning2: 'Vormittag',
          afternoon1: 'Mittag',
          afternoon2: 'Nachmittag',
          evening1: 'Abend',
          night1: 'Nacht'
        }
      }
    },
    fields: {
      era: 'Epoche',
      "era-short": 'Epoche',
      "era-narrow": 'E',
      year: 'Jahr',
      "year-short": 'Jahr',
      "year-narrow": 'J',
      quarter: 'Quartal',
      "quarter-short": 'Quart.',
      "quarter-narrow": 'Q',
      month: 'Monat',
      "month-short": 'Monat',
      "month-narrow": 'M',
      week: 'Woche',
      "week-short": 'Woche',
      "week-narrow": 'W',
      weekOfMonth: 'Woche des Monats',
      "weekOfMonth-short": 'W/M',
      "weekOfMonth-narrow": 'Wo. des Monats',
      day: 'Tag',
      "day-short": 'Tag',
      "day-narrow": 'Tag',
      dayOfYear: 'Tag des Jahres',
      "dayOfYear-short": 'Tag des Jahres',
      "dayOfYear-narrow": 'T/J',
      weekday: 'Wochentag',
      "weekday-short": 'Wochentag',
      "weekday-narrow": 'Wochent.',
      weekdayOfMonth: 'Wochentag',
      "weekdayOfMonth-short": 'Wochentag',
      "weekdayOfMonth-narrow": 'WT',
      "dayperiod-short": 'Tagesh??lfte',
      dayperiod: 'Tagesh??lfte',
      "dayperiod-narrow": 'Tagesh.',
      hour: 'Stunde',
      "hour-short": 'Std.',
      "hour-narrow": 'Std.',
      minute: 'Minute',
      "minute-short": 'Min.',
      "minute-narrow": 'Min.',
      second: 'Sekunde',
      "second-short": 'Sek.',
      "second-narrow": 'Sek.',
      zone: 'Zeitzone',
      "zone-short": 'Zeitzone',
      "zone-narrow": 'Zeitz.'
    },
    formats: {
      date: {
        full: {
          pattern: 'EEEE, d. MMMM y'
        }, long: {
          pattern: 'd. MMMM y'
        }, medium: {
          pattern: 'dd.MM.y'
        }, short: {
          pattern: 'dd.MM.yy'
        }
      },
      time: {
        full: {
          pattern: 'HH:mm:ss zzzz'
        }, long: {
          pattern: 'HH:mm:ss z'
        }, medium: {
          pattern: 'HH:mm:ss'
        }, short: {
          pattern: 'HH:mm'
        }
      },
      datetime: {
        full: {
          pattern: "{{date}} 'um' {{time}}"
        }, long: {
          pattern: "{{date}} 'um' {{time}}"
        }, medium: {
          pattern: '{{date}}, {{time}}'
        }, short: {
          pattern: '{{date}}, {{time}}'
        }
      }
    },
    additional_formats: {
      'Bh' => 'h B',
      'Bhm' => 'h:mm B',
      'Bhms' => 'h:mm:ss B',
      'd' => 'd',
      'E' => 'ccc',
      'EBhm' => 'E h:mm B',
      'EBhms' => 'E h:mm:ss B',
      'Ed' => 'E, d.',
      'Ehm' => 'E h:mm a',
      'EHm' => 'E, HH:mm',
      'Ehms' => 'E, h:mm:ss a',
      'EHms' => 'E, HH:mm:ss',
      'Gy' => 'y G',
      'GyMMM' => 'MMM y G',
      'GyMMMd' => 'd. MMM y G',
      'GyMMMEd' => 'E, d. MMM y G',
      'h' => "h 'Uhr' a",
      'H' => "HH 'Uhr'",
      'hm' => 'h:mm a',
      'Hm' => 'HH:mm',
      'hms' => 'h:mm:ss a',
      'Hms' => 'HH:mm:ss',
      'hmsv' => 'h:mm:ss a v',
      'Hmsv' => 'HH:mm:ss v',
      'hmv' => 'h:mm a v',
      'Hmv' => 'HH:mm v',
      'M' => 'L',
      'Md' => 'd.M.',
      'MEd' => 'E, d.M.',
      'MMd' => 'd.MM.',
      'MMdd' => 'dd.MM.',
      'MMM' => 'LLL',
      'MMMd' => 'd. MMM',
      'MMMEd' => 'E, d. MMM',
      'MMMMd' => 'd. MMMM',
      'MMMMEd' => 'E, d. MMMM',
      'MMMMW' => "'Woche' W 'im' MMM",
      'ms' => 'mm:ss',
      'y' => 'y',
      'yM' => 'M.y',
      'yMd' => 'd.M.y',
      'yMEd' => 'E, d.M.y',
      'yMM' => 'MM.y',
      'yMMdd' => 'dd.MM.y',
      'yMMM' => 'MMM y',
      'yMMMd' => 'd. MMM y',
      'yMMMEd' => 'E, d. MMM y',
      'yMMMM' => 'MMMM y',
      'yQQQ' => 'QQQ y',
      'yQQQQ' => 'QQQQ y',
      'yw' => "'Woche' w 'des' 'Jahres' Y"
    }
  },
  'pt' =>
  {
    months: {
      format: {
        abbreviated: {
          1 => 'jan',
          2 => 'fev',
          3 => 'mar',
          4 => 'abr',
          5 => 'mai',
          6 => 'jun',
          7 => 'jul',
          8 => 'ago',
          9 => 'set',
          10 => 'out',
          11 => 'nov',
          12 => 'dez'
        },
        narrow: {
          1 => 'J',
          2 => 'F',
          3 => 'M',
          4 => 'A',
          5 => 'M',
          6 => 'J',
          7 => 'J',
          8 => 'A',
          9 => 'S',
          10 => 'O',
          11 => 'N',
          12 => 'D'
        },
        wide: {
          1 => 'janeiro',
          2 => 'fevereiro',
          3 => 'mar??o',
          4 => 'abril',
          5 => 'maio',
          6 => 'junho',
          7 => 'julho',
          8 => 'agosto',
          9 => 'setembro',
          10 => 'outubro',
          11 => 'novembro',
          12 => 'dezembro'
        }
      },
      "stand-alone": {
        abbreviated: {
          1 => 'jan',
          2 => 'fev',
          3 => 'mar',
          4 => 'abr',
          5 => 'mai',
          6 => 'jun',
          7 => 'jul',
          8 => 'ago',
          9 => 'set',
          10 => 'out',
          11 => 'nov',
          12 => 'dez'
        },
        narrow: {
          1 => 'J',
          2 => 'F',
          3 => 'M',
          4 => 'A',
          5 => 'M',
          6 => 'J',
          7 => 'J',
          8 => 'A',
          9 => 'S',
          10 => 'O',
          11 => 'N',
          12 => 'D'
        },
        wide: {
          1 => 'janeiro',
          2 => 'fevereiro',
          3 => 'mar??o',
          4 => 'abril',
          5 => 'maio',
          6 => 'junho',
          7 => 'julho',
          8 => 'agosto',
          9 => 'setembro',
          10 => 'outubro',
          11 => 'novembro',
          12 => 'dezembro'
        }
      }
    },
    days: {
      format: {
        abbreviated: {
          sun: 'dom',
          mon: 'seg',
          tue: 'ter',
          wed: 'qua',
          thu: 'qui',
          fri: 'sex',
          sat: 's??b'
        },
        narrow: {
          sun: 'D',
          mon: 'S',
          tue: 'T',
          wed: 'Q',
          thu: 'Q',
          fri: 'S',
          sat: 'S'
        },
        short: {
          sun: 'dom',
          mon: 'seg',
          tue: 'ter',
          wed: 'qua',
          thu: 'qui',
          fri: 'sex',
          sat: 's??b'
        },
        wide: {
          sun: 'domingo',
          mon: 'segunda-feira',
          tue: 'ter??a-feira',
          wed: 'quarta-feira',
          thu: 'quinta-feira',
          fri: 'sexta-feira',
          sat: 's??bado'
        }
      },
      "stand-alone": {
        abbreviated: {
          sun: 'dom',
          mon: 'seg',
          tue: 'ter',
          wed: 'qua',
          thu: 'qui',
          fri: 'sex',
          sat: 's??b'
        },
        narrow: {
          sun: 'D',
          mon: 'S',
          tue: 'T',
          wed: 'Q',
          thu: 'Q',
          fri: 'S',
          sat: 'S'
        },
        short: {
          sun: 'dom',
          mon: 'seg',
          tue: 'ter',
          wed: 'qua',
          thu: 'qui',
          fri: 'sex',
          sat: 's??b'
        },
        wide: {
          sun: 'domingo',
          mon: 'segunda-feira',
          tue: 'ter??a-feira',
          wed: 'quarta-feira',
          thu: 'quinta-feira',
          fri: 'sexta-feira',
          sat: 's??bado'
        }
      }
    },
    eras: {
      name: {
        0 => 'antes da Era Comum',
        1 => 'Era Comum'
      }, abbr: {
        0 => 'AEC',
        1 => 'EC'
      }
    },
    quarters: {
      format: {
        abbreviated: {
          1 => 'T1',
          2 => 'T2',
          3 => 'T3',
          4 => 'T4'
        }, narrow: {
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4'
        }, wide: {
          1 => '1?? trimestre',
          2 => '2?? trimestre',
          3 => '3?? trimestre',
          4 => '4?? trimestre'
        }
      },
      "stand-alone": {
        abbreviated: {
          1 => 'T1',
          2 => 'T2',
          3 => 'T3',
          4 => 'T4'
        }, narrow: {
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4'
        }, wide: {
          1 => '1?? trimestre',
          2 => '2?? trimestre',
          3 => '3?? trimestre',
          4 => '4?? trimestre'
        }
      }
    },
    periods: {
      format: {
        abbreviated: {
          midnight: 'meia-noite',
          am: 'AM',
          noon: 'meio-dia',
          pm: 'PM',
          morning1: 'da manh??',
          afternoon1: 'da tarde',
          evening1: 'da noite',
          night1: 'da madrugada'
        },
        narrow: {
          midnight: 'meia-noite',
          am: 'AM',
          noon: 'meio-dia',
          pm: 'PM',
          morning1: 'da manh??',
          afternoon1: 'da tarde',
          evening1: 'da noite',
          night1: 'da madrugada'
        },
        wide: {
          midnight: 'meia-noite',
          am: 'AM',
          noon: 'meio-dia',
          pm: 'PM',
          morning1: 'da manh??',
          afternoon1: 'da tarde',
          evening1: 'da noite',
          night1: 'da madrugada'
        }
      },
      "stand-alone": {
        abbreviated: {
          midnight: 'meia-noite',
          am: 'AM',
          noon: 'meio-dia',
          pm: 'PM',
          morning1: 'manh??',
          afternoon1: 'tarde',
          evening1: 'noite',
          night1: 'madrugada'
        },
        narrow: {
          midnight: 'meia-noite',
          am: 'AM',
          noon: 'meio-dia',
          pm: 'PM',
          morning1: 'manh??',
          afternoon1: 'tarde',
          evening1: 'noite',
          night1: 'madrugada'
        },
        wide: {
          midnight: 'meia-noite',
          am: 'AM',
          noon: 'meio-dia',
          pm: 'PM',
          morning1: 'manh??',
          afternoon1: 'tarde',
          evening1: 'noite',
          night1: 'madrugada'
        }
      }
    },
    fields: {
      era: 'era',
      "era-short": 'era',
      "era-narrow": 'era',
      year: 'ano',
      "year-short": 'ano',
      "year-narrow": 'ano',
      quarter: 'trimestre',
      "quarter-short": 'trim.',
      "quarter-narrow": 'trim.',
      month: 'm??s',
      "month-short": 'm??s',
      "month-narrow": 'm??s',
      week: 'semana',
      "week-short": 'sem.',
      "week-narrow": 'sem.',
      weekOfMonth: 'semana do m??s',
      "weekOfMonth-short": 'sem. do m??s',
      "weekOfMonth-narrow": 'sem. do m??s',
      day: 'dia',
      "day-short": 'dia',
      "day-narrow": 'dia',
      dayOfYear: 'dia do ano',
      "dayOfYear-short": 'dia do ano',
      "dayOfYear-narrow": 'dia do ano',
      weekday: 'dia da semana',
      "weekday-short": 'dia da sem.',
      "weekday-narrow": 'dia da sem.',
      weekdayOfMonth: 'dia da semana do m??s',
      "weekdayOfMonth-short": 'dia da sem. do m??s',
      "weekdayOfMonth-narrow": 'dia da sem. do m??s',
      "dayperiod-short": 'AM/PM',
      dayperiod: 'AM/PM',
      "dayperiod-narrow": 'AM/PM',
      hour: 'hora',
      "hour-short": 'h',
      "hour-narrow": 'h',
      minute: 'minuto',
      "minute-short": 'min.',
      "minute-narrow": 'min.',
      second: 'segundo',
      "second-short": 'seg.',
      "second-narrow": 'seg.',
      zone: 'fuso hor??rio',
      "zone-short": 'fuso',
      "zone-narrow": 'fuso'
    },
    formats: {
      date: {
        full: {
          pattern: "EEEE, d 'de' MMMM 'de' y"
        }, long: {
          pattern: "d 'de' MMMM 'de' y"
        }, medium: {
          pattern: "d 'de' MMM 'de' y"
        }, short: {
          pattern: 'dd/MM/y'
        }
      },
      time: {
        full: {
          pattern: 'HH:mm:ss zzzz'
        }, long: {
          pattern: 'HH:mm:ss z'
        }, medium: {
          pattern: 'HH:mm:ss'
        }, short: {
          pattern: 'HH:mm'
        }
      },
      datetime: {
        full: {
          pattern: '{{date}} {{time}}'
        }, long: {
          pattern: '{{date}} {{time}}'
        }, medium: {
          pattern: '{{date}} {{time}}'
        }, short: {
          pattern: '{{date}} {{time}}'
        }
      }
    },
    additional_formats: {
      'Bh' => 'h B',
      'Bhm' => 'h:mm B',
      'Bhms' => 'h:mm:ss B',
      'd' => 'd',
      'E' => 'ccc',
      'EBhm' => 'E h:mm B',
      'EBhms' => 'E h:mm:ss B',
      'Ed' => 'E, d',
      'Ehm' => 'E, h:mm a',
      'EHm' => 'E, HH:mm',
      'Ehms' => 'E, h:mm:ss a',
      'EHms' => 'E, HH:mm:ss',
      'Gy' => 'y G',
      'GyMMM' => "MMM 'de' y G",
      'GyMMMd' => "d 'de' MMM 'de' y G",
      'GyMMMEd' => "E, d 'de' MMM 'de' y G",
      'h' => 'h a',
      'H' => 'HH',
      'hm' => 'h:mm a',
      'Hm' => 'HH:mm',
      'hms' => 'h:mm:ss a',
      'Hms' => 'HH:mm:ss',
      'hmsv' => 'h:mm:ss a v',
      'Hmsv' => 'HH:mm:ss v',
      'hmv' => 'h:mm a v',
      'Hmv' => 'HH:mm v',
      'M' => 'L',
      'Md' => 'd/M',
      'MEd' => 'E, dd/MM',
      'MMdd' => 'dd/MM',
      'MMM' => 'LLL',
      'MMMd' => "d 'de' MMM",
      'MMMEd' => "E, d 'de' MMM",
      'MMMMd' => "d 'de' MMMM",
      'MMMMEd' => "E, d 'de' MMMM",
      'MMMMW' => "W'??' 'semana' 'de' MMMM",
      'ms' => 'mm:ss',
      'y' => 'y',
      'yM' => 'MM/y',
      'yMd' => 'dd/MM/y',
      'yMEd' => 'E, dd/MM/y',
      'yMM' => 'MM/y',
      'yMMM' => "MMM 'de' y",
      'yMMMd' => "d 'de' MMM 'de' y",
      'yMMMEd' => "E, d 'de' MMM 'de' y",
      'yMMMM' => "MMMM 'de' y",
      'yMMMMd' => "d 'de' MMMM 'de' y",
      'yMMMMEd' => "E, d 'de' MMMM 'de' y",
      'yQQQ' => "QQQ 'de' y",
      'yQQQQ' => "QQQQ 'de' y",
      'yw' => "w'??' 'semana' 'de' Y"
    }
  },
  'ja' =>
  {
    months: {
      format: {
        abbreviated: {
          1 => '1???',
          2 => '2???',
          3 => '3???',
          4 => '4???',
          5 => '5???',
          6 => '6???',
          7 => '7???',
          8 => '8???',
          9 => '9???',
          10 => '10???',
          11 => '11???',
          12 => '12???'
        },
        narrow: {
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4',
          5 => '5',
          6 => '6',
          7 => '7',
          8 => '8',
          9 => '9',
          10 => '10',
          11 => '11',
          12 => '12'
        },
        wide: {
          1 => '1???',
          2 => '2???',
          3 => '3???',
          4 => '4???',
          5 => '5???',
          6 => '6???',
          7 => '7???',
          8 => '8???',
          9 => '9???',
          10 => '10???',
          11 => '11???',
          12 => '12???'
        }
      },
      "stand-alone": {
        abbreviated: {
          1 => '1???',
          2 => '2???',
          3 => '3???',
          4 => '4???',
          5 => '5???',
          6 => '6???',
          7 => '7???',
          8 => '8???',
          9 => '9???',
          10 => '10???',
          11 => '11???',
          12 => '12???'
        },
        narrow: {
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4',
          5 => '5',
          6 => '6',
          7 => '7',
          8 => '8',
          9 => '9',
          10 => '10',
          11 => '11',
          12 => '12'
        },
        wide: {
          1 => '1???',
          2 => '2???',
          3 => '3???',
          4 => '4???',
          5 => '5???',
          6 => '6???',
          7 => '7???',
          8 => '8???',
          9 => '9???',
          10 => '10???',
          11 => '11???',
          12 => '12???'
        }
      }
    },
    days: {
      format: {
        abbreviated: {
          sun: '???',
          mon: '???',
          tue: '???',
          wed: '???',
          thu: '???',
          fri: '???',
          sat: '???'
        },
        narrow: {
          sun: '???',
          mon: '???',
          tue: '???',
          wed: '???',
          thu: '???',
          fri: '???',
          sat: '???'
        },
        short: {
          sun: '???',
          mon: '???',
          tue: '???',
          wed: '???',
          thu: '???',
          fri: '???',
          sat: '???'
        },
        wide: {
          sun: '?????????',
          mon: '?????????',
          tue: '?????????',
          wed: '?????????',
          thu: '?????????',
          fri: '?????????',
          sat: '?????????'
        }
      },
      "stand-alone": {
        abbreviated: {
          sun: '???',
          mon: '???',
          tue: '???',
          wed: '???',
          thu: '???',
          fri: '???',
          sat: '???'
        },
        narrow: {
          sun: '???',
          mon: '???',
          tue: '???',
          wed: '???',
          thu: '???',
          fri: '???',
          sat: '???'
        },
        short: {
          sun: '???',
          mon: '???',
          tue: '???',
          wed: '???',
          thu: '???',
          fri: '???',
          sat: '???'
        },
        wide: {
          sun: '?????????',
          mon: '?????????',
          tue: '?????????',
          wed: '?????????',
          thu: '?????????',
          fri: '?????????',
          sat: '?????????'
        }
      }
    },
    eras: {
      name: {
        0 => '???????????????',
        1 => '????????????'
      }, abbr: {
        0 => '???????????????',
        1 => '????????????'
      }, narrow: {
        0 => 'BCE',
        1 => 'CE'
      }
    },
    quarters: {
      format: {
        abbreviated: {
          1 => 'Q1',
          2 => 'Q2',
          3 => 'Q3',
          4 => 'Q4'
        }, narrow: {
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4'
        }, wide: {
          1 => '???1?????????',
          2 => '???2?????????',
          3 => '???3?????????',
          4 => '???4?????????'
        }
      },
      "stand-alone": {
        abbreviated: {
          1 => 'Q1',
          2 => 'Q2',
          3 => 'Q3',
          4 => 'Q4'
        }, narrow: {
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4'
        }, wide: {
          1 => '???1?????????',
          2 => '???2?????????',
          3 => '???3?????????',
          4 => '???4?????????'
        }
      }
    },
    periods: {
      format: {
        abbreviated: {
          midnight: '?????????',
          am: '??????',
          noon: '??????',
          pm: '??????',
          morning1: '???',
          afternoon1: '???',
          evening1: '??????',
          night1: '???',
          night2: '??????'
        },
        narrow: {
          midnight: '?????????',
          am: '??????',
          noon: '??????',
          pm: '??????',
          morning1: '???',
          afternoon1: '???',
          evening1: '??????',
          night1: '???',
          night2: '??????'
        },
        wide: {
          midnight: '?????????',
          am: '??????',
          noon: '??????',
          pm: '??????',
          morning1: '???',
          afternoon1: '???',
          evening1: '??????',
          night1: '???',
          night2: '??????'
        }
      },
      "stand-alone": {
        abbreviated: {
          midnight: '?????????',
          am: '??????',
          noon: '??????',
          pm: '??????',
          morning1: '???',
          afternoon1: '???',
          evening1: '??????',
          night1: '???',
          night2: '??????'
        },
        narrow: {
          midnight: '?????????',
          am: '??????',
          noon: '??????',
          pm: '??????',
          morning1: '???',
          afternoon1: '???',
          evening1: '??????',
          night1: '???',
          night2: '??????'
        },
        wide: {
          midnight: '?????????',
          am: '??????',
          noon: '??????',
          pm: '??????',
          morning1: '???',
          afternoon1: '???',
          evening1: '??????',
          night1: '???',
          night2: '??????'
        }
      }
    },
    fields: {
      era: '??????',
      "era-short": '??????',
      "era-narrow": '??????',
      year: '???',
      "year-short": '???',
      "year-narrow": '???',
      quarter: '?????????',
      "quarter-short": '?????????',
      "quarter-narrow": '?????????',
      month: '???',
      "month-short": '???',
      "month-narrow": '???',
      week: '???',
      "week-short": '???',
      "week-narrow": '???',
      weekOfMonth: '???????????????',
      "weekOfMonth-short": '???????????????',
      "weekOfMonth-narrow": '???????????????',
      day: '???',
      "day-short": '???',
      "day-narrow": '???',
      dayOfYear: '????????????',
      "dayOfYear-short": '????????????',
      "dayOfYear-narrow": '??????',
      weekday: '??????',
      "weekday-short": '??????',
      "weekday-narrow": '??????',
      weekdayOfMonth: '??????????????????',
      "weekdayOfMonth-short": '??????????????????',
      "weekdayOfMonth-narrow": '??????????????????',
      "dayperiod-short": '??????/??????',
      dayperiod: '??????/??????',
      "dayperiod-narrow": '??????/??????',
      hour: '???',
      "hour-short": '???',
      "hour-narrow": '???',
      minute: '???',
      "minute-short": '???',
      "minute-narrow": '???',
      second: '???',
      "second-short": '???',
      "second-narrow": '???',
      zone: '??????????????????',
      "zone-short": '??????????????????',
      "zone-narrow": '??????????????????'
    },
    formats: {
      date: {
        full: {
          pattern: 'y???M???d???EEEE'
        }, long: {
          pattern: 'y???M???d???'
        }, medium: {
          pattern: 'y/MM/dd'
        }, short: {
          pattern: 'y/MM/dd'
        }
      },
      time: {
        full: {
          pattern: 'H???mm???ss??? zzzz'
        }, long: {
          pattern: 'H:mm:ss z'
        }, medium: {
          pattern: 'H:mm:ss'
        }, short: {
          pattern: 'H:mm'
        }
      },
      datetime: {
        full: {
          pattern: '{{date}} {{time}}'
        }, long: {
          pattern: '{{date}} {{time}}'
        }, medium: {
          pattern: '{{date}} {{time}}'
        }, short: {
          pattern: '{{date}} {{time}}'
        }
      }
    },
    additional_formats: {
      'Bh' => 'BK???',
      'Bhm' => 'BK:mm',
      'Bhms' => 'BK:mm:ss',
      'd' => 'd???',
      'E' => 'ccc',
      'EBhm' => 'BK:mm (E)',
      'EBhms' => 'BK:mm:ss (E)',
      'Ed' => 'd???(E)',
      'EEEEd' => 'd???EEEE',
      'Ehm' => 'aK:mm (E)',
      'EHm' => 'H:mm (E)',
      'Ehms' => 'aK:mm:ss (E)',
      'EHms' => 'H:mm:ss (E)',
      'Gy' => 'Gy???',
      'GyMMM' => 'Gy???M???',
      'GyMMMd' => 'Gy???M???d???',
      'GyMMMEd' => 'Gy???M???d???(E)',
      'GyMMMEEEEd' => 'Gy???M???d???EEEE',
      'h' => 'aK???',
      'H' => 'H???',
      'hm' => 'aK:mm',
      'Hm' => 'H:mm',
      'hms' => 'aK:mm:ss',
      'Hms' => 'H:mm:ss',
      'hmsv' => 'aK:mm:ss v',
      'Hmsv' => 'H:mm:ss v',
      'hmv' => 'aK:mm v',
      'Hmv' => 'H:mm v',
      'M' => 'M???',
      'Md' => 'M/d',
      'MEd' => 'M/d(E)',
      'MEEEEd' => 'M/dEEEE',
      'MMM' => 'M???',
      'MMMd' => 'M???d???',
      'MMMEd' => 'M???d???(E)',
      'MMMEEEEd' => 'M???d???EEEE',
      'MMMMd' => 'M???d???',
      'MMMMW' => 'M??????W???',
      'ms' => 'mm:ss',
      'y' => 'y???',
      'yM' => 'y/M',
      'yMd' => 'y/M/d',
      'yMEd' => 'y/M/d(E)',
      'yMEEEEd' => 'y/M/dEEEE',
      'yMM' => 'y/MM',
      'yMMM' => 'y???M???',
      'yMMMd' => 'y???M???d???',
      'yMMMEd' => 'y???M???d???(E)',
      'yMMMEEEEd' => 'y???M???d???EEEE',
      'yMMMM' => 'y???M???',
      'yQQQ' => 'y/QQQ',
      'yQQQQ' => 'y???QQQQ',
      'yw' => 'Y??????w???'
    }
  },
  'fr' =>
  {
    months: {
      format: {
        abbreviated: {
          1 => 'janv.',
          2 => 'f??vr.',
          3 => 'mars',
          4 => 'avr.',
          5 => 'mai',
          6 => 'juin',
          7 => 'juil.',
          8 => 'ao??t',
          9 => 'sept.',
          10 => 'oct.',
          11 => 'nov.',
          12 => 'd??c.'
        },
        narrow: {
          1 => 'J',
          2 => 'F',
          3 => 'M',
          4 => 'A',
          5 => 'M',
          6 => 'J',
          7 => 'J',
          8 => 'A',
          9 => 'S',
          10 => 'O',
          11 => 'N',
          12 => 'D'
        },
        wide: {
          1 => 'janvier',
          2 => 'f??vrier',
          3 => 'mars',
          4 => 'avril',
          5 => 'mai',
          6 => 'juin',
          7 => 'juillet',
          8 => 'ao??t',
          9 => 'septembre',
          10 => 'octobre',
          11 => 'novembre',
          12 => 'd??cembre'
        }
      },
      "stand-alone": {
        abbreviated: {
          1 => 'janv.',
          2 => 'f??vr.',
          3 => 'mars',
          4 => 'avr.',
          5 => 'mai',
          6 => 'juin',
          7 => 'juil.',
          8 => 'ao??t',
          9 => 'sept.',
          10 => 'oct.',
          11 => 'nov.',
          12 => 'd??c.'
        },
        narrow: {
          1 => 'J',
          2 => 'F',
          3 => 'M',
          4 => 'A',
          5 => 'M',
          6 => 'J',
          7 => 'J',
          8 => 'A',
          9 => 'S',
          10 => 'O',
          11 => 'N',
          12 => 'D'
        },
        wide: {
          1 => 'janvier',
          2 => 'f??vrier',
          3 => 'mars',
          4 => 'avril',
          5 => 'mai',
          6 => 'juin',
          7 => 'juillet',
          8 => 'ao??t',
          9 => 'septembre',
          10 => 'octobre',
          11 => 'novembre',
          12 => 'd??cembre'
        }
      }
    },
    days: {
      format: {
        abbreviated: {
          sun: 'dim.',
          mon: 'lun.',
          tue: 'mar.',
          wed: 'mer.',
          thu: 'jeu.',
          fri: 'ven.',
          sat: 'sam.'
        },
        narrow: {
          sun: 'D',
          mon: 'L',
          tue: 'M',
          wed: 'M',
          thu: 'J',
          fri: 'V',
          sat: 'S'
        },
        short: {
          sun: 'di',
          mon: 'lu',
          tue: 'ma',
          wed: 'me',
          thu: 'je',
          fri: 've',
          sat: 'sa'
        },
        wide: {
          sun: 'dimanche',
          mon: 'lundi',
          tue: 'mardi',
          wed: 'mercredi',
          thu: 'jeudi',
          fri: 'vendredi',
          sat: 'samedi'
        }
      },
      "stand-alone": {
        abbreviated: {
          sun: 'dim.',
          mon: 'lun.',
          tue: 'mar.',
          wed: 'mer.',
          thu: 'jeu.',
          fri: 'ven.',
          sat: 'sam.'
        },
        narrow: {
          sun: 'D',
          mon: 'L',
          tue: 'M',
          wed: 'M',
          thu: 'J',
          fri: 'V',
          sat: 'S'
        },
        short: {
          sun: 'di',
          mon: 'lu',
          tue: 'ma',
          wed: 'me',
          thu: 'je',
          fri: 've',
          sat: 'sa'
        },
        wide: {
          sun: 'dimanche',
          mon: 'lundi',
          tue: 'mardi',
          wed: 'mercredi',
          thu: 'jeudi',
          fri: 'vendredi',
          sat: 'samedi'
        }
      }
    },
    eras: {
      name: {
        0 => 'avant l?????re commune',
        1 => 'de l?????re commune'
      }, abbr: {
        0 => 'AEC',
        1 => 'EC'
      }, narrow: {
        0 => 'AEC',
        1 => 'EC'
      }
    },
    quarters: {
      format: {
        abbreviated: {
          1 => 'T1',
          2 => 'T2',
          3 => 'T3',
          4 => 'T4'
        }, narrow: {
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4'
        }, wide: {
          1 => '1er trimestre',
          2 => '2e trimestre',
          3 => '3e trimestre',
          4 => '4e trimestre'
        }
      },
      "stand-alone": {
        abbreviated: {
          1 => 'T1',
          2 => 'T2',
          3 => 'T3',
          4 => 'T4'
        }, narrow: {
          1 => '1',
          2 => '2',
          3 => '3',
          4 => '4'
        }, wide: {
          1 => '1er trimestre',
          2 => '2e trimestre',
          3 => '3e trimestre',
          4 => '4e trimestre'
        }
      }
    },
    periods: {
      format: {
        abbreviated: {
          midnight: 'minuit',
          am: 'AM',
          noon: 'midi',
          pm: 'PM',
          morning1: 'mat.',
          afternoon1: 'ap.m.',
          evening1: 'soir',
          night1: 'nuit'
        },
        narrow: {
          midnight: 'minuit',
          am: 'AM',
          noon: 'midi',
          pm: 'PM',
          morning1: 'mat.',
          afternoon1: 'ap.m.',
          evening1: 'soir',
          night1: 'nuit'
        },
        wide: {
          midnight: 'minuit',
          am: 'AM',
          noon: 'midi',
          pm: 'PM',
          morning1: 'du matin',
          afternoon1: 'de l???apr??s-midi',
          evening1: 'du soir',
          night1: 'du matin'
        }
      },
      "stand-alone": {
        abbreviated: {
          midnight: 'minuit',
          am: 'AM',
          noon: 'midi',
          pm: 'PM',
          morning1: 'mat.',
          afternoon1: 'ap.m.',
          evening1: 'soir',
          night1: 'nuit'
        },
        narrow: {
          midnight: 'minuit',
          am: 'AM',
          noon: 'midi',
          pm: 'PM',
          morning1: 'mat.',
          afternoon1: 'ap.m.',
          evening1: 'soir',
          night1: 'nuit'
        },
        wide: {
          midnight: 'minuit',
          am: 'AM',
          noon: 'midi',
          pm: 'PM',
          morning1: 'matin',
          afternoon1: 'apr??s-midi',
          evening1: 'soir',
          night1: 'nuit'
        }
      }
    },
    fields: {
      era: '??re',
      "era-short": '??re',
      "era-narrow": '??re',
      year: 'ann??e',
      "year-short": 'an',
      "year-narrow": 'a',
      quarter: 'trimestre',
      "quarter-short": 'trim.',
      "quarter-narrow": 'trim.',
      month: 'mois',
      "month-short": 'm.',
      "month-narrow": 'm.',
      week: 'semaine',
      "week-short": 'sem.',
      "week-narrow": 'sem.',
      weekOfMonth: 'semaine (mois)',
      "weekOfMonth-short": 'sem. (m.)',
      "weekOfMonth-narrow": 'sem. (m.)',
      day: 'jour',
      "day-short": 'j',
      "day-narrow": 'j',
      dayOfYear: 'jour (ann??e)',
      "dayOfYear-short": 'j (an)',
      "dayOfYear-narrow": 'j (an)',
      weekday: 'jour de la semaine',
      "weekday-short": 'j (sem.)',
      "weekday-narrow": 'j (sem.)',
      weekdayOfMonth: 'jour (mois)',
      "weekdayOfMonth-short": 'jour (mois)',
      "weekdayOfMonth-narrow": 'jour (mois)',
      "dayperiod-short": 'cadran',
      dayperiod: 'cadran',
      "dayperiod-narrow": 'cadran',
      hour: 'heure',
      "hour-short": 'h',
      "hour-narrow": 'h',
      minute: 'minute',
      "minute-short": 'min',
      "minute-narrow": 'min',
      second: 'seconde',
      "second-short": 's',
      "second-narrow": 's',
      zone: 'fuseau horaire',
      "zone-short": 'fuseau horaire',
      "zone-narrow": 'fuseau horaire'
    },
    formats: {
      date: {
        full: {
          pattern: 'EEEE d MMMM y'
        }, long: {
          pattern: 'd MMMM y'
        }, medium: {
          pattern: 'd MMM y'
        }, short: {
          pattern: 'dd/MM/y'
        }
      },
      time: {
        full: {
          pattern: 'HH:mm:ss zzzz'
        }, long: {
          pattern: 'HH:mm:ss z'
        }, medium: {
          pattern: 'HH:mm:ss'
        }, short: {
          pattern: 'HH:mm'
        }
      },
      datetime: {
        full: {
          pattern: "{{date}} '??' {{time}}"
        }, long: {
          pattern: "{{date}} '??' {{time}}"
        }, medium: {
          pattern: "{{date}} '??' {{time}}"
        }, short: {
          pattern: '{{date}} {{time}}'
        }
      }
    },
    additional_formats: {
      'Bh' => 'h B',
      'Bhm' => 'h:mm B',
      'Bhms' => 'h:mm:ss B',
      'd' => 'd',
      'E' => 'E',
      'EBhm' => 'E h:mm B',
      'EBhms' => 'E h:mm:ss B',
      'Ed' => 'E d',
      'Ehm' => 'E h:mm a',
      'EHm' => 'E HH:mm',
      'Ehms' => 'E h:mm:ss a',
      'EHms' => 'E HH:mm:ss',
      'Gy' => 'y G',
      'GyMMM' => 'MMM y G',
      'GyMMMd' => 'd MMM y G',
      'GyMMMEd' => 'E d MMM y G',
      'h' => 'h a',
      'H' => "HH 'h'",
      'hm' => 'h:mm a',
      'Hm' => 'HH:mm',
      'hms' => 'h:mm:ss a',
      'Hms' => 'HH:mm:ss',
      'hmsv' => 'h:mm:ss a v',
      'Hmsv' => 'HH:mm:ss v',
      'hmv' => 'h:mm a v',
      'Hmv' => 'HH:mm v',
      'M' => 'L',
      'Md' => 'dd/MM',
      'MEd' => 'E dd/MM',
      'MMM' => 'LLL',
      'MMMd' => 'd MMM',
      'MMMEd' => 'E d MMM',
      'MMMMd' => 'd MMMM',
      'MMMMW' => "'semaine' W (MMMM)",
      'ms' => 'mm:ss',
      'y' => 'y',
      'yM' => 'MM/y',
      'yMd' => 'dd/MM/y',
      'yMEd' => 'E dd/MM/y',
      'yMMM' => 'MMM y',
      'yMMMd' => 'd MMM y',
      'yMMMEd' => 'E d MMM y',
      'yMMMM' => 'MMMM y',
      'yQQQ' => 'QQQ y',
      'yQQQQ' => 'QQQQ y',
      'yw' => "'semaine' w 'de' Y"
    }
  }
}
