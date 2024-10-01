abstract class LanguageEvent{}
class ChangeLanguageEvent extends LanguageEvent{
  String Language;
  ChangeLanguageEvent(this.Language);
}