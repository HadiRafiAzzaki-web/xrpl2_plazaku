import '../models/product_model.dart';
import '../models/variant_model.dart';

List<ProductModel> dataProducts = [
  ProductModel(
    id: 0,
    sellerId: 0,
    stock: 20,
    //product description
    description:
        'Samsung Galaxy A07 hadir dengan performa handal dan layar luas yang siap menemani aktivitas harian Anda. Cocok untuk kebutuhan multitasking, media sosial, hingga hiburan ringan. Dilengkapi baterai tahan lama yang siap mendukung produktivitas Anda sepanjang hari tanpa khawatir lowbat!',
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
    description:
        'Tas Wanita serbaguna dengan desain simpel namun tetap kasual. Sangat cocok digunakan untuk bepergian santai, hang out bersama teman, atau sebagai pelengkap outfit harian Anda. Terbuat dari material berkualitas yang ringan dan nyaman dibawa.',
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
    description:
        'Tampil elegan dan percaya diri dengan Tas Wanita Premium. Didesain secara eksklusif dengan kompartemen yang luas untuk menyimpan barang esensial Anda secara rapi. Menggunakan material pilihan dengan jahitan yang kokoh, ideal untuk acara formal maupun penggunaan kerja harian.',
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
    description:
        'Tingkatkan performa lari Anda dengan Sepatu Lari yang ringan dan fleksibel. Dilengkapi dengan teknologi sirkulasi udara (breathable upper) serta sol yang empuk untuk meredam benturan, memberikan kenyamanan maksimal di setiap langkah kaki Anda.',
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
    description:
        'Jaket Olahraga yang didesain khusus untuk mendukung aktivitas fisik Anda, baik indoor maupun outdoor. Menggunakan bahan premium yang efektif menyerap keringat dan cepat kering (dry-fit), menjaga tubuh Anda tetap sejuk dan nyaman selama berolahraga.',
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
    description:
        'Oli Mobil performa tinggi yang dirancang khusus untuk melindungi mesin dari aus, menjaga suhu mesin tetap stabil, dan mengoptimalkan efisiensi bahan bakar. Formula mutakhirnya memastikan mesin kendaraan Anda tetap bersih dan bekerja secara responsif.',
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
    description:
        'Solusi praktis untuk menyamarkan goresan dan memperbaiki warna body kendaraan Anda yang kusam. Cat Mobil ini memiliki daya tutup yang tinggi, cepat kering, dan memberikan hasil akhir yang kilap sekaligus memberikan perlindungan ekstra dari karat.',
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
