# Hack Task Manager CLI

This is a simple command-line task manager application built with the Hack programming language. It serves as a practice project to demonstrate core Hack features.

## Project Setup

Follow these steps to set up the project and its dependencies.

### Prerequisites

- [HHVM](https://hhvm.com/proxygen/getting-started.html) (which includes the Hack runtime and typechecker)
- [Composer](https://getcomposer.org/) (the PHP dependency manager)

### 1. Initial Setup

First, clone this repository or create the project directory. Then, navigate into the project directory.

### 2. Create Project Structure

Create the necessary configuration file and source directories.

```bash
touch .hhconfig
mkdir src tests
```

### 3. Initialize Composer

Initialize a `composer.json` file to manage dependencies. You can accept the defaults for most of the prompts.

```bash
composer init
```

### 4. Install Core Dependencies

Install the Hack Standard Library (HSL) and the autoloader tool.

```bash
composer require hhvm/hsl hhvm/hhvm-autoload
```

### 5. Configure Autoloader

Create a configuration file for the autoloader named `hh_autoload.json` with the following content:

```json
{
  "roots": [
    "src/"
  ],
  "devRoots": [
    "tests/"
  ],
  "devFailureHandler": "Facebook\\AutoloadMap\\HHClientFallbackHandler"
}
```

### 6. Generate Autoload Map

Run the autoloader script to generate the class/function map. You will need to re-run this command whenever you add a new class or file to the project.

```bash
vendor/bin/hh-autoload
```

### 7. Install Development Dependencies

Install the required libraries for running unit tests.

```bash
composer require --dev hhvm/hacktest facebook/fbexpect
```

---

## Usage

*(This section will be updated once the application is built)*

### Running the Application

```bash
# Example: Add a new task
hhvm run.hack add "My new task"
```

### Running Tests

```bash
vendor/bin/hacktest tests/
``` 