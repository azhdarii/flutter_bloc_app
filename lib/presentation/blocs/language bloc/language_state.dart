abstract class LanguageState{
  String language;

  LanguageState(this.language);
}
class FarsiState extends LanguageState{
  FarsiState() : super('fa');
}
class EnglishState extends LanguageState{
  EnglishState() : super('en');
}