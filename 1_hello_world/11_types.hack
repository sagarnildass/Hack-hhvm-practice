type Product = shape('name' => string, 'ID' => int, ?'price' => float);

function product_details(Product $p): void {
  echo "Product name: " . $p['name'] . "\n";
  echo "Product ID: " . (string)$p['ID'] . "\n";

  if (\HH\Lib\Shapes::keyExists($p, 'price')) {
    echo "Product Price: " . (string)$p['price'] . "\n";
  } else {
    echo "No product price available.\n";
  }
}

enum class ProductStatus: string {
  PENDING = 'Product is pending';
  PROCESSING = 'Product is processing';
  SHIPPED = 'Product is shipped';
}

function get_product_status(ProductStatus $status): void {
  switch ($status) {
    case ProductStatus::PENDING:
      echo $status->value . "\n";
      break;
    case ProductStatus::PROCESSING:
      echo $status->value . "\n";
      break;
    case ProductStatus::SHIPPED:
      echo $status->value . "\n";
      break;
  }
}

<<__EntryPoint>>
function main(): void {
  $product = shape('name' => 'Product 1', 'ID' => 1);
  product_details($product);

  get_product_status(ProductStatus::SHIPPED);
} 