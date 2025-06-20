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