import '../models/product_model.dart';
import '../models/variant_model.dart';

List<ProductModel> dataProducts = [
  ProductModel(
    id: 0,
    sellerId: 0,
    stock: 20,
    //product description
    '',
    title: 'Samsung Galaxy A07',
    image: 'assets/images/samsung-galaxy07.webp',
    price: 1200000,
    category: Category.smartphoneTablet,
    rating: 4.5,
    review: 42,
    variants: [
      VariantModel(name: "Color", options: ["Blue", "Black"]),
      VariantModel(name: "Storage", options: ["64GB", "128GB"]),
    ],
    location: 'Jakarta',
    isFavorite: false,
  ),
  ProductModel(
    id: 1,
    sellerId: 0,
    stock: 15,
    //product description
    '',
    title: 'Tas Wanita',
    image: 'assets/images/pouche.jpg',
    price: 120000,
    category: Category.fashion,
    rating: 4.5,
    review: 42,
    variants: [
      VariantModel(name: "Color", options: ["Brown", "Cream"]),
    ],
    location: 'Malang',
    isFavorite: false,
  ),
  ProductModel(
    id: 2,
    sellerId: 0,
    stock: 10,
    //product description
    '',
    title: 'Tas Wanita Premium',
    image: 'assets/images/tas.jpg',
    price: 150000,
    category: Category.fashion,
    rating: 4.7,
    review: 57,
    variants: [
      VariantModel(name: "Color", options: ["Black", "Beige"]),
    ],
    location: 'Semarang',
    isFavorite: false,
  ),
  ProductModel(
    id: 3,
    sellerId: 0,
    stock: 30,
    //product description
    '',
    title: 'Sepatu Lari',
    image: 'assets/images/run-shoe.jpg',
    price: 200000,
    category: Category.sport,
    rating: 4.6,
    review: 35,
    variants: [
      VariantModel(name: "Size", options: ["40", "41", "42"]),
    ],
    location: 'Batu',
    isFavorite: false,
  ),
  ProductModel(
    id: 4,
    sellerId: 0,
    stock: 12,
    //product description
    '',
    title: 'Jaket Olahraga',
    image: 'assets/images/sportswear.webp',
    price: 200000,
    category: Category.sport,
    rating: 4.4,
    review: 28,
    variants: [
      VariantModel(name: "Size", options: ["M", "L", "XL"]),
    ],
    location: 'Bandung',
    isFavorite: false,
  ),
  ProductModel(
    id: 5,
    sellerId: 0,
    stock: 50,
    //product description
    '',
    title: 'Oli Mobil',
    image: 'assets/images/car-oil.jpg',
    price: 50000,
    category: Category.otomotif,
    rating: 4.8,
    review: 120,
    variants: [
      VariantModel(name: "Type", options: ["5W-30", "10W-40"]),
    ],
    location: 'Yogyakarta',
    isFavorite: false,
  ),
  ProductModel(
    id: 6,
    sellerId: 0,
    stock: 18,
    //product description
    '',
    title: 'Cat Mobil',
    image: 'assets/images/repairing-paint.jpg',
    price: 80000,
    category: Category.otomotif,
    rating: 4.3,
    review: 21,
    variants: [
      VariantModel(name: "Color", options: ["Red", "Black", "White"]),
    ],
    location: 'Medan',
    isFavorite: false,
  ),
];
