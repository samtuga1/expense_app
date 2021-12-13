import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Expenses',
          style: TextStyle(letterSpacing: 0.5),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              CardBanner(
                price: 10.50,
                itemBought: 'Shoes',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardBanner extends StatelessWidget {
  final double price;
  final String itemBought;

  const CardBanner({
    Key? key,
    required this.price,
    required this.itemBought,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        leading: Container(
          padding: const EdgeInsets.all(9),
          child: Text('\$$price'),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.purple),
          ),
        ),
        title: Text(itemBought),
        subtitle: Text(
            '${DateTime.now().month.toString()}/${DateTime.now().day.toString()}/${DateTime.now().year.toString()}'),
        trailing: const Icon(Icons.delete),
      ),
    );
  }
}
