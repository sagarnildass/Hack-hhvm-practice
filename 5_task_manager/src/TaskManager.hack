use TaskManager\Data\Task;
namespace TaskManager;

final class TaskManager {
  private dict<int, Task> $tasks;
  
  public function __construct(private string $storage_path) {
    $this->tasks = dict[];
  }
}