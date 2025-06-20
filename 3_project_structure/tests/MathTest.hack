use namespace App\Math;
use function Facebook\FBExpect\expect;
use type Facebook\HackTest\{DataProvider, HackTest};

final class MathTest extends HackTest {
  public function provideAddData(): vec<(int, int, int)> {
    return vec[
      tuple(5, 10, 15), // Two positives
      tuple(10, -5, 5), // Positive and negative
      tuple(-5, -10, -15), // Two negatives
    ];
  }

  <<DataProvider('provideAddData')>>
  public function testAdd(
    int $first_number,
    int $second_number,
    int $expected,
  ): void {
    $actual = Math\Math::add($first_number, $second_number);

    expect($actual)->toBeSame($expected);
  }
}