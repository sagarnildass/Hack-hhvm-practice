class Car {
  public string $brand;
  public string $model;
  public int $year;
  public float $mileage;

  public function __construct(string $brand, string $model, int $year, float $mileage) {
    $this->brand = $brand;
    $this->model = $model;
    $this->year = $year;
    $this->mileage = $mileage;
  }

  public function displayInfo(): void {
    echo "The car's brand is {$this->brand}. The car's model is {$this->model}. The car was made in the year {$this->year}. Mileage: {$this->mileage} km.\n";
  }

  public function drive(float $distance): void {
    $this->mileage += $distance;
    echo "{$this->brand} {$this->model} drove $distance km. New mileage: {$this->mileage} km.\n";
  }

  public function isVintage(): bool {
    $current_year = (int)date('Y');
    return ($current_year - $this->year) > 25;
  }

  public function updateYear(int $new_year): void {
    $this->year = $new_year;
    echo "Year of the car {$this->brand} {$this->model} has been updated to {$this->year}.\n";
  }

}

<<__EntryPoint>>
function main(): void {
  $car1 = new Car("Nissan", "Sentra", 1996, 120000.5);
  $car2 = new Car("Buick", "Lacrosse", 2012, 20000.5);

  $car1->displayInfo();
  $car2->displayInfo();

  $car1->drive(200.0);
  $car2->drive(514.8);

  if ($car1->isVintage()) {
    echo "This car is a vintage!\n";
  } else {
    echo "This car is not vintage.\n";
  }

  $car1->updateYear(2000);
  $car1->displayInfo();
}