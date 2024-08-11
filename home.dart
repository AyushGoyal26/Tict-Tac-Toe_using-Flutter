import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/screenchanger.dart';

import 'tictac.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({super.key});
  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  List choice = ["X", "O"];
  String val ="X";
  @override
  Widget build(BuildContext context) {
  var obj = Provider.of<CounterProvider>(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.gas_meter,
                size: 200,
              ),
              Text("TIC TAC TOE",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Select Choice:"),
                DropdownButton(
                    value: val,
                    items: const [
                      DropdownMenuItem(value: "X", child: Text("X")),
                      DropdownMenuItem(value: "0", child: Text("0")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        obj.player=value!;
                        val = value;
                      });
                    }),
              ]),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Tictactoe()));
                  },
                  child: Text(
                    "START GAME",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  )),
              OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "EXIT",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
