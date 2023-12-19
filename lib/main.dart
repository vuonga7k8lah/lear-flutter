import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fill in the Blank'),
        ),
        body: Center(
          child: FillInTheBlankText(),
        ),
      ),
    );
  }
}

class FillInTheBlankText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Danh sách các từ bạn muốn điền vào chỗ trống
    List<String> blanks = ['world', 'Flutter', 'awesome'];

    // Chuỗi với chỗ trống được đánh dấu bằng "__"
    String textWithBlanks = 'Hello, __! Welcome to __. Flutter is __!';

    // Tách chuỗi thành các phần có chỗ trống và không có chỗ trống
    List<String> parts = textWithBlanks.split('__');

    // Tạo danh sách các TextSpan
    List<InlineSpan> spans = List.generate(
      parts.length,
          (index) {
        if (index % 2 == 0) {
          // Phần không có chỗ trống
          return TextSpan(
            text: parts[index],
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          );
        } else {
          //Phần có chỗ trống
          return TextSpan(
            text: blanks[index ~/ 2], // Chọn từ tương ứng trong danh sách
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          );

        }
      },
    );

    return RichText(
      text: TextSpan(
        children: spans,
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fill in the Blank'),
//         ),
//         body: FillInBlankWidget(question: 'How much does Education WordPress Theme cost?', answer: '', onSubmit: (){
//
//         },),
//       ),
//     );
//   }
// }
// //
// // class FillInTheBlank extends StatefulWidget {
// //   @override
// //   _FillInTheBlankState createState() => _FillInTheBlankState();
// // }
// //
// // class _FillInTheBlankState extends State<FillInTheBlank> {
// //   TextEditingController _textController = TextEditingController();
// //   String sentence = 'I enjoy [your activity] in my free time.';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Column(
// //         children: [
// //           Text(
// //             sentence,
// //             style: TextStyle(fontSize: 18.0),
// //           ),
// //           SizedBox(height: 16.0),
// //           SecretWord(sentence),
// //         ],
// //       ),
// //     );
// //   }
// // }
// // class SecretWord extends StatelessWidget {
// //   final String answer;
// //
// //   SecretWord(this.answer);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     String value = "";
// //     int answerLength = answer.length;
// //     String answerHint = '.' * answerLength;
// //     double answerWidth = answerLength * 15.0;
// //
// //     return Container(
// //       width: answerWidth,
// //       height: null,
// //       child: TextFormField(
// //         maxLines: null,
// //         cursorColor: Colors.cyanAccent,
// //         cursorRadius: Radius.circular(12.0),
// //         cursorWidth: 2.0,
// //         style: TextStyle(
// //           color:
// //           (value == answer) ? Colors.amberAccent : Colors.lightGreenAccent,
// //           fontWeight: FontWeight.bold,
// //           fontSize: 20,
// //           letterSpacing: 3,
// //         ),
// //         autofocus: false,
// //         maxLength: answerLength,
// //         onChanged: (text) {
// //           value = text;
// //         },
// //         decoration: InputDecoration(
// //           isDense: true,
// //           contentPadding: const EdgeInsets.symmetric(vertical: -5),
// //           counterText: '',
// //           border: InputBorder.none,
// //           focusedBorder: InputBorder.none,
// //           enabledBorder: InputBorder.none,
// //           errorBorder: InputBorder.none,
// //           disabledBorder: InputBorder.none,
// //           hintText: answerHint,
// //           hintStyle: TextStyle(
// //             color: Colors.lightGreenAccent,
// //             fontWeight: FontWeight.bold,
// //             letterSpacing: 4,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// class FillInBlankWidget extends StatefulWidget {
//   final String question;
//   final String answer;
//   final Function onSubmit;
//
//   FillInBlankWidget({
//     required this.question,
//     required this.answer,
//     required this.onSubmit,
//   });
//
//   @override
//   State<FillInBlankWidget> createState() => _FillInBlankWidgetState();
// }
//
// class _FillInBlankWidgetState extends State<FillInBlankWidget> {
//   String _answer = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Text(widget.question),
//           TextField(
//             decoration: InputDecoration(
//               hintText: widget.answer,
//             ),
//             onChanged: (text) {
//               setState(() {
//                 _answer = text;
//               });
//             },
//           ),
//           GestureDetector(
//             onTap: () {
//               widget.onSubmit(_answer);
//             },
//             child: Text("Xác nhận"),
//           ),
//         ],
//       ),
//     );
//   }
// }