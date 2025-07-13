namespace AsyncProductImporter;

class ApiFetcher {
  // Fetches user data from JSONPlaceholder and returns the user's name and email
  public static async function fetch(int $user_id): Awaitable<(string, string)> {
    $url = "https://jsonplaceholder.typicode.com/users/{$user_id}";

    $ch = \curl_init();
    \curl_setopt($ch, \CURLOPT_URL, $url);
    \curl_setopt($ch, \CURLOPT_RETURNTRANSFER, true);
    $response = \curl_exec($ch);
    \curl_close($ch);

    $name = "";
    $email = "";
    if ($response !== false) {
      $data = \json_decode($response, true);
      if (\is_array($data)) {
        $name = (string)($data['name'] ?? "");
        $email = (string)($data['email'] ?? "");
      }
    }
    return tuple($name, $email);
  }
} 