import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictac/screenchanger.dart';

class Tictactoe extends StatefulWidget {
  const Tictactoe(
      {super.key,});

  @override
  State<Tictactoe> createState() => _TictactoeState();
}

class _TictactoeState extends State<Tictactoe> {
 
  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<CounterProvider>(context);
    obj.initState();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.exposure_zero,
          size: 50,
        ),
        title: const Text("TIC TAC TOE"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 228, 18, 18),
      ),
      body: Column(
        children: [
          Text("Your choice is : ${obj.player}"),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                ...obj.data.map((el) {
                  return InkWell(
                    onTap: () {
                      obj.tap(el);
                      obj.cpumove(el);
                      print("button tapped");
                      obj.checkwinners(obj.player);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "$el",
                        style: const TextStyle(fontSize: 30),
                      ),
                      decoration: const ShapeDecoration(
                          color: Color.fromARGB(255, 49, 196, 36),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black))),
                    ),
                  );
                }),
              ],
            ),
          ),
          Text("Result: ${obj.won}",style: TextStyle(fontSize: 30),),
          OutlinedButton(
            onPressed: () {
              obj.reset();
              Navigator.pop(context);
            },
            child: Text(
              "EXIT",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
