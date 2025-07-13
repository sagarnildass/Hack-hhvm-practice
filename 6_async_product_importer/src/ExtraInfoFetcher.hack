namespace AsyncProductImporter;

class ExtraInfoFetcher {
  // Simulate an async network call to fetch image URL and rating
  public static async function fetch(Product $product): Awaitable<(string, float, float)> {
    // Simulate variable network delay based on product id
    $delay_ms = 100 + ((int)$product->id % 5) * 200; // 100ms, 300ms, 500ms, etc.
    $start = \microtime(true);
    await \HH\Asio\usleep($delay_ms * 1000);
    $end = \microtime(true);

    // Return dummy data and the time taken
    $image_url = "https://img.example.com/{$product->id}.jpg";
    $rating = 4.0 + ((int)$product->id % 10) / 10.0; // e.g., 4.1, 4.2, etc.
    $duration = $end - $start;

    return tuple($image_url, $rating, $duration);
  }
}