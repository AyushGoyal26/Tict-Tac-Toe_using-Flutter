import 'package:flutter/material.dart';
import 'package:tictac/home.dart';
import 'package:tictac/tictac.dart';

// class Screen extends StatefulWidget {
//   const Screen({super.key});

//   @override
//   State<Screen> createState() => _ScreenState();
// }

// class _ScreenState extends State<Screen> {
//   var curr="home";
//   String Player="";
//   screenchange(value){
//     setState(() {
//       curr="Tictac";
//       Player=value;

//     });}
//   screenreverse(){
//     setState(() {
//       curr="home";
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return (curr=="home")?HomeScr(onTapFunction:screenchange):Tictactoe(onTapFunction:screenreverse,choice:Player);
//   }
// }

class CounterProvider extends ChangeNotifier {
  String player = "X";
  void plus() {
    notifyListeners();
  }
List data = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  List winindex = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];
  late List temp;
  String won = "";
  String cpu = "";
  String cpuchoice = "";
    initState() {
    temp = List.of(data);
    player == "X" ? cpuchoice = "0" : cpuchoice = "X";
    notifyListeners();}
  tap(el) {
  print(temp);
  data[int.parse(el)-1]=player;
  checkwinners(player);
  notifyListeners();
  }

  checkwinners(choice) {
    for (List winner in winindex) {
      if (data[winner[0]] == choice &&
          data[winner[1]] == choice &&
          data[winner[2]] == choice) {
        print("$choice is winner");
        won = choice + " is winner";
        notifyListeners();
        return won;
      }
    }
  }
  cpumove(el) {
    temp.remove(el);
    temp.shuffle();
    cpu = temp[0];
    data[int.parse(cpu) - 1] = cpuchoice;
    temp.remove(cpu);
    notifyListeners();
    checkwinners(cpuchoice);

  }
  reset(){
    data = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
notifyListeners();
  }
}
