use TaskManager\Data\Task;
use namespace \HH\Lib\{File, Json, Dict, Math};
namespace TaskManager;

final class TaskManager {
  private dict<int, Task> $tasks;
  
  public async function __construct(private string $storage_path): Awaitable<void> {
    $this->tasks = dict[];

    if(\is_readable($this->storage_path)){
      $json_string = await File\get_contents_async($this->storage_path);
      // We expect the JSON to be a vector of objects.
      // Each object represents a task.
      $data = Json\decode($json_string) as vec<dict<string, mixed>>;

      foreach ($data as $datapoint) {
        $id = $datapoint["id"] as int;
        $description = $datapoint["description"] as string;
        $is_completed = $datapoint["is_completed"] as bool;

        $task = new Task($id, $description, $is_completed);
        $this->tasks[$id] = $task;
      }
    } else {
      echo "File does not exist.";
    }
  }

  public function getTasks(): dict<int, Task> {
    return $this->tasks;
  }

  public function addTask(string $description): void {
    $highest_id = Math\max(Dict\keys($this->tasks)) ?? 0;
    $new_id = $highest_id + 1;

    $new_task = new Task($new_id, $description, false);
    $this->tasks[$new_id] = $new_task;
  }
}