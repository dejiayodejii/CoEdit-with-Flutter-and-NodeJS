import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController titleController =
      TextEditingController(text: 'Untitled Document');
  QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            QuillToolbar.simple(
              configurations: QuillSimpleToolbarConfigurations(
                controller: _controller,
                sharedConfigurations: const QuillSharedConfigurations(
                  locale: Locale('de'),
                ),
              ),
            ),
            Expanded(
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  controller: _controller,
                  readOnly: false,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('de'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Expanded(
            //   child: SizedBox(
            //     width: 750,
            //     child: Card(
            //       color: Colors.white,
            //       elevation: 5,
            //       child: Padding(
            //         padding: const EdgeInsets.all(30.0),
            //         child: quill.QuillEditor.basic(
            //           controller: _controller!,
            //           readOnly: false,
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
