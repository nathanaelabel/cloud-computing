part of 'widgets.dart';

class Mahasiswacard extends StatefulWidget {
  final Mahasiswa? mahasiswa;
  const Mahasiswacard({this.mahasiswa});
  // const Mahasiswacard({Key? key}) : super(key: key);

  @override
  _MahasiswacardState createState() => _MahasiswacardState();
}

class _MahasiswacardState extends State<Mahasiswacard> {
  @override
  Widget build(BuildContext context) {
    Mahasiswa mhs = widget.mahasiswa!;
    return Card(
        color: const Color(0xFFFFFFFF),
        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 2,
        child: InkWell(
          onTap: () {},
          splashColor: const Color(0xFF43A7FF),
          child: ListTile(
            contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
            leading: CircleAvatar(
              child: Text(
                "M",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text("${mhs.name} (${mhs.umur} y.o)",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                Text(
                  "Nim: ${mhs.nim}",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Added: ${mhs.createdAt}",
                  style: TextStyle(fontSize: 12, color: Colors.green),
                )
              ],
            ),
          ),
        ));
  }
}
