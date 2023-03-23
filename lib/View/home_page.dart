import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:time_saver/Presenter/presenter_page.dart';

//View (Model-View-Presenter pattern)
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Instancing Presenter
  Presenter c = Presenter();

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
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                c.refresh();
              });
            },
            icon: Icon(Icons.refresh),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Divider(),
            SvgPicture.asset(
              height: 255,
              c.picture,
            ),
            const SizedBox(height: 10),
            Center(
                child: Text(
              c.info,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.indigoAccent),
            )),
            const SizedBox(
              height: 22,
            ),
            Text(
              'How much time do you spend going to the office?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'MINUTES(MINS)',
              ),
              textAlign: TextAlign.center,
              controller: c.goController,
            ),
            const Divider(),
            Text(
              'And on the way home?',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'MINUTES(MINS)',
              ),
              textAlign: TextAlign.center,
              controller: c.backController,
            ),
            const Divider(),
            Text(
              '...waiting the elevator?',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'MINUTES(MINS)',
              ),
              textAlign: TextAlign.center,
              controller: c.elevatorController,
            ),
            SizedBox(
                height: 50,
                width: 50,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        c.calculate();
                        c.change();
                      });
                    },
                    child: Text(
                      'VERDICT!',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ))),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
