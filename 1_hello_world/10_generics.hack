use namespace HH\Lib\C;

function get_last<T>(vec<T> $items): ?T {
  $count = C\count($items);
  // Check if the vector is empty first!
  if ($count === 0) {
    return null;
  }
  // Now it's safe to get the last element
  return $items[$count - 1];
}

class KeyValuePair<T1, T2> {
  public function __construct(private T1 $value1, private T2 $value2) {}

  public function getFirst(): T1 {
    return $this->value1;
  }

  public function getSecond(): T2 {
    return $this->value2;
  }
}

<<__EntryPoint>>
function main(): void {
  $numbers = vec[1, 2, 3];
  $last_num = get_last($numbers);
  echo "Last Number: " . (string)$last_num . "\n";

  $strings = vec['a', 'b', 'c'];
  $last_str = get_last($strings); // $last_str is a ?string
  echo "Last string: " . (string)$last_str . "\n";

  $pairs = new KeyValuePair("Sagarnil", 37);
  $first_value = $pairs->getFirst();
  $second_value = $pairs->getSecond();

  echo "First value: " . $first_value . "\n";
  echo "Second value: " . $second_value ."\n";
}