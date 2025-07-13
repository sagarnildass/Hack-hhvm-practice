<<__EntryPoint>>
function main(): void {
  require_once(__DIR__.'/../src/Task.hack');
  require_once(__DIR__.'/../src/TaskManager.hack');

  $argv = \HH\global_get('argv') as vec<string>;
  $manager = TaskManager\TaskManager::create("tasks.json");

  $args = \array_slice($argv, 1);
  $command = $args[0] ?? null;

  switch ($command) {
    case 'add':
      $description_vec = \array_slice($args, 1);
      if (\count($description_vec) === 0) {
        echo "Error: 'add' command requires a description.\n";
        echo "Usage: hhvm bin/task.hack add \"Your task description\"\n";
        return;
      }
      $description = \implode(' ', $description_vec);
      $manager->addTask($description);
      echo "Task added: \"".$description."\"\n";
      break;
    case 'complete':
      $id_str = $args[1] ?? null;
      if ($id_str === null) {
        echo "Error: 'complete' command requires a task ID.\n";
        echo "Usage: hhvm bin/task.hack complete <id>\n";
        return;
      }

      $task_id = \HH\Lib\Str\to_int($id_str);
      if ($task_id === null) {
        echo "Error: Invalid task ID provided.\n";
        return;
      }

      if ($manager->markTaskAsComplete($task_id)) {
        echo "Task {$task_id} marked as complete.\n";
      } else {
        echo "Error: Task with ID {$task_id} not found.\n";
      }
      break;
    case 'delete':
      $id_str = $args[1] ?? null;
      if ($id_str === null) {
        echo "Error: 'delete' command requires a task ID.\n";
        echo "Usage: hhvm bin/task.hack delete <id>\n";
        return;
      } 

      $task_id = \HH\Lib\Str\to_int($id_str);
      if ($task_id === null) {
        echo "Error: Invalid task ID provided.\n";
        return;
      }

      if ($manager->deleteTask($task_id)) {
        echo "Task {$task_id} deleted.\n";
      } else {
        echo "Error: Task with ID {$task_id} not found.\n";
      }
      break;
    case 'list':
    case null: // Default case when no command is given
      $all_tasks = $manager->getTasks();
      if (\count($all_tasks) === 0) {
        echo "No tasks found.\n";
      } else {
        echo "--- Your Tasks ---\n";
        foreach ($all_tasks as $task) {
          $status = $task->is_completed ? 'Yes' : 'No';
          echo "ID: {$task->id}\n";
          echo "  Description: {$task->description}\n";
          echo "  Completed: {$status}\n";
          echo "------------------\n";
        }
      }
      break;

    default:
      echo "Unknown command: '{$command}'.\n";
      echo "Available commands: list, add\n";
      break;
  }
} 