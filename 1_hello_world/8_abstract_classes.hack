abstract class Shape {
  public string $name;

  public function __construct(string $name) {
    $this->name = $name;
  }

  abstract public function area() : void;

  public function describe(): void {
    echo "The shape is a {$this->name}.\n";
  }
}

class Circle extends Shape {
  public float $radius;

  public function __construct(string $name, float $radius) {
    parent::__construct($name);
    $this->radius = $radius;
  }
  <<__Override>>
  public function area(): float {
    return 3.14159 * $this->radius * $this->radius;
  }
}

class Rectangle extends Shape {
  public float $width;
  public float $height;

  public function __construct(string $name, float $width, float $height) {
    parent::__construct($name);
    $this->width = $width;
    $this->height = $height;
  }
  <<__Override>>
  public function area(): float {
    return $this->width * $this->height;
  }
}

<<__EntryPoint>>
function main(): void {
  $circle = new Circle("circle", 4.2);
  $rectangle = new Rectangle("rectangle", 4.0, 5.0);

  $circle->describe();
  $rectangle->describe();

  echo "The area of the circle is " . $circle->area() . "\n";
  echo "The area of the rectangle is " . $rectangle->area() . "\n";
}