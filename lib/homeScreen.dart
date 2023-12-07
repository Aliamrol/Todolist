import 'package:flutter/material.dart';
import 'package:task_manager/taskScreen.dart';

int i = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.only(left: 10, top: 20, right: 10),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        // appBar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.menu,
                              size: 40,
                            ),
                            Image(
                                image: AssetImage("assets/images/logo.jpg"),
                                width: 50,
                                height: 50)
                          ],
                        ),
                        // heroSection
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(
                              left: 60, right: 60, top: 20, bottom: 20),
                          decoration: BoxDecoration(
                              color: Colors.green[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Manage your job",
                                textScaleFactor: 2,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 6),
                                child: Text("Manage your job and Enjoy!"),
                              )
                            ],
                          ),
                        ),
                        // listView
                        Expanded(
                            child: ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  i = index;
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    margin: EdgeInsets.only(top: 10),
                                    height: 70,
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Job ${i + 1} ",
                                              textScaleFactor: 1.4,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(3),
                                              child: Text(
                                                "Do this Job ",
                                                textScaleFactor: 1.2,
                                              ),
                                            )
                                          ],
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red[500],
                                                  )),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      Icons.circle_outlined))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                })),
                      ],
                    ),
                    // floatingPointAction
                    Positioned(
                      bottom: 50,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => taskScreen()));
                        },
                        child: Container(
                          child: Icon(
                            Icons.add,
                            size: 60,
                            color: Colors.white,
                          ),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.red[400],
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
