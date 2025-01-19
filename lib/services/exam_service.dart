
// Services
import '../domain/exam.dart';

class ExamService {
  final List<Exam> _exams = [];

  List<Exam> get exams => _exams;

  void addExam(Exam exam) {
    _exams.add(exam);
  }
}