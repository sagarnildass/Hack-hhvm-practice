namespace TaskManager\Data;

final class Task {
  public function __construct(
    public int $id,
    public string $description,
    public bool $is_completed,
  ) {}
} 