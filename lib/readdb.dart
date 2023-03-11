import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReadDb extends StatelessWidget {
  const ReadDb({super.key});
  @override
  Widget build(BuildContext context) {
    String profes='Electrician';
    return Scaffold(
      appBar: AppBar(title:  Text(profes)),
      body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("seekersInformation")
            .orderBy('rating', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          final userSnapshot = snapshot.data?.docs;
          if (userSnapshot!.isEmpty) {
            return const Text("no data");
          }
          return ListView.builder(
              itemCount: userSnapshot.length,
              itemBuilder: (context, index) {
               if(userSnapshot[index]["work"]==profes){ return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                        border: Border.all(
                            color: const Color.fromARGB(96, 158, 158, 158)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 300,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  userSnapshot[index]["gender"]=='female'?'assets/workWmn.jpg':'assets/workMen.jpeg',
                                  width:
                                      MediaQuery.of(context).size.width / 2.7,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width / 2,
                                height: 150,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 30,
                                      child:  FittedBox(
                                        fit: BoxFit.contain,
                                        alignment: Alignment.centerLeft,
                                        child: Text(userSnapshot[index]["name"].toString()),
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 30,
                                      child:  FittedBox(
                                        alignment: Alignment.centerLeft,
                                        fit: BoxFit.contain,
                                        child: Text("Rating:"+ userSnapshot[index]["rating"].toStringAsFixed(1)),
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 30,
                                      child:  FittedBox(
                                        alignment: Alignment.centerLeft,
                                        fit: BoxFit.contain,
                                        child: Text("Gender: "+userSnapshot[index]["gender"]),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Container(
                            height: 110,
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children:  [
                                const Spacer(),
                                SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    fit: BoxFit.contain,
                                    child: Text("Address: "+userSnapshot[index]["address"]),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: double.infinity,
                                  height: 30,
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    fit: BoxFit.contain,
                                    child: Text("Phone: "+userSnapshot[index]["phone"]),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );}else{
                  return const Center();
                }
                // if (userSnapshot[index]["work"] == 'Carpenter') {
                //   return ListTile(
                //     leading: Container(
                //       child: Text(
                //           userSnapshot[index]["work"]),
                //     ),
                //     title: Text(userSnapshot[index]["name"]),
                //   );
                // }else{
                //   return const SizedBox();
                // }
              });
        },
      )),
    );
  }
}
