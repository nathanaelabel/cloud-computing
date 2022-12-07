part of 'pages.dart';

class Students extends StatefulWidget {
  const Students({Key? key}) : super(key: key);

  @override
  _StudentsState createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  @override
  Widget build(BuildContext context) {
    CollectionReference mahasiswaData = MahasiswaService.mhsColl;

    return Scaffold(
        appBar: AppBar(
          title: Text("Students Data"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: StreamBuilder<QuerySnapshot>(
                stream: mahasiswaData.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Failed to get mahasiswa data.');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return UiLoading.loading();
                  }
                  return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot doc) {
                      Map<String, dynamic> data =
                          doc.data()! as Map<String, dynamic>;
                      return Mahasiswacard(Mahasiswa(
                          id: doc.id,
                          name: data['name'],
                          nim: data['nim'],
                          umur: data['umur'],
                          createdAt: data['createdAt']));
                    }).toList(),
                  );
                },
              ),
            )
          ],
        ));
  }
}
