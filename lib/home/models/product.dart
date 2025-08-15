class Product {
  final String? icon, title, date, size;

  Product({this.icon, this.title, this.date, this.size});
}

// TODO move to fake repository
List productListData = [
  Product(
    icon: "assets/icons/xd_file.svg",
    title: "XD File",
    date: "01-03-2021",
    size: "USD 3.5",
  ),
  Product(
    icon: "assets/icons/Figma_file.svg",
    title: "Figma File",
    date: "27-02-2021",
    size: "USD 19.0",
  ),
  Product(
    icon: "assets/icons/doc_file.svg",
    title: "Document",
    date: "23-02-2021",
    size: "USD 32.5",
  ),
  Product(
    icon: "assets/icons/sound_file.svg",
    title: "Sound File",
    date: "21-02-2021",
    size: "USD 3.5",
  ),
  Product(
    icon: "assets/icons/media_file.svg",
    title: "Media File",
    date: "23-02-2021",
    size: "USD 2.5",
  ),
  Product(
    icon: "assets/icons/pdf_file.svg",
    title: "Sales PDF",
    date: "25-02-2021",
    size: "USD 3.5",
  ),
  Product(
    icon: "assets/icons/excel_file.svg",
    title: "Excel File",
    date: "25-02-2021",
    size: "USD 34.5",
  ),
];
