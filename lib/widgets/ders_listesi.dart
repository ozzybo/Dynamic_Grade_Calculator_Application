import 'package:dynamic_grade_calculator_app/helper/data_helper.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../models/ders.dart';

class DersListesi extends StatefulWidget {
  const DersListesi({Key? key}) : super(key: key);

  @override
  State<DersListesi> createState() => _DersListesiState();
}

class _DersListesiState extends State<DersListesi> {
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0 ? ListView.builder(
        itemCount: tumDersler.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.startToEnd,
            onDismissed: (a){
              DataHelper.tumEklenenDersler.removeAt(index);
              setState(() {
                
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                elevation: 5,
                child: ListTile(
                  title: Text(tumDersler[index].ad),
                  leading: CircleAvatar(
                    backgroundColor: Constants.anaRenk,
                    child: Text((tumDersler[index].harfDegeri *
                            tumDersler[index].krediDegeri).toStringAsFixed(0))
                        ),
                        subtitle: Text('${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}'),
                  ),
                ),
            ),
          );
        }) : Container(child: Center(child: Text('Lütfen Ders Ekleyiniz...', style: Constants.baslikStyle ,)),);
  }
}
