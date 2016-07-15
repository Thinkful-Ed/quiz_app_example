// In this exemplary solution, we've done our
// best to separate logic that has to do with
// application logic and state (for instance,
// what's the score?, what's the current question?,
// is this answer correct?) from logic for manipulating the
// DOM

// We use an array of objects to represent our questions,
// and we use an object with methods and properties to
// generate and manage new quizzes.


// Also noteworthy is the strategy of using jQuery's `.clone()`
// method. Cross-referencing with index.html, notice that
// we have a div with `style="display:none;"`, which we use
// to hold HTML templates for displaying the start,
// individual question, answer feedback, the results views.
// This approach introduces some complexity in that we have to
// manually remove some event listeners (using `.off()`), but it
// has the virtue of allowing us to store our HTML templates
// for these components in an HTML file (it's annoying to maintain
// HTML inside JavaScript files).

// Finally note that we use *ternary operators* below (e.g.,
// `foo === 'foo' ? doSomething() : doSomethingElse()` ). This is
// common JS syntax. If you want to see more examples, a quick
// google search will yield inummerable introductions to ternary
// operators.


// data
var QUESTIONS = [
  {
    text: "Which number am I thinking of?",
    choices: ["1", "2", "3", "4"],
    correctChoiceIndex: 0
  },
  {
    text: "What about now, can you guess now?",
    choices: ["1", "2", "3", "4"],
    correctChoiceIndex: 1
  },
  {
    text: "I'm thinking of a number between 1 and 4. What is it?",
    choices: ["1", "2", "3", "4"],
    correctChoiceIndex: 2,
  },
  {
    text: "If I were a number between 1 and 4, which would I be?",
    choices: ["1", "2", "3", "4"],
    correctChoiceIndex: 3,
  },
  {
    text: "Guess what my favorite number is",
    choices: ["1", "2", "3", "4"],
    correctChoiceIndex: 0,
  },
];


// objects
var Quiz = {

  score: 0,
  questions: [],
  currentQuestionIndex: 0,

  currentQuestion: function() {
    return this.questions[this.currentQuestionIndex]
  },

  scoreUserAnswer: function(answer) {
    var correctChoice = this.currentQuestion().choices[this.currentQuestion().correctChoiceIndex];
    if (answer === correctChoice) {
      this.score ++;
    }
    return answer === correctChoice;
  }

}


function getNewQuiz() {
  var quiz = Object.create(Quiz);
  // `QUESTIONS` is defined at the top of this file
  quiz.questions = QUESTIONS;
  return quiz
}


// DOM manipulation
function makeCurrentQuestionElem(quiz) {

  var questionElem = $("#js-question-template" ).children().clone();
  var question = quiz.currentQuestion();

  questionElem.find(".js-question-count").text(
    (quiz.currentQuestionIndex + 1) + "/" +
    quiz.questions.length + ": " + question.text);
  questionElem.find('.js-question-text').text(question.text);

  // add choices as radio inputs
  for (var i = 0; i < question.choices.length; i++) {

    var choice = question.choices[i];
    var choiceElem = $( "#js-choice-template" ).children().clone();
    choiceElem.find("input").attr("value", choice);
    var choiceId = "js-question-" + quiz.currentQuestionIndex + "-choice-" + i;
    choiceElem.find("input").attr("id", choiceId)
    choiceElem.find("label").text(choice);
    choiceElem.find("label").attr("for", choiceId);
    questionElem.find(".js-choices").append(choiceElem);
  };

  return questionElem;
}

function makeAnswerFeedbackElem(isCorrect, correctAnswer, quiz) {
  var feedbackElem = $("#js-answer-feedback-template").children().clone();
  var feedbackText = isCorrect ? "Correct. But that was just luck." : "Wrong! The correct answer is " + correctAnswer
  feedbackElem.find(".js-feedback-text").text(feedbackText);

  var seeNextText = quiz.currentQuestionIndex < quiz.questions.length - 1 ? "Next" : "How did I do?"
  feedbackElem.find(".js-see-next").text(seeNextText);
  return feedbackElem;
}

function makeFinalFeedbackElem(quiz) {
  var finalFeedbackElem = $("#js-final-feedback-template").clone();
  var feedbackText = "You got " + quiz.score + " out of " + quiz.questions.length + " questions right.";
  finalFeedbackElem.find(".js-results-text").text(feedbackText)
  return finalFeedbackElem;
}


function handleSeeNext(quiz, currentQuestionElem) {

  $("main").on("click", ".js-see-next", function(event) {

    if (quiz.currentQuestionIndex < quiz.questions.length - 1) {
      // manually remove event listener on the `.js-see-next` because they
      // otherwise continue occuring for previous, inactive questions
      $("main").off("click", ".js-see-next");
      quiz.currentQuestionIndex ++;
      $("main").html(makeCurrentQuestionElem(quiz));
    }
    else {
      $("main").html(makeFinalFeedbackElem(quiz))
    }
  });
}

function handleAnswers(quiz) {
  $("main").on("submit", "form[name='current-question']", function(event) {
    event.preventDefault();
    var answer = $("input[name='user-answer']:checked").val();
    quiz.scoreUserAnswer(answer);
    var question = quiz.currentQuestion();
    var correctAnswer = question.choices[question.correctChoiceIndex]
    var isCorrect = answer === correctAnswer;
    handleSeeNext(quiz);
    $("main").html(makeAnswerFeedbackElem(isCorrect, correctAnswer, quiz));
  });
}


function handleQuizStart() {
  $("main").html($("#js-start-template").clone());
  $("form[name='game-start']").submit(function(event) {
    var quiz = getNewQuiz();
    event.preventDefault();
    $("main").html(makeCurrentQuestionElem(quiz));
    handleAnswers(quiz);
    handleRestarts();
  });
}

function handleRestarts() {
  $("main").on("click", ".js-restart-game", function(event){
    event.preventDefault();
    // this removes all event listeners from `<main>` cause we want them
    // set afresh by `handleQuizStart`
    $("main").off();
    handleQuizStart();
  });
}

$(document).ready(function() {
  handleQuizStart();
});
