import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navBarIcons = [
    Icons.arrow_back,
    Icons.fitness_center,
    Icons.home,
    Icons.business_center_outlined
  ];

  final List<Map<String, dynamic>> products = [
    {"name": "Camisa Mioche branca", "sector": "Social", "price": "R\$79,90"},
    {
      "name": "Camisa Calvin Klein preta",
      "sector": "Social",
      "price": "R\$79,90"
    },
    {"name": "Camisa Mioche azul", "sector": "Social", "price": "R\$79,90"},
    {
      "name": "Camisa Calvin Klein listrada",
      "sector": "Social",
      "price": "R\$89,90"
    },
    {
      "name": "Camisa Ralph Lauren rosa",
      "sector": "Social",
      "price": "R\$89,90"
    },
    {
      "name": "Camisa Calvin Klein estampada",
      "sector": "Social",
      "price": "R\$99,90"
    },
    {
      "name": "Camisa Ralph Lauren azul claro",
      "sector": "Social",
      "price": "R\$79,90"
    },
    {"name": "Camisa Nike regata", "sector": "Fitness", "price": "R\$39,90"},
    {"name": "Camisa Nike dry-fit", "sector": "Fitness", "price": "R\$59,90"},
    {"name": "Camisa GAP lisa", "sector": "Casual", "price": "R\$29,90"},
    {
      "name": "Camisa  Levi's estampada floral",
      "sector": "Casual",
      "price": "R\$49,90"
    },
    {
      "name": "Camisa GAP manga curta xadrez",
      "sector": "Casual",
      "price": "R\$39,90"
    },
    {
      "name": "Camisa Ralph Lauren slim fit",
      "sector": "Social",
      "price": "R\$99,90"
    },
    {
      "name": "Camisa socRalph Laurenial listrada azul",
      "sector": "Social",
      "price": "R\$89,90"
    },
    {
      "name": "Camisa Adidas manga longa dry-fit",
      "sector": "Fitness",
      "price": "R\$79,90"
    },
    {
      "name": "Camisa Zara estampada listras",
      "sector": "Casual",
      "price": "R\$59,90"
    },
    {
      "name": "Camisa Adidas manga curta",
      "sector": "Fitness",
      "price": "R\$49,90"
    },
    {
      "name": "Camisa Nike manga longa",
      "sector": "Fitness",
      "price": "R\$59,90"
    },
    {"name": "Camisa Zara estampada", "sector": "Casual", "price": "R\$39,90"},
    {"name": "Camisa  Levi's xadrez", "sector": "Casual", "price": "R\$49,90"},
    {"name": "Camisa Zara jeans", "sector": "Casual", "price": "R\$69,90"}
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Text(
              "Outfit shop",
              style: TextStyle(color: Colors.black),
            ),
            alignment: Alignment.center,
          ),
          backgroundColor: Colors.yellow,
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text("Vermelho"),
                  ),
                  PopupMenuItem(
                    child: Text("Verde"),
                  ),
                  PopupMenuItem(
                    child: Text("Azul"),
                  ),
                ];
              },
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.yellow.withOpacity(0.8),
                Colors.yellow.withOpacity(0.2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Icon(Icons.shop),
                  title: Text(
                    product['name'],
                  ),
                  subtitle: Text(product['sector']),
                  trailing: Text(product['price']),
                  onTap: () {
                    print('Tile ${product['name']} tocado');
                  },
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: NewNavBar(navBarIcons),
        bottomSheet: Container(
          color: Colors.yellowAccent,
          padding: EdgeInsets.all(16),
          child: Text(
            "Novas peças toda sexta-feira!",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class NewNavBar extends StatelessWidget {
  final List<IconData> navBarIcons;

  NewNavBar(this.navBarIcons);

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.black,
      items: List.generate(navBarIcons.length, (index) {
        return BottomNavigationBarItem(
          icon: Icon(navBarIcons[index]),
          label: "Voltar",
        );
      }),
    );
  }
}
