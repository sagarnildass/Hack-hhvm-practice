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

  public async function addTask(string $description): Awaitable<void> {
    $highest_id = Math\max(Dict\keys($this->tasks)) ?? 0;
    $new_id = $highest_id + 1;

    $new_task = new Task($new_id, $description, false);
    $this->tasks[$new_id] = $new_task;

    await $this->saveTasks();
  }

  private async function saveTasks(): Awaitable<void> {
    $data_to_save = vec[];
    foreach ($this->tasks as $task) {
      // Note the mapping from class properties to JSON keys.
      $data_to_save[] = dict[
        'id' => $task->ID,
        'description' => $task->description,
        'is_completed' => $task->status,
      ];
    }

    // JSON_PRETTY_PRINT makes the file easy for humans to read.
    $json_string = Json\encode_with_options($data_to_save, \JSON_PRETTY_PRINT);

    await File\write_contents_async($this->storage_path, $json_string);
  }
}