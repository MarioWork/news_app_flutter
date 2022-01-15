import 'package:flutter/material.dart';
import 'package:news_app/models/country_model.dart';
import 'package:news_app/screens/news_feed_screen/components/countries_alert_dialog.dart';
import 'package:news_app/services/country_service.dart';

class AppbarContent extends StatefulWidget with PreferredSizeWidget {

  dynamic onChosenItem;

  AppbarContent({Key? key,required this.onChosenItem}) : super(key: key);

  @override
  State<AppbarContent> createState() => _AppbarContentState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}

class _AppbarContentState extends State<AppbarContent> {
  CountryModel currentCountry = CountryService().getFirstCountry();
  List<CountryModel> allCountries = CountryService().getAllCountries();

  @override
  AppBar build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomerAlertDialogWidget(
                      title: 'Escolha um País',
                      items: allCountries,
                      onTapFunction: (int index){
                        setState(() {
                          currentCountry = allCountries[index];
                          widget.onChosenItem(allCountries[index]);
                          Navigator.pop(context);
                        });
                      },
                    );
                  });
            },
            child: Text(currentCountry.countryName)));
  }

}
