import 'dart:io';
import 'dart:math';

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

void main() {
  exercise18TicTacToe();
}
