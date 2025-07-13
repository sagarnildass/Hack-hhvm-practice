use namespace HH\Lib\{Vec, IO};

async function fetch_user_data(): Awaitable<string> {
  // Sleep for 1,000,000 microseconds = 1 second
  await \HH\Asio\usleep(1000000);
  return "User data";
}

async function fetch_page_data(): Awaitable<string> {
  // Sleep for 2,000,000 microseconds = 2 seconds
  await \HH\Asio\usleep(2000000);
  return "Page data";
}

<<__EntryPoint>>
async function main(): Awaitable<void> {
  require_once(__DIR__.'/../vendor/autoload.hack');
  \Facebook\AutoloadMap\initialize();

  echo "Fetching data...\n";

  $start_time = \microtime(true);

  list($user_data, $page_data) = await \HH\Asio\v(vec[
    fetch_user_data(),
    fetch_page_data(),
  ]);

  $duration = \microtime(true) - $start_time;

  echo "{$user_data} and {$page_data} fetched.\n";
  echo "Total time: {$duration} seconds.\n";
} 