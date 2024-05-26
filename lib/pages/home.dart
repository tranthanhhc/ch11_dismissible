import 'package:ch11_dismissible/classes/trip.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Trip> _trips = [];
  @override

  void initState() {
    super.initState();
    _trips = [
      Trip(id: '0', tripName: 'Rome', tripLocation: 'Italy'),
      Trip(id: '1', tripName: 'Paris', tripLocation: 'France'),
      Trip(id: '2', tripName: 'New York', tripLocation: 'USA - New York'),
      Trip(id: '3', tripName: 'Cancun', tripLocation: 'Mexico'),
      Trip(id: '4', tripName: 'London', tripLocation: 'England'),
      Trip(id: '5', tripName: 'Sydney', tripLocation: 'Australia'),
      Trip(id: '6', tripName: 'Miami', tripLocation: 'USA - Florida'),
      Trip(id: '7', tripName: 'Rio de Janeiro', tripLocation: 'Brazil'),
      Trip(id: '8', tripName: 'Cusco', tripLocation: 'Peru'),
      Trip(id: '9', tripName: 'New Delhi', tripLocation: 'India'),
      Trip(id: '10', tripName: 'Tokyo', tripLocation: 'Japan')
    ];
  }

  void _markTripCompleted() {
    // Mark trip completed in Database or web service
  }
  void _deleteTrip() {
    // Delete trip from Database or web service
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dismissible'),
      ),
      body: ListView.builder(
        itemCount: _trips.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(_trips[index].id),
            background: _buildCompleteTrip(),
              secondaryBackground: _buildRemoveTrip(),
              onDismissed: (DismissDirection direction) {
                direction == DismissDirection.startToEnd ? _markTripCompleted() : _deleteTrip();
                setState(() {
                  _trips.removeAt(index);
                });
              },
            child: _buildListTile(index)
          );
        },
      ),
    );
  }
  ListTile _buildListTile(int index) {
    return ListTile(
      title: Text(_trips[index].tripName),
      subtitle: Text(_trips[index].tripLocation),
      leading: const Icon(Icons.flight),
      trailing: const Icon(Icons.fastfood),
    );
  }
  Container _buildCompleteTrip() {
    return Container(
      color: Colors.green,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.done,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
  Container _buildRemoveTrip() {
    return Container(
        color: Colors.red,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
