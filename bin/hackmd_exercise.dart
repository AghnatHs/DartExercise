import 'dart:io';
import 'dart:math';
import 'dart:convert';

void pass() {}
void exercise1() {
  stdout.write("Enter your name: ");
  String firstName = stdin.readLineSync()!;
  stdout.write("Enter your age:");
  int age = int.parse(stdin.readLineSync()!);

  int to100Years = max(0, 100 - age);
  print("$firstName is $to100Years years again to 100 yo");
}

void exercise2() {
  stdout.write("Enter a number: ");
  List<int> number =
      stdin.readLineSync()!.split(' ').map((a) => int.parse(a)).toList();
  for (int _number in number) {
    String oddEven = _number % 2 == 0 ? "Even" : "Odd";
    print('$_number is $oddEven');
  }
}

void exercise3() {
  stdout.write("Enter a list of numbers: ");
  List<int> numbers =
      stdin.readLineSync()!.split(' ').map((a) => int.parse(a)).toList();

  for (int number in numbers) {
    number < 5 ? pass : stdout.write('$number ');
  }
}

void exercise4() {
  stdout.write("Enter a number: ");
  int number = int.parse(stdin.readLineSync()!);

  for (var i = 1; i <= number; i++) {
    number % i == 0 ? print('$i => $i x ${number ~/ i} = $number') : pass();
  }
}

void exercise5() {
  stdout.write('Enter list a = ');
  Set<int> numbersA =
      stdin.readLineSync()!.split(' ').map((a) => int.parse(a)).toSet();
  stdout.write('Enter list b = ');
  Set<int> numbersB =
      stdin.readLineSync()!.split(' ').map((a) => int.parse(a)).toSet();

  if (numbersA.length <= numbersB.length) {
    for (int number in numbersA) {
      if (numbersB.contains(number)) {
        stdout.write('$number ');
      }
    }
  } else {
    for (int number in numbersB) {
      if (numbersA.contains(number)) {
        stdout.write('$number ');
      }
    }
  }
}

void exercise6() {
  stdout.write('Enter a string: ');
  String string = stdin.readLineSync()!.toLowerCase();
  List<String> stringReversed = string.split('').reversed.toList();

  string == stringReversed.join('')
      ? print('palindrome')
      : print('not a palindrom');
}

void exercise7() {
  stdout.write('Enter a list: ');
  List<int> numbers =
      stdin.readLineSync()!.split(' ').map((a) => int.parse(a)).toList();
  List<int> newNumbers = [];

  for (int number in numbers) {
    number % 2 == 0 ? newNumbers.add(number) : pass();
  }

  print('$newNumbers');
}

void exercise8() {
  var random = Random();

  print('~<rock paper scissor exit>~');

  Map<String, String> rules = {
    'rock': 'scissor',
    'paper': 'rock',
    'scissor': 'paper'
  };
  Map<int, String> rulesComp = {1: 'scissor', 2: 'rock', 3: 'paper'};

  // ignore: non_constant_identifier_names
  String WL = '';
  int playerScore = 0;
  int compScore = 0;
  String player = '';
  String? comp = '';

  do {
    stdout.write('P => ');
    player = stdin.readLineSync()!.toLowerCase();
    comp = rulesComp[1 + random.nextInt(3)];
    print('C => $comp');

    if (!rules.keys.contains(player)) {
      WL = '';
    } else if (rules[player] == comp) {
      WL = 'Win';
      playerScore++;
    } else if (rules[comp] == player) {
      compScore++;
      WL = 'Lose';
    } else if (player == comp) {
      WL = 'Tie';
    }
    print('$WL P:$playerScore C:$compScore');
    print('---------------------------');
  } while (player != 'exit');

  print('-------------------------');
  print('PLAYER : $playerScore ; COMP : $compScore');
}

void exercise9() {
  bool guessed = false;
  int guessedTry = 0;

  int number = Random().nextInt(101) + 1;
  int userNumber = -1;

  while (!guessed) {
    stdout.write('Guess the number : ');
    userNumber = int.parse(stdin.readLineSync()!);
    if (userNumber > 100) {
      print('Limit 100');
      continue;
    } else if (userNumber == number) {
      guessed = true;
      print('>Exactly right.\n>Guess : $guessedTry ');
      continue;
    } else if (userNumber < number) {
      print('>Too low');
      guessedTry++;
      continue;
    } else if (userNumber > number) {
      print('>Too high');
      guessedTry++;
      continue;
    }
  }
}

void exercise10() {
  String isPrime({required int number}) {
    String prime;
    List<int> divisor = [];
    for (var i = 1; i <= number; i++) {
      if (number % i == 0) {
        divisor.add(i);
      }
    }

    prime = divisor.length == 2 ? 'prime' : 'not prime';
    return prime;
  }

  stdout.write('Enter a number : ');
  List<int> numbers =
      stdin.readLineSync()!.split(', ').map((a) => int.parse(a)).toList();

  for (int number in numbers) {
    print('$number ${isPrime(number: number)}');
  }
}

void exercise11() {
  List<dynamic> returnFirstLast({required List<dynamic> list}) =>
      [list.first, list.last];
  List<dynamic> userList = stdin.readLineSync()!.split(' ');

  print(returnFirstLast(list: userList));
}

void exercise12() {
  List<int> fibonacci({required int x}) {
    if (x == 0 || x == 1 || x < 0) {
      return [0];
    } else if (x == 2) {
      return [0, 1];
    } else {
      List<int> fibonaccis = [0, 1];
      for (var i = 0; i < x - 1; i++) {
        fibonaccis.add(fibonaccis[i] + fibonaccis[i + 1]);
      }
      return fibonaccis;
    }
  }

  stdout.write('How many fibonnaci : ');
  int x = int.parse(stdin.readLineSync()!);

  print(fibonacci(x: x).join(' '));
}

void exercise13() {
  List<dynamic> userList = stdin.readLineSync()!.split(' ').toSet().toList();
  print(userList);
}

void exercise14() {
  String backwardsOrder({required List<String> str}) =>
      str.reversed.toList().join(' ');
  print(backwardsOrder(str: stdin.readLineSync()!.split(' ')));
}

void exercise15() {
  String generatePassword(String strength) {
    final List<String> alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('');
    final List<String> number = '12345678'.split('').toList();
    final List<String> char = r'!@#$%^&*()_+}{":?><[];,./'.split('').toList();

    var _length = 40;
    var _strongChoice = [alphabet, number, char];
    var _weakChoice = [alphabet, number];

    String generatedPassword = r'';
    switch (strength) {
      case 'strong':
        {
          for (var i = 0; i < _length; i++) {
            for (var j = 0; j < _strongChoice.length - 1; j++) {
              _strongChoice.shuffle();
              List<String> _choice =
                  _strongChoice[Random().nextInt(_strongChoice.length)];
              _choice.shuffle();
              String _char = _choice[Random().nextInt(_choice.length)];
              generatedPassword += _char;
            }
          }
        }
        break;
      case 'weak':
        {
          for (var i = 0; i < _length; i++) {
            for (var j = 0; j < _weakChoice.length - 1; j++) {
              _weakChoice.shuffle();
              List<String> _choice =
                  _weakChoice[Random().nextInt(_weakChoice.length)];
              _choice.shuffle();
              String _char = _choice[Random().nextInt(_choice.length)];
              generatedPassword += _char;
            }
          }
        }
        break;
    }
    return generatedPassword;
  }

  stdout.write('generate <weak/strong>');
  String user = stdin.readLineSync()!;
  print(generatePassword(user.toLowerCase()));
}

void exercise16() {
  String number = (Random().nextInt(9999) + 1000).toString();
  String user = '';
  int guess = 0;
  bool stillPlaying = true;

  var cows = 0;
  var bulls = 0;

  print(number);
  while (stillPlaying) {
    stdout.write('Guess the Number : ');
    user = stdin.readLineSync()!;
    guess++;

    if (user == number) {
      stillPlaying = false;
      print('Number Guessed $user = $number , Tried $guess time');
    } else {
      for (var i = 0; i < 4; i++) {
        if (user[i] == number[i]) {
          cows++;
        } else if (number.contains(user[i])) {
          bulls++;
        }
      }
      print('Cows=>$cows , Bulls=>$bulls');
    }
    cows = 0;
    bulls = 0;
  }
}

void exercise17() {
  void createBoard(int size) {
    final String hor = ' ---';
    final String vert = '|   ';

    for (var i = 0; i < size + 1; i++) {
      if (i != size) {
        print(hor * size);
        print(vert * (size + 1));
      } else {
        print(hor * size);
      }
    }
  }

  stdout.write('Enter the size : ');
  createBoard(int.parse(stdin.readLineSync()!));
}

void exercise18TicTacToe() {
  // 1 for X, 2 for O
  void drawBoard({required List<List<String>> boardData}) {
    var size = 3;
    final String hor = ' ---';
    final String vert = '|';

    for (var i = 0; i < size + 1; i++) {
      if (i != size) {
        print(hor * size);
        //print(vert * (size + 1));
        print(
            '${vert + boardData[i][0]}${vert + boardData[i][1]}${vert + boardData[i][2]}$vert');
      } else {
        print(hor * size);
      }
    }
  }

  bool canMove({required List<List<int>> boardData}) {
    int counter = 0;
    for (var row = 0; row < 3; row++) {
      for (var i = 0; i < 3; i++) {
        counter = boardData[row][i] != 0 ? counter + 1 : counter;
      }
    }
    if (counter != 9) {
      return true;
    } else {
      print('No More Moves, its a Draw.');
      return false;
    }
  }

  String? showWinner({required List<List<int>> boardData}) {
    //check horizontal
    for (var row = 0; row < 3; row++) {
      Set _hor = boardData[row].toSet();
      if (_hor.length == 1) {
        if (_hor.contains(1)) {
          return 'X Win (HORIZONTAL)';
        } else if (_hor.contains(2)) {
          return 'O Win (HORIZONTAL)';
        }
      }
    }

    //check Vertical
    for (var col = 0; col < 3; col++) {
      Set _vert = List.generate(3, (j) => boardData[j][col]).toSet();
      if (_vert.length == 1) {
        if (_vert.contains(1)) {
          return 'X Win (VERTICAL)';
        } else if (_vert.contains(2)) {
          return 'O Win (VERTICAL)';
        }
      }
    }

    //check diagonal
    var _reversedBoardData = List.from(boardData.reversed);
    List<List<int>> _diagonal = [
      [for (var i = 0; i < 3; i++) boardData[i][i]],
      [for (var i = 0; i < 3; i++) _reversedBoardData[i][i]]
    ];
    for (List<int> d in _diagonal) {
      Set _d = d.toSet();
      if (_d.length == 1) {
        if (_d.contains(1)) {
          return 'X Win (DIAGONAL)';
        } else if (_d.contains(2)) {
          return 'O Win (DIAGONAL)';
        }
      }
    }

    //no winner
    return null;
  }

  // Data
  List<List<int>> game = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ];
  List<List<String>> translatedGame = [
    ['   ', '   ', '   '],
    ['   ', '   ', '   '],
    ['   ', '   ', '   ']
  ];
  var winner;
  var row;
  var column;
  List<int> xInput;
  List<int> oInput;

  // Get input from player
  while (true) {
    // X
    stdout.write('Player X : Rows, Column => ');
    xInput = stdin.readLineSync()!.split(' ').map((a) => int.parse(a)).toList();
    row = xInput[0] - 1;
    column = xInput[1] - 1;
    if (game[row][column] == 0) {
      game[row][column] = 1;
      translatedGame[row][column] = ' X ';
    }

    drawBoard(boardData: translatedGame);
    if (!canMove(boardData: game)) break;
    winner = showWinner(boardData: game);
    if (winner != null) {
      print(winner);
      break;
    }

    //O
    stdout.write('Player O : Rows, Column => ');
    oInput = stdin.readLineSync()!.split(' ').map((a) => int.parse(a)).toList();
    row = oInput[0] - 1;
    column = oInput[1] - 1;
    if (game[row][column] == 0) {
      game[row][column] = 2;
      translatedGame[row][column] = ' O ';
    }
    drawBoard(boardData: translatedGame);
    if (!canMove(boardData: game)) break;
    winner = showWinner(boardData: game);
    if (winner != null) {
      print(winner);
      break;
    }
  }
}

void exercise21() {
  stdout.write(
      'Think number between 0 - 100\n too high too low type "high" or "low" or  "correct"\n');
  Random random = Random();
  int attempt = 0;
  int min = 0;
  int max = 100;
  int compGuess = 0;

  String user;
  while (true) {
    attempt += 1;
    compGuess = min + random.nextInt(max - min);
    stdout.write('$compGuess ? => ');
    user = stdin.readLineSync()!.toLowerCase();

    if (user == 'high') {
      max = compGuess;
    } else if (user == 'low') {
      min = compGuess;
    } else if (user == 'correct') {
      print('Number Guessed $compGuess ; Attempt $attempt');
      break;
    }
  }
}

void exercise22() {
  int largestOfThree(List<int> numbers) {
    int a = numbers[0];
    int b = numbers[1];
    int c = numbers[2];

    if (a >= b && a >= c) {
      return a;
    } else if (b >= a && b >= c) {
      return b;
    } else if (c >= a && c >= b) {
      return c;
    } else {
      return 0;
    }
  }

  stdout.write('enter 3 number : ');
  List<int> user =
      stdin.readLineSync()!.split(' ').map((a) => int.parse(a)).toList();
  print(largestOfThree(user));
}

void exercise23() {
  var n = 50;
  final Random random = Random();

  String dir = 'bin/sowpods.txt';
  File file = File(dir);

  List<String> words = file.readAsLinesSync();

  do {
    print(words[random.nextInt(words.length)]);
    n -= 1;
  } while (n > 0);
}

void exercise24() {
  // Hangman I
  bool isGuessed = false;
  String user;
  int attempt = 0;

  String word = 'EVAPORATE';
  List<String> wordAsLetter = word.split('');
  List<String> guessedLetter =
      List.generate(wordAsLetter.length, (empty) => '_');

  while (!isGuessed) {
    attempt += 1;
    stdout.write('Guess the Word=> ');
    user = stdin.readLineSync()!.toUpperCase();

    if (user == word) {
      print('-------------\nGUESSED in $attempt try\nThe Word is $word');
      break;
    } else if (user.length > 1 || !wordAsLetter.contains(user)) {
      print('nah');
    } else if (wordAsLetter.contains(user)) {
      if (guessedLetter.contains(user)) {
        print('you already guessed this right?');
      } else {
        for (var i = 0; i < wordAsLetter.length; i++) {
          if (wordAsLetter[i] == user) {
            guessedLetter[i] = wordAsLetter[i];
          }
        }
        print(guessedLetter.join(' '));
      }
    }

    if (guessedLetter.join('') == wordAsLetter.join('')) {
      print('-------------\nGUESSED in $attempt try\nThe Word is $word');
      break;
    }
  }
}

void exercise25() {
  int maxAttempt = 6;
  int attempt = 0;

  File file = File('bin/words.txt');
  List<String> words = file.readAsLinesSync();
  Random random = Random();

  String guess = '';
  String word = words[random.nextInt(words.length)].toUpperCase();
  List<String> wordAsLetter = word.split('');
  List<String> guessedLetter = List.generate(word.length, (empty) => '_');
  print(word);

  while (true) {
    if (attempt == maxAttempt) {
      print('----------------------------------------');
      print('You dont have any incorrect guesses left');
      print('The word is : $word');
      break;
    } else {
      attempt += 1;
      stdout.write('[]Guess the word => ');
      guess = stdin.readLineSync()!.toUpperCase();

      if (guess == word) {
        print('Guessed in $attempt attempt, the word is $guess');
        break;
      } else if (guess.length > 1 ||
          !wordAsLetter.contains(guess) ||
          guess.isEmpty) {
        print('Incorrect guess, you have ${maxAttempt - attempt} guess left');
      } else if (wordAsLetter.contains(guess)) {
        if (guessedLetter.contains(guess)) {
          print('You already guessed this letter');
          attempt -= 1;
        } else {
          for (var i = 0; i < wordAsLetter.length; i += 1) {
            if (wordAsLetter[i] == guess) {
              guessedLetter[i] = guess;
            }
          }
          print(
              '${guessedLetter.join(' ')} | ${maxAttempt - attempt} guess left');
        }
      }
      if (guessedLetter.join('') == word) {
        print('Guessed in $attempt attempt, the word is $guess');
        break;
      }
    }
  }
}

void exercise26() {
  Map<String, String> data = {
    'Galileo Galilei': '15/2/1564',
    'Isaac Newton': '25/12/1642',
    'Marie Curle': '7/11/1867',
    'Edwin Hubble': '20/11/1889'
  };
  print('Welcome to the birthday dictionary. We know the birthdays of: ');
  data.keys.toList().forEach((name) => print('>> $name'));
  while (true) {
    stdout.write('Who${"'"}s birthday do you want to look up?: ');
    String name = stdin.readLineSync()!;
    if (data.containsKey(name)) {
      print('${name} => ${data[name]}');
    }
  }
}

void exercise2728() {
  Map<int, String> birthday = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May'
  };

  String jsonFileDir = 'bin/birthday.json';
  String jsonFile = File(jsonFileDir).readAsStringSync();
  Map data = jsonDecode(jsonFile);

  void showAvailableBirthday() {
    print('--------------------------------------------------------------');
    print('Welcome to the birthday dictionary. We know the birthdays of: ');
    data.forEach((key, value) {
      print('->$key');
    });
    print('Other Function : add, delete, count');
  }

  void showBirthday(String name) {
    print('=>------------------------');
    print('=>${name} => ${data[name]}');
  }

  void addBirthday() {
    print('--------------------------------------');
    print('Enter name and birthday day (dd/mm/yy)');
    String name = stdin.readLineSync()!;
    String date = stdin.readLineSync()!;
    data[name] = date;
    File(jsonFileDir).writeAsStringSync(jsonEncode(data));
  }

  void countBirthday() {
    Map<String, int> counted = {};
    data.forEach((key, value) {
      var month = birthday[int.parse(value.toString().split('/')[1])]!;
      counted.update(month, (value) => value + 1, ifAbsent: () => 1);
    });
    print(counted);
  }

  void deleteBirthday() {
    print('--------------------------------------');
    print('Enter name to be deleted');
    String name = stdin.readLineSync()!;
    data.remove(name);
    File(jsonFileDir).writeAsStringSync(jsonEncode(data));
  }

  while (true) {
    showAvailableBirthday();
    stdout.write('Who${"'"}s birthday do you want to look up?: ');
    String user = stdin.readLineSync()!;

    if (data.containsKey(user)) {
      showBirthday(user);
    } else if (user.toLowerCase() == 'exit') {
      exit(0);
    } else if (user.toLowerCase() == 'add') {
      addBirthday();
    } else if (user.toLowerCase() == 'delete') {
      deleteBirthday();
    } else if (user.toLowerCase() == 'count') {
      countBirthday();
    }
  }
}

void main() {
  exercise2728();
}
