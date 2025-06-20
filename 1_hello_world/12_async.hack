async function get_daily_quote(): Awaitable<string> {
  await \HH\Asio\usleep(2_000_000);
  return "Fools rush in where angels fear to tread.";
}

<<__EntryPoint>>
async function main(): Awaitable<void> {
  echo "Fetching quote of the day...\n";

  $quote = await get_daily_quote();

  echo "Fetched quote: " . $quote . "\n";
}