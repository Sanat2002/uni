import 'package:app_feup/view/Widgets/GenericCard.dart';
import '../../model/AppState.dart';
import 'package:flutter/material.dart';
import '../Theme.dart';
import 'BusStopRow.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'BusStopTimeStampRow.dart';


class BusStopCard extends StatelessWidget{

  final double padding = 8.0;
  String title;

  BusStopCard({
    Key key,
    @required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<dynamic>>(
      converter: (store) => store.state.content['busstops'],
      builder: (context, busstops){
        return GenericCard(
            title: "Paragens",
            func: () => Navigator.pushReplacementNamed(context, '/Próximas viagens'),
            child: getCardContent(context, busstops)
        );
      },
    );
  }

  Widget getCardContent(BuildContext context, busStops) {
    switch (StoreProvider.of<AppState>(context).state.content['busstopStatus']) {
      case RequestStatus.SUCCESSFUL:
        return Column(
          children: <Widget>[
            this.getTitle(context),
            this.getBusStopsInfo(context, busStops)
          ]
        );
        break;
      case RequestStatus.BUSY:
        return Column(
          children: <Widget>[
            this.getTitle(context),
            Center(child: CircularProgressIndicator())
          ],
        );
        break;
      case RequestStatus.FAILED:
        return Column(
          children : <Widget> [
            this.getTitle(context),
            Text("Failed to get new information", style: Theme.of(context).textTheme.display1.apply(color: primaryColor)),
            this.getBusStopsInfo(context, busStops),
          ]
        );
        break;
    }
  }
  
  Widget getTitle(context){
    return Row(
      children: <Widget>[
        Icon(Icons.directions_bus),
        Text(this.title, style: Theme.of(context).textTheme.display1.apply(color: primaryColor))
      ],
    );
  }

  Widget getBusStopsInfo(context, busStops){
    if (busStops.length >= 1)
      return
        Container(
            padding: EdgeInsets.all(padding),
            child: new Column(
              children: this.getBusStopRows(context, busStops),
            ));
    else
      return
        Center(
          child: Text("No stops to show at the moment"),
        );
  }

  List<Widget> getBusStopRows(context, busStops){
    List<Widget> rows = new List<Widget>();
    var size = busStops.length;

    rows.add(new BusStopTimeStamp());

    for(int i = 0; i < busStops.length; i++){
      rows.add(new BusStopRow(
          busStop : busStops[i]
      ));
    }
    return rows;
  }
}
