import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const CalculatorPage(), 
    );
  }
}

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SAMSUNG'), 
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    '0',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(16), 
              color: Colors.black,
              child: Column(
                children: [
                  buildButtonRow(['AC', '+/-', '%', '÷'], Colors.orange.shade800, Colors.white),
                  buildButtonRow(['7', '8', '9', '×'], Colors.blue.shade800, Colors.white),
                  buildButtonRow(['4', '5', '6', '-'], Colors.blue.shade800, Colors.white),
                  buildButtonRow(['1', '2', '3', '+'], Colors.blue.shade800, Colors.white),
                  buildButtonRow(['0', '.', '=', '#'], Colors.blue.shade800, Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white54,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Widget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons, Color buttonColor, Color textColor) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons
            .map((text) => buildButton(text, buttonColor, textColor))
            .toList(),
      ),
    );
  }

  Widget buildButton(String text, Color buttonColor, Color textColor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0), 
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: textColor,
            padding: const EdgeInsets.all(16), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
