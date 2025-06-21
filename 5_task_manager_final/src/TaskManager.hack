namespace TaskManager;

use TaskManager\Data\Task;
use HH\Lib\C;
use HH\Lib\Dict;

final class TaskManager {
  private dict<int, Task> $tasks;

  private function __construct(private string $storage_path) {
    $this->tasks = dict[];
  }

  public static function create(string $storage_path): TaskManager {
    $manager = new self($storage_path);
    $manager->loadTasks();
    return $manager;
  }

  private function loadTasks(): void {
    if (!\is_readable($this->storage_path)) {
      return;
    }
    $json_string = \file_get_contents($this->storage_path);
    if ($json_string === false) {
      return;
    }

    $decoded_data = \json_decode($json_string, true);
    $tasks_data = null;

    if ($decoded_data is vec<_>) {
      $tasks_data = $decoded_data;
    } else if ($decoded_data is dict<arraykey, mixed>) {
      // If it's a dict, we want the values, which should be a vec of task dicts
      $tasks_data = \array_values($decoded_data);
    } else {
      return; // Not a format we can handle
    }

    foreach ($tasks_data as $datapoint) {
      if ($datapoint is dict<_, _>) {
        $id = $datapoint['id'] as int;
        $description = $datapoint['description'] as string;
        $is_completed = $datapoint['is_completed'] as bool;
        $this->tasks[$id] = new Task($id, $description, $is_completed);
      }
    }
  }

  public function getTasks(): dict<int, Task> {
    return $this->tasks;
  }

  public function addTask(string $description): void {
    $keys = \array_keys($this->tasks);
    $highest_id = \count($keys) > 0 ? \max($keys) : 0;
    $new_id = $highest_id + 1;

    $this->tasks[$new_id] = new Task($new_id, $description, false);
    $this->saveTasks();
  }

  private function saveTasks(): void {
    $data_to_save = vec[];
    foreach ($this->tasks as $task) {
      $data_to_save[] = dict[
        'id' => $task->id,
        'description' => $task->description,
        'is_completed' => $task->is_completed,
      ];
    }

    $json_string = \json_encode($data_to_save, \JSON_PRETTY_PRINT);
    \file_put_contents($this->storage_path, $json_string);
  }

  public function markTaskAsComplete(int $id): bool {
    $contains_key = C\contains_key($this->tasks, $id);

    if ($contains_key) {
      $original_task = $this->tasks[$id];
      $original_task_description = $original_task->description;

      $this->tasks[$id] = new Task($id, $original_task_description, true);
      $this->saveTasks();
      return true;
    } else {
      return false;
    }
  }

  public function deleteTask(int $id): bool {
    $contains_key = C\contains_key($this->tasks, $id);

    if ($contains_key) {
      $this->tasks = Dict\filter_with_key(
        $this->tasks,
        ($k, $_) ==> $k !== $id,
      );
      $this->saveTasks();
      return true;
    } else {
      return false;
    }
  }
} 