
function add(int $a, int $b): int {
  return $a + $b;
}

function square(int $a): int {
  return $a * $a;
}

function greet(string $name): void {
  echo "Hello, $name!\n";
}

function describe_person(string $name, int $age, ?string $middle_name): void {
  echo "Name: $name\n";
  echo "Middle name: ";
  if ($middle_name is null) {
    echo "No middle name\n";
  } else {
    echo "$middle_name\n";
  }
}

<<__EntryPoint>>
function main(): void {
  $sum = add(5, 7);
  $squared = square(4);
  echo "4 squared is $squared\n";
  echo "5 + 7 = $sum\n";
  greet("Sagarnil");
  describe_person("Sagarnil", 37, "bluedream");
}