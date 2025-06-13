<<__EntryPoint>>
function main(): void {
  $name = "Sagarnil";
  $middle_name = "Bluedream";
  $middle_name2 = null;
  $age = 37;
  $is_student = false;

  // Explicit type annotation
  $city = "London";
  $score = 100;

  // Print variables
  echo "Name: $name\n";
  
  echo "Middle name: ";
  if ($middle_name is null) {
    echo "None\n";
  } else {
    echo $middle_name . "\n";
  }

  echo "Age: $age\n";
  echo "Is student: " . ($is_student ? "true" : "false") . "\n";
  echo "City: $city\n";
  echo "Score: $score\n";
}