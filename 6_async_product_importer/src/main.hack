namespace AsyncProductImporter;
use type AsyncProductImporter\Product;
use type AsyncProductImporter\ExtraInfoFetcher;
use namespace HH\Lib\{Vec, Str, Json};

<<__EntryPoint>>
async function main(): Awaitable<void> {
  require_once(__DIR__.'/Importer.hack');
  require_once(__DIR__.'/Product.hack');
  require_once(__DIR__.'/ExtraInfoFetcher.hack');
  require_once(__DIR__.'/ApiFetcher.hack');

  $input_path = __DIR__ . '/../data/products.csv';
  $output_path = __DIR__ . '/../data/products.json';

  // Step 1: Import products from CSV
  $products = Importer::import_from_csv($input_path);

  // Step 2: Enrich products asynchronously
  $start = \microtime(true);
  $enriched = await Importer::enrich_products($products);
  $duration = \microtime(true) - $start;

  // Step 3: Write enriched products to JSON
  $json = \json_encode($enriched);
  \file_put_contents($output_path, $json);

  // Step 4: Print summary
  echo "Imported and enriched " . \count($enriched) . " products in {$duration} seconds.\n";
  echo "Output written to: {$output_path}\n";

  $awaitables = vec[];
  foreach (vec[1, 2, 3, 4, 5] as $user_id) {
    $awaitables[] = ApiFetcher::fetch($user_id);
  }
  $results = await \HH\Asio\v($awaitables);
  foreach ($results as list($name, $email)) {
    echo "Name: {$name}, Email: {$email}\n";
  }
}