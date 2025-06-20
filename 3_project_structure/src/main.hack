use namespace App\Math;
use namespace HH\Lib\IO;

<<__EntryPoint>>
async function main(): Awaitable<void> {
  require_once(__DIR__.'/../vendor/autoload.hack');
  \Facebook\AutoloadMap\initialize();

  $result = Math\Math::add(5, 3);
  await IO\request_output()->writeAllAsync("The result is: {$result}\n");
} 