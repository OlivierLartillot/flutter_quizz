class Question {
  String question;
  bool reponse;
  String explication;
  String imagePath;

  // construct
  Question({
    required  this.question,
    required this.reponse,
    required this.explication,
    required this.imagePath
  });

  // getters
  String getImage() => 'images/$imagePath';
  String getQuestion() => this.question;
  String setQuestions(question) {
    this.question = question;
    return this.question;
  }

}