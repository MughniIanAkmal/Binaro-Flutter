class QuizOption {
  final String key; // "A", "B", "C", "D"
  final String text;
  final bool isCorrect;

  const QuizOption({
    required this.key,
    required this.text,
    required this.isCorrect,
  });
}

class QuizQuestionModel {
  final int questionNumber;
  final int totalQuestions;
  final String quizTitle;
  final String questionText;
  final String visualCaption;
  final String visualType; // 'watermelon', 'apple', 'pizza', etc.
  final int takenParts;
  final int totalParts;
  final List<QuizOption> options;
  final String hintText;
  final int initialSelectedOptionIndex;

  const QuizQuestionModel({
    required this.questionNumber,
    required this.totalQuestions,
    required this.quizTitle,
    required this.questionText,
    required this.visualCaption,
    required this.visualType,
    required this.takenParts,
    required this.totalParts,
    required this.options,
    required this.hintText,
    this.initialSelectedOptionIndex = 1, // Default option B as in screenshot
  });
}
