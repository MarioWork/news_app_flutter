import 'package:flutter/material.dart';

class AppbarContent extends StatelessWidget with PreferredSizeWidget {
  const AppbarContent({Key? key}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text('Escolhe um País'),
                    );
                  });
            },
            child: const Text('Portugal')));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
