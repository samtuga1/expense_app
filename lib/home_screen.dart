import 'package:expense_app/card_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    itemTextController.dispose();
    dayTextController.dispose();
    amountTextController.dispose();
    super.dispose();
  }

  List<CardBanner> getCards = [];
  final itemTextController = TextEditingController();
  final dayTextController = TextEditingController();
  final amountTextController = TextEditingController();

  popUpAlert() {
    Alert(
        context: context,
        title: "Add The Following",
        content: Column(
          children: <Widget>[
            TextField(
              controller: itemTextController,
              decoration: const InputDecoration(
                labelText: 'Item bought',
              ),
            ),
            TextField(
              controller: dayTextController,
              decoration: const InputDecoration(
                labelText: 'Day',
              ),
            ),
            TextField(
              controller: amountTextController,
              decoration: const InputDecoration(
                labelText: 'Amount Spent',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => setState(() {
              getCards.add(CardBanner(
                price: amountTextController.text,
                itemBought: itemTextController.text,
                day: dayTextController.text,
              ));
              Navigator.pop(context);
            }),
            child: const Text(
              "Add",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  generateCards() {
    return Column(
      children: getCards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              popUpAlert();
            });
          }),
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.purple,
        title: const Text(
          'Expenses',
          style: TextStyle(letterSpacing: 0.5),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: generateCards(),
        ),
      ),
    );
  }
}
