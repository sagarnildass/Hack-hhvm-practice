<<__EntryPoint>>
function main(): void {
  // If-else
  $score = 96;
  if ($score >= 40) {
    echo "You've passed with $score%\n";
  } else {
    echo "You've failed with $score%\n";
  }

  // For loop
  for ($i = 0; $i < 5; $i++) {
    echo "$i\n";
  }

  // For each loop
  $fruits = vec["Mango", "Orange", "Apple"];
  foreach ($fruits as $fruit) {
    echo "Fruit name is: $fruit\n";
  }
  
  // Switch
  $day = "Wednesday";

  switch ($day) {
    case "Sunday":
    case "Saturday":
        echo "$day is a Weekend\n";
        break;
    default:
        echo "$day is a Weekday\n";
    }
}