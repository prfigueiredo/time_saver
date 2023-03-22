import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//View (Model-View-Presenter pattern)
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '<< Remote Job Time Saver >>',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Divider(),
            SvgPicture.asset(
              'assets/remote.svg',
              height: 255,
            ),
            const Divider(),
            Text(
              'How much time do you spend going to the office?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Divider(),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'MINUTES(MINS)',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
