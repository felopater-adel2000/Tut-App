enum LanguageType
{
  ENGLISH,
  ARABIT

}

const String ARABIC = "ar";
const String ENGLISH = "en";
extension LanguageTypeExtension on LanguageType
{
  String getValue()
  {
    switch(this)
    {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIT:
        return ARABIC;
    }
  }
}