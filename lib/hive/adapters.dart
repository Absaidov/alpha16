import 'package:alpha16/models/dhikr.dart';
import 'package:hive/hive.dart';

class DhirkAdapter extends TypeAdapter<Dhikr> {
  @override
  final int typeId = 0;

  @override
  Dhikr read(BinaryReader reader) {
    int counter = reader.readInt();
    String title = reader.readString();
    DateTime date = DateTime.fromMillisecondsSinceEpoch(reader.readInt());

    return Dhikr(counter, title, date);
  }

  @override
  void write(BinaryWriter writer, Dhikr obj) {
    writer.writeInt(obj.counter);
    writer.writeString(obj.title);
    writer.writeInt(obj.date.millisecondsSinceEpoch);
  }
}
