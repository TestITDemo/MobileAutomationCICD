import os
import platform
import subprocess

# Set variables
PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__))
TESTS_DIR = os.path.join(PROJECT_ROOT, "tests/test_suites")
RESULTS_DIR = os.path.join(PROJECT_ROOT, "results")

# Determine the platform to set the appropriate command separator
if platform.system() == "Windows":
    command_separator = ";"
else:
    command_separator = ":"

# Build the command to run Robot Framework tests
robot_command = f"robot --outputdir {RESULTS_DIR} {TESTS_DIR}"

# Run Robot Framework tests using subprocess
subprocess.run(robot_command, shell=True, check=True, env={"PATH": f"{os.getenv('PATH')}{command_separator}/usr/local/bin"})

