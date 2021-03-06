import 'package:flutter/material.dart';

import 'information_column/information_column.dart';

class BodyInformation extends StatefulWidget {
  const BodyInformation({Key? key}) : super(key: key);

  @override
  BodyInformationState createState() => BodyInformationState();
}

class BodyInformationState extends State<BodyInformation> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          InformationColumn(
            columnTitle: 'News',
          ),
          InformationColumn(
            columnTitle: 'Announcements',
          ),
          InformationColumn(
            columnTitle: 'Events',
          ),
        ],
      ),
    );
  }
}
