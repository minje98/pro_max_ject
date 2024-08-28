import 'package:flutter/material.dart';
import 'package:pro_max_ject/screen/notification/notice.dart';
import 'package:pro_max_ject/screen/notification/notice_write.dart';
import 'package:pro_max_ject/screen/widget/BaseNoticeBox.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NoticeAdmin());
}

class NoticeAdmin extends StatelessWidget {
  const NoticeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: NoticeAppBar(title: '공지사항 (Admin)',),
        body: NoticeAdminBodyWidget(),
      )
    );
  }
}

class NoticeAdminBodyWidget extends StatelessWidget {
  const NoticeAdminBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      color: const Color(0xFFF0F1F0),
      child: Column(
        children: [
          AddNoticeBtn(context: context),
          Expanded(
            child: ListView(
              children: [
                AdminNoticeBox(
                  context: context,
                  title: '테스트1',
                  content: '내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용',
                ),
                AdminNoticeBox(
                  context: context,
                  title: '테스트2',
                  content: '내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용'
                ),
                AdminNoticeBox(
                  context: context,
                  title: '테스트3',
                  content: '내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용'
                ),
                AdminNoticeBox(
                  context: context,
                  title: '테스트4',
                  content: '내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용'
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddNoticeBtn extends StatelessWidget {
  final BuildContext context;
  const AddNoticeBtn({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
      decoration: ShapeDecoration(
        color: Color(0x658BA38A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
      ),
      child: IconButton(
        onPressed: (){
          Navigator.push(
            this.context,
              MaterialPageRoute(
                builder: (context) => NoticeWrite(),
              )
          );
        }, // ************* CREATE logic
        icon: const Icon(Icons.add),
        color: Color(0xFF537052),
      ),
    );
  }
}

class AdminNoticeBox extends BaseNoticeBox {
  final BuildContext context;
  const AdminNoticeBox({
    Key? key,
    required String title,
    required String content,
    Color theme = Colors.white,
    required this.context,
  }) : super(key: key, title: title, content: content, theme: theme);

  @override
  List<Widget> extraWidgets() {
    return [
      Container(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoticeWrite(
                        title: title,
                        content: content,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit_note,
                  color: Colors.blue,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.delete,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      )
    ];
  }
}


