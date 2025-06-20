use namespace HH;
use namespace HH\Lib\IO;

async function fetch_data(): Awaitable<string> {
  // Simulate a network request by sleeping for 1 second
  await \HH\sleep_async(\HH\Duration::fromSeconds(1));
  return "Data fetched successfully!";
}

<<__EntryPoint>>
async function main(): Awaitable<void> {
  echo "Fetching data...\n";
  $result = await fetch_data();
  echo $result."\n";
} 