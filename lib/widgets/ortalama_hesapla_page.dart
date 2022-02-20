import 'package:dynamic_grade_calculator_app/constants/app_constants.dart';
import 'package:dynamic_grade_calculator_app/helper/data_helper.dart';
import 'package:dynamic_grade_calculator_app/widgets/ders_listesi.dart';
import 'package:dynamic_grade_calculator_app/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

import '../models/ders.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text(
              Constants.baslikText,
              style: Constants.baslikStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                // ignore: prefer_const_constructors
                Expanded(
                  // ignore: prefer_const_constructors
                  child: OrtalamaGoster(
                    dersSayisi: DataHelper.tumEklenenDersler.length,
                    ortalama: DataHelper.ortalamaHesapla(),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                // ignore: prefer_const_constructors
                child: DersListesi(),
              ),
            )
            //liste
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Constants.yatayPadding8,
            child: _buildTextFormField(),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                padding: Constants.yatayPadding8,
                child: _buildHarfler(),
              )),
              Expanded(
                  child: Padding(
                padding: Constants.yatayPadding8,
                child: _buildKrediler(),
              )),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
                icon: const Icon(Icons.add_box_rounded),
                color: Constants.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Ders Adını Giriniz !';
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: 'Ders adını giriniz ...',
          border: OutlineInputBorder(
              borderRadius: Constants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Constants.anaRenk.shade100.withOpacity(0.2)),
    );
  }

  _buildHarfler() {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Constants.anaRenk.shade200,
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
          });
        },
        value: secilenHarfDegeri,
        items: DataHelper.tumDerslerinHarfleri(),
        underline: Container(),
      ),
    );
  }

  _buildKrediler() {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Constants.borderRadius,
      ),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Constants.anaRenk.shade200,
        onChanged: (deger) {
          setState(() {
            secilenKrediDegeri = deger!;
          });
        },
        value: secilenKrediDegeri,
        items: DataHelper.tumDerslerinKredileri(),
        underline: Container(),
      ),
    );
  }

  void _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
          DataHelper.dersEkle(eklenecekDers);
          setState(() {
            
          });
    }
  }
}
