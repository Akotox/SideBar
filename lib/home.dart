import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:structure/models/document.dart';
import 'package:structure/reader_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.875,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 8, 2),
                child: Row(
                  children: const [
                    Icon(Ionicons.file_tray_full_outline, color: Color(0xFA1F2B36),),
                    SizedBox(width: 10,),
                    Text("Files",
                        style: TextStyle(
                            color: Color(0xFA1F2B36),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Column(
                  children: Document.doc_list
                      .map((doc) => ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          ReaderScreen(doc))));
                              setState(() {
                                doc.isRead = !doc.isRead;
                              });
                            },
                            leading: const Icon(Icons.picture_as_pdf_outlined),
                            title: Text(
                              "${doc.title}",
                              overflow: TextOverflow.ellipsis,
                            ),
                            // trailing: doc.isRead
                            //     ? const Icon(
                            //         Icons.check_box_outline_blank,
                            //         color: Colors.green,
                            //       )
                            //     : const Icon(Icons.check_box,
                            //         color: Colors.green),
                            subtitle: Text("${doc.page_num} Pages"),
                          ))
                      .toList()),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 8, 2),
                child: Row(
                  children: const [
                    Icon(MaterialIcons.personal_video, color: Color(0xFA1F2B36),),
                    SizedBox(width: 10,),
                    Text("Videos",
                        style: TextStyle(
                            color: Color(0xFA1F2B36),
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Column(
                  children: Document.doc_list
                      .map((doc) => ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          ReaderScreen(doc))));
                            },
                            leading:
                                const Icon(Icons.video_collection_outlined),
                            title: Text(
                              "${doc.title}",
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: doc.isRead
                                ? const Icon(Icons.check_box_outline_blank)
                                : const Icon(Icons.check_box,
                                    color: Colors.green),
                            subtitle: Text("${doc.page_num} Pages"),
                          ))
                      .toList()),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 8, 2),
                child: Row(
                  children: const [
                    Icon(MaterialIcons.multitrack_audio),
                    SizedBox(width: 10,),
                    Text("Audios",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Column(
                  children: Document.doc_list
                      .map((doc) => ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          ReaderScreen(doc))));
                            },
                            leading: const Icon(Icons.audio_file),
                            title: Text(
                              "${doc.title}",
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: !doc.isRead
                                ? const Icon(Icons.check_box_outline_blank)
                                : const Icon(Icons.check_box),
                            subtitle: Text("${doc.page_num} Pages"),
                          ))
                      .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
