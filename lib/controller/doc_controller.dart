import 'package:collaborating_editing_app/repository/document_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocAuthController extends StateNotifier<bool> {
  final DocsRepository _docRepo;

  DocAuthController({required DocsRepository repo})
      : _docRepo = repo,
        super(false);

  createDoc() async {
    final result = await _docRepo.createDoc();

  }
}


//date created, title, content,