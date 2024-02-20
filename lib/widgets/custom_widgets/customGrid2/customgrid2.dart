import 'package:flutter/material.dart';

class CustomGrid2 extends StatefulWidget {
  const CustomGrid2({super.key});

  @override
  State<CustomGrid2> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            childAspectRatio: 1.2),
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          Card(
            elevation: 10,
            child: Container(
              height: 150,
              width: 150,
              color: Colors.white30,
              child: GridTile(
                footer: const Center(child: Text('الكافيهات')),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/cat-1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 150,
              width: 150,
              color: Colors.white30,
              child: GridTile(
                footer: const Center(child: Text('المحلات التجارية')),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/cat-3.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 150,
              width: 150,
              color: Colors.white30,
              child: GridTile(
                footer: const Center(child: Text('صالونات التجميل')),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/cat-4.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 150,
              width: 150,
              color: Colors.white30,
              child: GridTile(
                footer: const Center(child: Text('محلات تجارية')),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/cat-5.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 150,
              width: 150,
              color: Colors.white30,
              child: GridTile(
                footer: const Center(child: Text('مشاريع تقنية')),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/cat-6.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              height: 150,
              width: 150,
              color: Colors.white30,
              child: GridTile(
                footer: const Center(child: Text('شركات تجارية')),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      'assets/images/cat-2.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Card(
          //   elevation: 5,
          //   child: SizedBox(
          //     height: 100,
          //     width: 50,
          //     child: Image.asset('assets/images/cat-2.png'),
          //   ),
          // ),
          // Card(
          //   elevation: 5,
          //   child: SizedBox(
          //     height: 50,
          //     width: 50,
          //     child: Image.asset(
          //       'assets/images/cat-3.png',
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          // Card(
          //   elevation: 5,
          //   child: SizedBox(
          //     height: 50,
          //     width: 50,
          //     child: Image.asset('assets/images/cat-4.png'),
          //   ),
          // ),
          // Card(
          //   elevation: 5,
          //   child: SizedBox(
          //     height: 50,
          //     width: 50,
          //     child: Image.asset('assets/images/cat-4.png'),
          //   ),
          // ),
          // Card(
          //   elevation: 5,
          //   child: SizedBox(
          //     height: 50,
          //     width: 50,
          //     child: Image.asset('assets/images/cat-5.png'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
