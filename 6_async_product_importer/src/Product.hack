namespace AsyncProductImporter;

class Product {
  public function __construct(
    public string $id,
    public string $name,
    public float $price,
    public string $category,
    public ?string $image_url = null,
    public ?float $rating = null,
  ) {}
}