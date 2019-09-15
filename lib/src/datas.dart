import 'models/Product.dart';
import 'models/categories.dart';

List<Product> foods = [

    //burger

    Product(
        idPdt: 1,
        name: "Hamburger",
        image: "images/HAMBURGER 1000.jpg",
        price: 1000,
        menuPrice: null,
        isMenu: null,
        cat: 2,
        // userLiked: true,
        discount: 10
    ),
    Product(
        idPdt: 2,
        name: "Cheese burger",
        image: "images/CHEESE BURGER1500.jpg",
        price: 1500,
        menuPrice: null,
        isMenu: null,
        cat: 2,
        // userLiked: false,
        discount: null
    ),
    Product(
      idPdt: 3,
      name: "Double cheese burger",
      image: 'images/double CHEESE BURGER.jpg',
      price: 2500,
      menuPrice: 3500,
      isMenu: 'Menu',
      cat: 2,
      // userLiked: false,
    ),
    Product(
        idPdt: 4,
        name: "Chicken burger",
        image: "images/CHICKEN BURGER.jpg",
        price: 3500,
        menuPrice: 45000,
        isMenu: 'Menu',
        cat: 2,
        // userLiked: true,
        // discount: 3
    ),

    Product(
        idPdt: 5,
        name: "Veggie burger",
        image: "images/VEGGIE BURGER.jpg",
        price: 3500,
        menuPrice: 43000,
        isMenu: 'Menu',
        cat: 2,
        // userLiked: true,
        // discount: 3
    ),

     Product(
        idPdt: 6,
        name: "Smoked burger",
        image: "images/SMOKED CHICKEN Burger.jpg",
        price: 3500,
        menuPrice: 4500,
        isMenu: 'Menu',
        cat: 2,
        // userLiked: true,
        // discount: 3
    ),

    Product(
        idPdt: 7,
        name: "Country burger",
        image: "images/COUNTRY BURGER.jpg",
        price: 4000,
        menuPrice: 5000,
        isMenu: 'Menu',
        cat: 2,
        // userLiked: true,
        // discount: 3
    ),

    Product(
        idPdt: 8,
        name: "Hit burger",
        image: "images/HIT BURGER.jpg",
        price: 6000,
        menuPrice: null,
        isMenu: null,
        cat: 2,
        // userLiked: true,
        // discount: 3
    ),

    //chicken 
    Product(
        idPdt: 9,
        name: "Crusty chicken X4",
        image: "images/CRUSTY CHICKEN X4.jpg",
        price: 4000,
        menuPrice: null,
        isMenu: null,
        cat: 1,
        // userLiked: true,
        // discount: 3 
    ),

    Product(
        idPdt: 10,
        name: "Peri-peri chicken X4",
        image: "images/PERI-PERI CHICKEN X4.jpg",
        price: 4000,
        menuPrice: null,
        isMenu: null,
        cat: 1,
        // userLiked: true,
        // discount: 3 PERI-PERI WINGS X6
    ),

    Product(
        idPdt: 11,
        name: "Crusty chicken X10",
        image: "images/CRUSTY CHICKEN X10.jpg",
        price: 8000,
        menuPrice: null,
        isMenu: null,
        cat: 1,
        // userLiked: true,
        // discount: 3 
    ),

    Product(
      idPdt: 12,
      name: "Peri-peri chicken X10",
      image: "images/PERI-PERI CHICKEN X10.jpg",
      price: 8000,
      menuPrice: null,
      isMenu: null,
      cat: 1,
      // userLiked: true,
      // discount: 3 
  ),

  Product(
      idPdt: 13,
      name: "Crusty wings X6",
      image: "images/CRUSTY WINGS X6.jpg",
      price: 2500,
      menuPrice: null,
      isMenu: null,
      cat: 1,
      // userLiked: true,
      // discount: 3 
  ), 

    Product(
        idPdt: 14,
        name: "Peri-peri wings X6",
        image: "images/PERI-PERI WINGS X6.jpg",
        price: 2500,
        menuPrice: null,
        isMenu: null,
        cat: 1,
        // userLiked: true,
        // discount: 3 
    ),

     Product(
        idPdt: 15,
        name: "Crusty wings X10",
        image: "images/CRUSTY WINGS X10.jpg",
        price: 3500,
        menuPrice: null,
        isMenu: null,
        cat: 1,
        // userLiked: true,
        // discount: 3 
    ), 

    Product(
        idPdt: 16,
        name: "Peri-peri wings X10",
        image: "images/PERI-PERI WINGS X10.jpg",
        price: 3500,
        menuPrice: null,
        isMenu: null,
        cat: 1,
        // userLiked: true,
        // discount: 3 
    ),

    //Tacos

    Product(
      idPdt: 17,
      name: "Tacos (S)",
      image: "images/tacos taille S.jpg",
      price: 2000,
      menuPrice: null,
      isMenu: null,
      cat: 3,
      // userLiked: true,
      // discount: 3 
  ),

  Product(
      idPdt: 18,
      name: "Tacos (M)",
      image: "images/tacos taille M.jpg",
      price: 3000,
      menuPrice: 4000,
      isMenu: 'Menu',
      cat: 3,
      // userLiked: true,
      // discount: 3 
  ),

  Product(
      idPdt: 19,
      name: "Tacos (L)",
      image: "images/tacos taille L.jpg",
      price: 4000,
      menuPrice: 5000,
      isMenu: 'Menu',
      cat: 3,
      // userLiked: true,
      // discount: 3 
  ),

  Product(
      idPdt: 20,
      name: "Steak",
      image: "images/STEAK FRITES.jpg",
      price: 5500,
      menuPrice: null,
      isMenu: null,
      cat: 4,
      // userLiked: true,
      // discount: 3 
  ),

  Product(
      idPdt: 21,
      name: "Brochettes",
      image: "images/BROCHETTES.jpg",
      price: 5500,
      menuPrice: null,
      isMenu: null,
      cat: 4,
      // userLiked: true,
      // discount: 3 
  ),

  Product(
      idPdt: 22,
      name: "Mix grilled",
      image: "images/MIX GRILLED.jpg",
      price: 10000,
      menuPrice: null,
      isMenu: null,
      cat: 4,
      // userLiked: true,
      // discount: 3 
  )

];

List<Categories> categorie = [
  Categories(
    id: 1,
    name: 'Chickens',
    image: 'chickenCat.jpg',
    onPress: null,
  ),

  Categories(
    id: 2,
    name: 'Burgers',
    image: 'burgerCat.jpg',
    onPress: null,
  ),

  Categories(
    id: 3,
    name: 'Tacos',
    image: 'tacosCat.jpg',
    onPress: null,
  ),

  Categories(
    id: 4,
    name: 'Sandwichs',
    image: 'sandwichCat.jpg',
    onPress: null,
  ),

  Categories(
    id: 5,
    name: 'Hots Dogs',
    image: 'hotdogCat.jpg',
    onPress: null,
  ),

  Categories(
    id: 6,
    name: 'Salades',
    image: 'saladCat.jpg',
    onPress: null,
  ),

  Categories(
    id: 7,
    name: 'Gourmandises',
    image: 'gourmanCat.jpg',
    onPress: null,
  ),

  Categories(
    id: 8,
    name: 'Boissons',
    image: 'boissonCat.jpg',
    onPress: null,
  ),

  Categories(
    id: 9,
    name: 'Grillades',
    image: 'grillCat.jpg',
    onPress: null,
  ),

  Categories(
    id: 10,
    name: 'Extras',
    image: 'extraCat.jpg',
    onPress: null,
  ),
];
