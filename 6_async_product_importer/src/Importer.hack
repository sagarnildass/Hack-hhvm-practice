namespace AsyncProductImporter;
use namespace HH\Lib\{Vec, Str, C};

class Importer {
  public static function import_from_csv(string $filepath): vec<Product> {
    $lines = vec[];
    $products = vec[];

    // Read all the lines from the file
    $handle = \fopen($filepath, 'r');
    if ($handle === false) {
      throw new \Exception("Could not open file: $filepath");
    }

    // Read header
    $header = \fgetcsv($handle);
    if ($header === false) {
      throw new \Exception("CSV file is empty: $filepath");
    }

    // Read each row
    while (($row = \fgetcsv($handle)) !== false) {
      $data = dict[];
      foreach ($header as $i => $key) {
        $data[$key] = $row[$i] ?? null;
      }

      // Basic validation: require id, name, price, category
      if (
        C\contains_key($data, 'id') && $data['id'] !== null &&
        C\contains_key($data, 'name') && $data['name'] !== null &&
        C\contains_key($data, 'price') && $data['price'] !== null &&
        C\contains_key($data, 'category') && $data['category'] !== null
      ) {
        $products[] = new Product(
          (string)$data['id'],
          (string)$data['name'],
          (float)$data['price'],
          (string)$data['category'],
        );
      }
      // (You can add error collection here if you want)
    }
    \fclose($handle);
    return $products;
  }

  public static async function enrich_products(vec<Product> $products): Awaitable<vec<Product>> {
    $awaitables = $products |> Vec\map($$, async $product ==> {
      list($image_url, $rating, $duration) = await ExtraInfoFetcher::fetch($product);
      // Print how long this product took to enrich
      echo "Product {$product->id} enriched in {$duration} seconds\n";
      return new Product(
        $product->id,
        $product->name,
        $product->price,
        $product->category,
        $image_url,
        $rating,
      );
    });
  
    return vec(await \HH\Asio\v($awaitables));
  }
}