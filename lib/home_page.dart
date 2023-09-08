import 'package:flutter/material.dart';
import 'package:hng_app/link_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'My Profile',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
        ),
        actions: [
          TextButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LinkPage()));
              },
              child: const Text(
                'Open Github',
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 100,
                    color: Colors.amber,
                  ),
                  Positioned(
                      bottom: -60,
                      right: 10,
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/IMG_20230706_213551.jpg'))),
                      )),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 5),
                    Text(
                      'Zedem',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
