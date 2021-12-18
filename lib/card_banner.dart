import 'package:flutter/material.dart';

class CardBanner extends StatelessWidget {
  final String price;
  final String itemBought;
  final String day;

  const CardBanner(
      {Key? key,
      required this.price,
      required this.itemBought,
      required this.day})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        leading: Container(
          padding: const EdgeInsets.all(9),
          child: Text('\$' + price),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.purple),
          ),
        ),
        title: Text(itemBought,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(day),
        //'${DateTime.now().month.toString()}/${DateTime.now().day.toString()}/${DateTime.now().year.toString()}'),
        trailing: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
