class Vehicle {
  public int $year;

  public function __construct(int $year) {
    $this->year = $year;
  }

  public function getAge(): int {
    $current_year = (int)date("Y");
    return $current_year - $this->year;
  }
}

interface Drivable {
  public function drive(float $distance): void;
}

trait Insurable {
  public function insure(): void {
    echo "Your car is insurable\n";
  }
}

class Car extends Vehicle implements Drivable {
  use Insurable;

  public function drive(float $distance): void {
    echo "Driving $distance km\n";
  }
}

<<__EntryPoint>>
function main(): void {
  $car = new Car(2020);
  echo "Car age: {$car->getAge()} \n" ;
  $car->drive(300.0);
  $car->insure();
}