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
  final TextEditingController amountTextController = TextEditingController();

  calculateResults() {
    int sum = 0;
    List prices = [];
    for (var card in getCards) {
      prices.add(card.price);
      sum += int.parse(prices.last);
    }
    return sum;
  }

  showResults() {
    Alert(
            context: context,
            title: "Results",
            desc: "Your total spending was ${calculateResults()}")
        .show();
  }

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
              keyboardType: TextInputType.number,
              controller: amountTextController,
              textInputAction: TextInputAction.next,
              onSubmitted: (String value) {},
              decoration: const InputDecoration(
                labelText: 'Amount Spent',
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            color: Colors.purple,
            onPressed: () => setState(() {
              getCards.add(CardBanner(
                price: amountTextController.text,
                itemBought: itemTextController.text,
                day: dayTextController.text,
              ));
              itemTextController.clear();
              dayTextController.clear();
              amountTextController.clear();
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
    calculateResults();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: generateCards(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                      child: FlatButton(
                    onPressed: () {
                      setState(() {
                        showResults();
                      });
                    },
                    child: const Text(
                      'Calculate',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  )),
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 140,
                  height: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
