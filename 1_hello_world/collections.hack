use namespace HH\Lib\Vec;

<<__EntryPoint>>
function main(): void {
  // Your code here
  // Vectors
  $vec = vec[1, 1, 2, 3, 5, 8];
  
  foreach ($vec as $value) {
    echo "$value\n";
  }
  
  // Collections
  $fruits = dict["apple" => "red", "orange" => "orange", "banana" => "yellow"];
  
  foreach ($fruits as $key => $value) {
    echo "$key: $value\n";
  }
  
  // Keysets
  $cities = keyset["London", "Kolkata"];

  foreach ($cities as $value) {
    echo "$value\n";
  }
  
  // Squares
  $squares = Vec\map($vec, $n ==> $n * $n);
  
  foreach ($squares as $value) {
    echo "$value\n";
  }

  // Find unique numbers
  $unique = vec(keyset($vec));
  
  foreach ($unique as $value) {
    echo "$value\n";
  }

}