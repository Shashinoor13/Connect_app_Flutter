// ignore_for_file: unused_import, non_constant_identifier_names, avoid_print, duplicate_ignore, prefer_const_constructors

import 'package:fitness2/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:fitness2/screens/info.api.dart';

import 'info.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Information>? _info;
  bool isLoading = true;
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  Future<void> getInfo() async {
    _info = await InformationAPI.getInfo();
    setState(() {
      isLoading = false;
    });
    print(_info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Top(),
      body: Slide_Panel(context),
      backgroundColor: kWhite,
    );
  }

  SlidingUpPanel Slide_Panel(BuildContext context) {
    return SlidingUpPanel(
      borderRadius: BorderRadius.circular(10),
      parallaxEnabled: true,
      panelBuilder: (ScrollController sc) => _scrollingList(sc),
      defaultPanelState: PanelState.CLOSED,
      maxHeight: MediaQuery.of(context).size.height,
      collapsed: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kGrey,
        ),
        child: Center(
          child: Text(
            "Slide Up To View Others",
            style: TextStyle(color: Colors.blueGrey[700]),
          ),
        ),
      ),
      body: Eyerything(),
    );
  }

//TODO

  Widget _scrollingList(ScrollController sc) {
    return ListView.builder(
      itemCount: 50,
      controller: sc,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                print('Pressed');
              },
              icon: const Icon(
                Icons.person,
                color: kBlue,
              ),
            ),
          ),
          title: Text('Person $index'),
        );
      },
    );
  }

  Column Eyerything() {
    return Column(
      children: [
        Sliding_Emojis(),
        const SizedBox(
          height: 30,
        ),
        Post_bar(),
        //Button to Post //
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Post_button(),
            SizedBox(
              width: 30,
            ),
            Image_button(),
          ],
        ),

        const SizedBox(
          height: 15,
        ),
        Column(
          //New Post
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(Input),
            )
          ],
        ),
      ],
    );
  }

  TextButton Post_button() {
    return TextButton(
      style: TextButton.styleFrom(backgroundColor: kYellow),
      onPressed: () => {
        Update(myController.text),
        myController.text = '',
      },
      child: const Text(
        'Post',
        style: TextStyle(color: kBlack),
      ),
    );
  }

  TextButton Image_button() {
    return TextButton(
      style: TextButton.styleFrom(backgroundColor: kYellow),
      onPressed: () => {},
      child: const Text(
        ' Add Image',
        style: TextStyle(color: kBlack),
      ),
    );
  }

  SizedBox Post_bar() {
    return SizedBox(
      width: 320,
      child: TextField(
        controller: myController,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.add,
            color: kGrey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: "What's on Your mind? ",
          hintStyle: const TextStyle(
            color: kGrey,
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Column Sliding_Emojis() {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Wrap(
                  spacing: 20,
                  children: [
                    Emoticon('🥳', 'Party'),
                    Emoticon('😀', 'Happy'),
                    Emoticon('😁', 'Fine'),
                    Emoticon('😂', 'LOL'),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  ClipRRect Emoticon(String emoji, String mood) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: kOrange,
          borderRadius: BorderRadius.circular(20),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: kGrey,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              mood,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar Top() {
    return AppBar(
      backgroundColor: kWhite,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Photo_and_Welcome(),
          Notification(),
        ],
      ),
    );
  }

  ClipRRect Notification() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(1000),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.notifications,
          color: kBlack,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Row Photo_and_Welcome() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset('assets/images/avatar.jpeg'),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        // ignore: prefer_const_literals_to_create_immutables
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'Hello, User!',
              style: TextStyle(
                fontSize: 12,
                color: kGrey,
              ),
            ),
            const Text(
              'Thursday,08 July',
              style: TextStyle(
                color: kBlack,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String Input = 'Your Post Will Appear Here';

  void Update(String Input_Text) {
    setState(() {
      Input = Input_Text;
    });
  }
}
