class DivisionByZeroExceptionSagarnil extends Exception {}

function safe_divide(float $a, float $b): float {
  if ($b === 0.0) {
    throw new DivisionByZeroExceptionSagarnil("Division by zero!");
  }
  return $a / $b;
}

<<__EntryPoint>>
function main(): void {
  try {
    $result = safe_divide(10.0, 0.0);
    echo "Result: $result\n";
  } catch (DivisionByZeroExceptionSagarnil $e) {
    echo "Caught division by zero: " . $e->getMessage() . "\n";
  } catch (Exception $e) {
    echo "Caught other exception: " . $e->getMessage() . "\n";
  } finally {
    echo "This always runs.\n";
  }

  try {
    $result = safe_divide(10.0, 2.0);
    echo "Result: $result\n";
  } catch (DivisionByZeroExceptionSagarnil $e) {
    echo "Caught division by zero: " . $e->getMessage() . "\n";
  } catch (Exception $e) {
    echo "Caught other exception: " . $e->getMessage() . "\n";
  } finally {
    echo "This always runs.\n";
  }
}