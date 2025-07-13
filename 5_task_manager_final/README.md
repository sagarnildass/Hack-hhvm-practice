# Task Manager CLI

A simple command-line task manager application built with the Hack language.

## Prerequisites

Before you begin, ensure you have the following installed:

- [HHVM](https://hhvm.com/proxygen/getting-started.html) (which includes the Hack runtime and typechecker)
- [Composer](https://getcomposer.org/)

## Setup

1.  **Navigate to the project directory:**

    ```bash
    cd 5_task_manager_final
    ```

2.  **Install dependencies:**
    Use Composer to install the project's dependencies.
    ```bash
    composer install
    ```
    This will create a `vendor/` directory containing the required libraries.

## Usage

You can run the task manager from the command line using HHVM.

```bash
hhvm bin/task.hack
```

Alternatively, you can make the script executable for easier use:

```bash
chmod +x bin/task.hack
```

And then run it directly:

```bash
./bin/task.hack
```

The application will display a list of tasks. (Functionality to be expanded).

## Development

### Typechecking

To ensure the code is free of type errors, you can run the Hack typechecker:

```bash
hh_client
```

You may see some errors from the `vendor/` directory, which can typically be ignored. As long as it reports "No errors!" for the project's own source files, you are good to go.

### Running Tests

The project uses `hacktest` for unit testing. To run the test suite:

```bash
vendor/bin/hacktest
```
