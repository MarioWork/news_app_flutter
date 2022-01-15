import 'package:flutter/material.dart';
import 'package:news_app/models/country_model.dart';

class CustomerAlertDialogWidget extends StatelessWidget {
  final String title;
  final List<CountryModel> items;
  final dynamic onTapFunction;

  const CustomerAlertDialogWidget(
      {Key? key,
      required this.title,
      required this.items,
      required this.onTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: 500,
        height: 200,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text(items[index].countryName), onTap: () {
                  onTapFunction(index);
            });
          },
        ),
      ),
    );
  }
}
