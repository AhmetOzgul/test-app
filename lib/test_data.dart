import 'package:bilgi_testi/question.dart';

class TestData {
  int _questNum = 0;
  int score = 0;
  List<Question> _questBank = [
    Question(
        questText:
            "Mustafa Kemal Atatürk'e Mustafa ismini öğretmeni vermiştir.",
        questAnswer: false),
    Question(
        questText:
            "Tüm dünyada kullanılan onlu ordu sistemi Mete Han tarafından oluşturulmuştur.",
        questAnswer: true),
    Question(
        questText: "Aziz Sancar Nobel Ödülü'nü Kimya alanında almıştır.",
        questAnswer: true),
    Question(
        questText: "Hayvan hücresinde enerji üreten organel mitokondridir.",
        questAnswer: true),
    Question(
        questText: "Akım, gerilim ile direncin çarpılmasıyla bulunur.",
        questAnswer: false),
    Question(
        questText:
            "Kaju olarak bildiğimiz kuruyemiş aslında bir meyvenin sapıdır.",
        questAnswer: true),
    Question(
        questText: "Her tam sayı aynı zamanda doğal sayıdır.",
        questAnswer: false),
    Question(
        questText: "İspanya'nın başkenti Barcelona'dır.", questAnswer: false),
    Question(
        questText: "Su, 100 derecede buharlaşmaya başlar.", questAnswer: false),
    Question(
        questText: "Uçaklardaki kara kutu aslında turuncudur.",
        questAnswer: true),
  ];

  String getQuestText() {
    return _questBank[_questNum].questText;
  }

  bool getQuestAnswer() {
    return _questBank[_questNum].questAnswer;
  }

  void increaseNum() {
    if (_questNum + 1 < _questBank.length) ++_questNum;
  }

  bool isTestOver() {
    if (_questNum + 1 >= _questBank.length) {
      return true;
    } else {
      return false;
    }
  }

  void resetIndex() {
    _questNum = 0;
  }

  void increaseScore() {
    score = score + 10;
  }

  getScore() {
    return score;
  }

  resetScore() {
    score = 0;
  }
}
