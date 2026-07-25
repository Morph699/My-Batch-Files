:: !!! Unicode Character Found !!!
@Echo Off
Title Reg Converter v1.2 & Color 1A
cd %systemroot%\system32
call :IsAdmin

Reg.exe add "HKCU\Control Panel\International" /v "Locale" /t REG_SZ /d "00001C09" /f
Reg.exe add "HKCU\Control Panel\International" /v "LocaleName" /t REG_SZ /d "en-ZA" /f
Reg.exe add "HKCU\Control Panel\International" /v "s1159" /t REG_SZ /d "am" /f
Reg.exe add "HKCU\Control Panel\International" /v "s2359" /t REG_SZ /d "pm" /f
Reg.exe add "HKCU\Control Panel\International" /v "sCurrency" /t REG_SZ /d "R" /f
Reg.exe add "HKCU\Control Panel\International" /v "sDate" /t REG_SZ /d " " /f
Reg.exe add "HKCU\Control Panel\International" /v "sDecimal" /t REG_SZ /d "." /f
Reg.exe add "HKCU\Control Panel\International" /v "sGrouping" /t REG_SZ /d "3;0" /f
Reg.exe add "HKCU\Control Panel\International" /v "sLanguage" /t REG_SZ /d "ENS" /f
Reg.exe add "HKCU\Control Panel\International" /v "sList" /t REG_SZ /d "," /f
Reg.exe add "HKCU\Control Panel\International" /v "sLongDate" /t REG_SZ /d "dddd, dd MMMM yyyy" /f
Reg.exe add "HKCU\Control Panel\International" /v "sMonDecimalSep" /t REG_SZ /d "." /f
Reg.exe add "HKCU\Control Panel\International" /v "sMonGrouping" /t REG_SZ /d "3;0" /f
Reg.exe add "HKCU\Control Panel\International" /v "sMonThousandSep" /t REG_SZ /d "," /f
Reg.exe add "HKCU\Control Panel\International" /v "sNativeDigits" /t REG_SZ /d "0123456789" /f
Reg.exe add "HKCU\Control Panel\International" /v "sNegativeSign" /t REG_SZ /d "-" /f
Reg.exe add "HKCU\Control Panel\International" /v "sPositiveSign" /t REG_SZ /d "" /f
Reg.exe add "HKCU\Control Panel\International" /v "sShortDate" /t REG_SZ /d "dd MMM yyyy" /f
Reg.exe add "HKCU\Control Panel\International" /v "sThousand" /t REG_SZ /d "," /f
Reg.exe add "HKCU\Control Panel\International" /v "sTime" /t REG_SZ /d ":" /f
Reg.exe add "HKCU\Control Panel\International" /v "sTimeFormat" /t REG_SZ /d "HH:mm:ss" /f
Reg.exe add "HKCU\Control Panel\International" /v "sShortTime" /t REG_SZ /d "HH:mm" /f
Reg.exe add "HKCU\Control Panel\International" /v "sYearMonth" /t REG_SZ /d "MMMM yyyy" /f
Reg.exe add "HKCU\Control Panel\International" /v "iCalendarType" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iCountry" /t REG_SZ /d "27" /f
Reg.exe add "HKCU\Control Panel\International" /v "iCurrDigits" /t REG_SZ /d "2" /f
Reg.exe add "HKCU\Control Panel\International" /v "iCurrency" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iDate" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iDigits" /t REG_SZ /d "2" /f
Reg.exe add "HKCU\Control Panel\International" /v "NumShape" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iFirstDayOfWeek" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iFirstWeekOfYear" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iLZero" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iMeasure" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iNegCurr" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iNegNumber" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iPaperSize" /t REG_SZ /d "9" /f
Reg.exe add "HKCU\Control Panel\International" /v "iTime" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "iTimePrefix" /t REG_SZ /d "0" /f
Reg.exe add "HKCU\Control Panel\International" /v "iTLZero" /t REG_SZ /d "1" /f
Reg.exe add "HKCU\Control Panel\International" /v "Calendar" /t REG_SZ /d "Gregorian" /f
Reg.exe add "HKCU\Control Panel\International\??????" /v "Calendar" /t REG_SZ /d "Gregorian" /f
Reg.exe add "HKCU\Control Panel\International\Geo" /v "Nation" /t REG_SZ /d "209" /f
Reg.exe add "HKCU\Control Panel\International\Geo" /v "Name" /t REG_SZ /d "ZA" /f
Reg.exe add "HKCU\Control Panel\International\LanguageComponentsAvailable" /v "AvailableLanguagePacks" /t REG_MULTI_SZ /d "af-za\0fa-ir\0be-by\0he-il\0bn-bd\0ga-ie\0uk-ua\0mn-mn\0ti-et\0mr-in\0ky-kg\0as-in\0gl-es\0km-kh\0ar-sa\0am-et\0bn-in\0ca-es-valencia\0az-latn-az\0de-de\0bg-bg\0da-dk\0gd-gb\0ka-ge\0ha-latn-ng\0uz-latn-uz\0sw-ke\0hu-hu\0it-it\0ku-arab-iq\0yo-ng\0tn-za\0es-mx\0chr-cher-us\0nl-nl\0hr-hr\0bs-latn-ba\0lv-lv\0th-th\0pt-br\0or-in\0pl-pl\0is-is\0te-in\0mk-mk\0es-es\0ml-in\0fr-fr\0kn-in\0prs-af\0kok-in\0ca-es\0en-gb\0fr-ca\0sd-arab-pk\0et-ee\0zh-cn\0si-lk\0cs-cz\0gu-in\0cy-gb\0ig-ng\0ja-jp\0el-gr\0eu-es\0xh-za\0sl-si\0en-us\0kk-kz\0mi-nz\0fi-fi\0id-id\0fil-ph\0tk-tm\0lt-lt\0pa-in\0hi-in\0lo-la\0ko-kr\0hy-am\0lb-lu\0ms-my\0ur-pk\0ro-ro\0mt-mt\0sr-cyrl-rs\0sq-al\0ne-np\0ug-cn\0nb-no\0nn-no\0nso-za\0pa-arab-pk\0pt-pt\0quc-latn-gt\0quz-pe\0ru-ru\0rw-rw\0sk-sk\0sr-cyrl-ba\0sr-latn-rs\0sv-se\0ta-in\0tg-cyrl-tj\0tr-tr\0tt-ru\0vi-vn\0wo-sn\0zh-tw\0zu-za" /f
Reg.exe add "HKCU\Control Panel\International\LanguageComponentsAvailable" /v "AvailableSpeechFeatures" /t REG_MULTI_SZ /d "fr-CA\0en-GB\0da-DK\0en-IN\0de-DE\0en-AU\0en-CA\0en-US\0fr-FR\0es-ES\0es-MX\0it-IT\0ja-JP\0pt-BR\0zh-CN\0zh-HK\0zh-TW" /f
Reg.exe add "HKCU\Control Panel\International\LanguageComponentsAvailable" /v "AvailableHandwritingFeatures" /t REG_MULTI_SZ /d "rm-CH\0el-GR\0rw-RW\0de-DE\0af-ZA\0ca-ES\0en-GB\0gd-GB\0da-DK\0nl-NL\0hr-HR\0bs-LATN-BA\0zh-CN\0cs-CZ\0ja-JP\0cy-GB\0xh-ZA\0sl-SI\0en-US\0ms-BN\0fr-FR\0es-ES\0tn-ZA\0es-MX\0eu-ES\0fi-FI\0ga-IE\0nso-ZA\0gl-ES\0hi-IN\0id-ID\0sw-KE\0it-IT\0ko-KR\0lb-LU\0mi-NZ\0ms-MY\0nb-NO\0nn-NO\0pt-BR\0pl-PL\0pt-PT\0ro-RO\0ru-RU\0sk-SK\0sr-CYRL-RS\0sq-AL\0sr-LATN-RS\0sv-SE\0tr-TR\0wo-SN\0zh-HK\0zh-TW\0zu-ZA" /f
Reg.exe add "HKCU\Control Panel\International\LanguageComponentsAvailable" /v "AvailableTextToSpeechFeatures" /t REG_MULTI_SZ /d "ar-SA\0ar-EG\0bg-BG\0de-DE\0da-DK\0de-CH\0fr-CA\0en-GB\0ca-ES\0zh-CN\0cs-CZ\0fi-FI\0de-AT\0en-IN\0el-GR\0en-AU\0en-CA\0nl-BE\0en-IE\0sl-SI\0en-US\0fr-FR\0es-ES\0es-MX\0fr-CH\0he-IL\0hi-IN\0nl-NL\0hr-HR\0it-IT\0hu-HU\0id-ID\0ja-JP\0ko-KR\0ms-MY\0nb-NO\0th-TH\0pt-BR\0pl-PL\0pt-PT\0ro-RO\0ru-RU\0sk-SK\0sv-SE\0ta-IN\0tr-TR\0vi-VN\0zh-HK\0zh-TW" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "Languages" /t REG_MULTI_SZ /d "en-ZA" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowAutoCorrection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowTextPrediction" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowCasing" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "ShowShiftLock" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile" /v "UserLocaleFromLanguageProfileOptOut" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-US" /v "0409:00000409" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-ZA" /v "1C09:00000409" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-ZA" /v "CachedLanguageName" /t REG_SZ /d "@Winlangdb.dll,-1122" /f
Reg.exe add "HKCU\Control Panel\International\User Profile\en-ZA" /v "FeaturesToInstall" /t REG_DWORD /d "227" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "Languages" /t REG_MULTI_SZ /d "en-ZA" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "ShowAutoCorrection" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "ShowTextPrediction" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "ShowCasing" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup" /v "ShowShiftLock" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup\en-US" /v "0409:00000409" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\User Profile System Backup\en-ZA" /v "1C09:00000409" /t REG_DWORD /d "1" /f
Reg.exe add "HKCU\Control Panel\International\??????" /v "Calendar" /t REG_SZ /d "Gregorian" /f
Exit

:IsAdmin
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Echo You must have administrator rights to continue ... 
 Pause & Exit
)
Cls
goto:eof
