import 'package:flutter/material.dart';
import 'package:learn_flutter/views/single_page.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final List<Map> meals = [
    { 'name': 'Pizza', 'price': 8.99, 'image': 'https://assets.afcdn.com/recipe/20160519/15342_w600.jpg' },
    { 'name': 'Burger', 'price': 6.99, 'image': 'https://cac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fcac.2F2018.2F09.2F25.2F03ab5e89-bad7-4a44-b952-b30c68934215.2Ejpeg/748x372/quality/90/crop-from/center/burger-maison.jpeg' },
    { 'name': 'Crêpe', 'price': 4.99, 'image': 'https://cac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fcac.2F2018.2F09.2F25.2F830851b1-1f2a-4871-8676-6c06b0962938.2Ejpeg/748x372/quality/90/crop-from/center/crepes-comme-chez-nous.jpeg' },
    { 'name': 'Cake', 'price': 3.99, 'image': 'https://cac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FCAC.2Fvar.2Fcui.2Fstorage.2Fimages.2Fdossiers-gourmands.2Ftendance-cuisine.2Fles-gateaux-du-gouter-45-recettes-gourmandes-en-diaporama-187414.2F1637287-1-fre-FR.2Fles-gateaux-du-gouter-45-recettes-gourmandes-en-diaporama.2Ejpg/748x372/quality/90/crop-from/center/cake-nature-sucre.jpeg' },
    { 'name': 'Donuts', 'price': 2.99, 'image': 'https://cac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fcac.2F2018.2F09.2F25.2F80586d11-1f17-40ad-80ae-4cd9b5c42182.2Ejpeg/748x372/quality/90/crop-from/center/donuts-avec-appareil-a-donuts.jpeg' },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des plats')
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(
              children: [
                Hero(
                  tag: 'meal-${meals[index]['name']}',
                  child: Image.network(
                    meals[index]['image'],
                    width: 175, height: 200,
                    fit: BoxFit.cover
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meals[index]['name'],
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${meals[index]['price']} €',
                        style: TextStyle(fontSize: 22)
                      ),
                      ElevatedButton(
                        child: Text('Voir'),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SinglePage(meals[index]))
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}