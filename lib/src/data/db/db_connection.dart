import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list/src/data/models/task_model.dart';

late final Isar dbInstance;

Future<void> initDb() async {
  final dir = await getApplicationDocumentsDirectory();
  dbInstance = await Isar.open(
    [TaskModelSchema],
    directory: dir.path,
  );
}