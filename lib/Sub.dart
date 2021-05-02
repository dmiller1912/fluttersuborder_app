class Sub {

  int _size;
  double price;
  String toppings;
  String description;

  // ignore: non_constant_identifier_names
  final SUB_PRICES =[7.99, 9.999, 12.999];
  // ignore: non_constant_identifier_names
  final SUB_SIZES =["Six Inch", "Footlong", "18 Inch"];

  Sub(this._size, this.toppings){
    price = SUB_PRICES[_size];
    description = "$_size$toppings, Sub";
  }

  @override
  String toString()=> (SUB_SIZES[_size] + toppings + "Sub");
}