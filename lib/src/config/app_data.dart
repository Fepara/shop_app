import 'package:shop_app/src/models/cart_item_model.dart';
import 'package:shop_app/src/models/item_model.dart';
import 'package:shop_app/src/models/order_model.dart';
import 'package:shop_app/src/models/user_model.dart';

ItemModel minecraft = ItemModel(
  itemName: 'Minecraft',
  imgUrl: 'assets/jogos/minecraft.png',
  price: 89.99,
  description:
      'Explore o seu próprio mundo, sobreviva á noite e crie tudo que você puder imaginar!',
  unit: '',
);

ItemModel hades = ItemModel(
  itemName: 'Hades',
  imgUrl: 'assets/jogos/hades.png',
  price: 73.99,
  description:
      'Desafie o deus dos mortos enquanto você batalha para sair do Submundo neste jogo roguelike dos mesmos criadores de Bastion, Transistor e Pyre. ',
  unit: '',
);

ItemModel deadcells = ItemModel(
  itemName: 'Dead Cells',
  imgUrl: 'assets/jogos/deadcells.png',
  price: 47.49,
  description:
      'Dead Cells é um rogue-lite de ação em plataforma estilo Metroidvania. Você vai explorar um castelo extenso e em constante mutação... considerando que consiga enfrentar seus guardiões em combates 2D inspirados em Dark Souls. Sem checkpoints. Mate, morra, aprenda, repita.',
  unit: '',
);

ItemModel hollowknight = ItemModel(
  itemName: 'Hollow Knight',
  imgUrl: 'assets/jogos/hollowknight.png',
  price: 46.99,
  description:
      'Forje seu caminho em Hollow Knight! Uma aventura de ação épica em um vasto reino arruinado de insetos e heróis. Explore cavernas serpenteantes, lute contra criaturas malignas e alie-se a insetos bizarros num estilo clássico 2D desenhado à mão.',
  unit: '',
);

ItemModel deadspace = ItemModel(
  itemName: 'Dead Space',
  imgUrl: 'assets/jogos/deadspace.png',
  price: 199.99,
  description:
      'O clássico de terror de sobrevivência e ficção científica está de volta, totalmente reformulado para oferecer uma experiência ainda mais imersiva, incluindo aprimoramentos visuais, de áudio e de jogabilidade, ao mesmo tempo em que se mantém fiel à emocionante visão do jogo original.',
  unit: '2',
);

ItemModel forzahorizon5 = ItemModel(
  itemName: 'Forza Horizon 5',
  imgUrl: 'assets/jogos/forzahorizon5.png',
  price: 249.99,
  description:
      'Explore um mundo aberto vibrante nas terras mexicanas com corridas divertidas e sem limites enquanto pilota os melhores carros do mundo. Acelere para o Parque Hot Wheels e corra nas pistas mais radicais já criadas. Requer Forza Horizon 5, expansão vendida separadamente. ',
  unit: '',
);

List<ItemModel> items = [
  minecraft,
  hades,
  deadcells,
  hollowknight,
  forzahorizon5,
  deadspace,
];

List<String> categorias = [
  'Ação',
  'Aventura',
  'Terror',
  'Corrida',
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: minecraft,
    quantity: 1,
  ),
  CartItemModel(
    item: deadspace,
    quantity: 1,
  ),
  CartItemModel(
    item: hades,
    quantity: 1,
  ),
];

UserModel user = UserModel(
  name: 'Felipe',
  email: 'felipe@gmail.com',
  password: '',
);

List<OrderModel> orders = [
  // Pedido 01
  OrderModel(
    copyAndPaste: '31eqwe12',
    createdDateTime: DateTime.parse(
      '2024-05-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2024-06-08 11:00:10.458',
    ),
    id: 'asd6a54da6s2d1',
    status: 'pending_payment',
    total: 73.99,
    items: [
      CartItemModel(
        item: hades,
        quantity: 1,
      ),
      CartItemModel(
        item: minecraft,
        quantity: 1,
      ),
    ],
  ),
  OrderModel(
    copyAndPaste: '31eqwe12',
    createdDateTime: DateTime.parse(
      '2024-05-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2024-06-08 11:00:10.458',
    ),
    id: 'asd6a54da6s2d1',
    status: 'paid',
    total: 73.99,
    items: [
      CartItemModel(
        item: deadcells,
        quantity: 1,
      ),
    ],
  ),
];
