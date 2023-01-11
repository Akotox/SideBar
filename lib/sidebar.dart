import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:structure/home.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(child: AppContainer());
  }
}

class AppContainer extends StatefulWidget {
  const AppContainer({super.key});

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final List<String> menuItems = [
    "Lesson",
    "Blog",
    "Games",
    "Practice",
    "Help"
  ];
  final List<dynamic> icons = [
    Ionicons.book,
    Entypo.globe,
    Entypo.game_controller,
    FontAwesome.microphone,
    MaterialCommunityIcons.chat,
  ];
  int selected = 0;
  String pageTitle = "Lesson";

  double yOffset = 0;
  double xOffset = 0;
  bool isSideBarOpen = false;

  List<Widget> pageList = <Widget>[
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),

  ];


  void sideBarState() {
    setState(() {
      xOffset = isSideBarOpen ? 200 : 60;
    });
  }

  void setPageTitle() {
    switch (selected) {
      case 0:
        pageTitle = "Lesson";
        break;
      case 1:
        pageTitle = "Related Blogs";
        break;
      case 2:
        pageTitle = "Related Games";
        break;
      case 3:
        pageTitle = "Speaking Practice";
        break;
      case 4:
        pageTitle = "Contact a teacher";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFA1F2B36),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  color: const Color(0xFA1F2B36),
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(20),
                          child: const Icon(
                            Feather.search,
                            color: Colors.white,
                          )),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(20),
                              hintText: "Dictionary",
                              enabled: false,
                              hintStyle: TextStyle(
                                color: Colors.white38,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: menuItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      // color:
                      // Color(0xffb1f2b36);

                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              isSideBarOpen = false;
                              sideBarState();
                              selected = index;
                              setPageTitle();
                            });
                          },
                          child: SideBarItems(
                            itemIcon: icons[index],
                            itemText: menuItems[index],
                            position: index,
                            selected: selected,
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(xOffset, yOffset, 1.0),
            // padding: EdgeInsets.only(left:20),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: isSideBarOpen
                    ? BorderRadius.circular(20)
                    : BorderRadius.circular(20)),

            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    isSideBarOpen = !isSideBarOpen;
                    sideBarState();
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 24),
                          height: 60,
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20),
                                child: const Icon(
                                  MaterialCommunityIcons
                                      .microsoft_xbox_controller_menu,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 20, bottom: 20),
                                child: Column(
                                  children: [
                                    Text(
                                      pageTitle,
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      pageList[selected]
                      ],
                    ),
                  ),

                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SideBarItems extends StatelessWidget {
  final String itemText;
  final IconData? itemIcon;
  final int selected;
  final int position;

  const SideBarItems(
      {super.key,
      required this.itemText,
      required this.itemIcon,
      required this.selected,
      required this.position});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: selected == position
          ? const Color.fromARGB(250, 18, 24, 31)
          : const Color(0xFA1F2B36),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(20),
              child: Icon(
                itemIcon,
                color: Colors.white,
              )),
          Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                itemText,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ))
        ],
      ),
    );
  }
}
