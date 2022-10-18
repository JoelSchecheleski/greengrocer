import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  picture: 'assets/images/fruits/apple.png',
  title: 'Maçã',
  price: 5.5,
  unit: 'kg'
);

ItemModel grape = ItemModel(
  picture: 'assets/images/fruits/grape.png',
  title: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  picture: 'assets/images/fruits/guava.png',
  title: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  picture: 'assets/images/fruits/kiwi.png',
  title: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  picture: 'assets/images/fruits/mango.png',
  title: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  picture: 'assets/images/fruits/papaya.png',
  title: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

// Lista de categorias
List<String> categorias = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
  'Carnes'
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 1),
  CartItemModel(item: mango, quantity: 1),
  CartItemModel(item: guava, quantity: 3),
];

UserModel user = UserModel(
  fullname: 'Joel Schecheleski',
  email: 'joel.jsp@gmail.com',
  phone: '47 9 9668-8829',
  cpf: '050.710.439-04',
  password: '',
);

List<OrderModel> orders = [
  // Pedido 01
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2022-06-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2022-12-12 11:00:10.458',
    ),
    id: 'asd6a54da6s2d1',
    status: 'preparing_purchase',
    total: 11.0,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: mango,
        quantity: 2,
      ),
      CartItemModel(
        item: grape,
        quantity: 8,
      ),
    ],
  ),

  // Pedido 02
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2022-12-12 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2022-12-12 11:00:10.458',
    ),
    id: 'a65s4d6a2s1d6a5s',
    status: 'delivered',
    total: 11.5,
    items: [
      CartItemModel(
        item: guava,
        quantity: 1,
      ),
    ],
  ),

  // Pedido 03
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2022-12-12 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2022-12-12 11:00:10.458',
    ),
    id: 'a65s4d6a2s1d6a5s',
    status: 'refunded',
    total: 11.5,
    items: [
      CartItemModel(
        item: guava,
        quantity: 1,
      ),
    ],
  ),

  // Pedido 04
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2020-12-12 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2020-12-12 11:00:10.458',
    ),
    id: 'a65s4d6a2s1d6a5s',
    status: 'pending_payment',
    total: 11.5,
    items: [
      CartItemModel(
        item: guava,
        quantity: 1,
      ),
    ],
  ),
];
