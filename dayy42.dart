abstract class Command {
  void execute();
}

class Product {
  final String name;
  int stock;

  Product(this.name, this.stock);

  void addStock(int quantity) {
    stock += quantity;
  }

  void sell(int quantity) {
    if (stock >= quantity) {
      stock -= quantity;
    }
  }
}

class AddStockCommand implements Command {
  final Product product;
  final int quantity;

  AddStockCommand(this.product, this.quantity);

  @override
  void execute() {
    product.addStock(quantity);
  }
}

class SellCommand implements Command {
  final Product product;
  final int quantity;

  SellCommand(this.product, this.quantity);

  @override
  void execute() {
    product.sell(quantity);
  }
}

class Cashier {
  void process(Command command) {
    command.execute();
  }
}

void main() {
  Product rice = Product("Rice", 50);

  Cashier cashier = Cashier();

  Command add = AddStockCommand(rice, 20);
  Command sell = SellCommand(rice, 30);

  cashier.process(add);
  cashier.process(sell);

  print("Remaining stock: ${rice.stock}");
}