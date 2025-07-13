namespace TaskManager\Tests;

use type Facebook\HackTest\HackTest;
use function Facebook\FBExpect\expect;
use TaskManager\TaskManager;

final class TaskManagerTest extends HackTest {
  public function testItDeletesATask(): void {
    // Arrange: Create a unique temporary file for this test run.
    $storage_path = \sys_get_temp_dir().'/test_tasks_'.\bin2hex(\random_bytes(8)).'.json';

    try {
      $manager = TaskManager::create($storage_path);
      $manager->addTask('Task to be deleted'); // This will have ID 1

      // Act: Delete the task.
      $result = $manager->deleteTask(1);

      // Assert: Check that the deletion was successful and the task list is empty.
      expect($result)->toBeTrue('Expected deleteTask to return true for a valid ID');
      expect($manager->getTasks())->toBeEmpty('Expected tasks to be empty after deletion');

    } finally {
      // Cleanup: Always remove the temporary file.
      if (\file_exists($storage_path)) {
        \unlink($storage_path);
      }
    }
  }

  public function testItMarksATaskAsComplete(): void {
    // Arrange: Create a unique temporary file for this test run.
    $storage_path = \sys_get_temp_dir().'/test_tasks_'.\bin2hex(\random_bytes(8)).'.json';

    try {
      $manager = TaskManager::create($storage_path);
      $manager->addTask('Task to be marked as completed');

      // Act: Mark the task as complete
      $result = $manager->markTaskAsComplete(1);

      // Assert: Check that the marked task is completed.
      expect($result)->toBeTrue('Expected markTaskAsComplete to return true for a valid ID');
      $task_object = $manager->getTasks()[1];
      expect($task_object->is_completed)->toBeTrue('Expected task to have the variable is_completed to be true');
    } finally {
      // Cleanup: Always remove the temporary file.
      if (\file_exists($storage_path)) {
        \unlink($storage_path);
      }
    }
  }  
} 