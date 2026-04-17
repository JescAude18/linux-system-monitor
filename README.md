# linux-system-monitor

## Table of Contents

- [About](#about)
- [Features](#features)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Installation & Usage](#installation--usage)
- [Example Output](#example-output)
- [How It Works](#how-it-works)
- [Error Handling](#error-handling)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Author](#author)
- [License](#license)

## About

linux-system-monitor is my third Linux/Bash project in my DevOps learning journey.

The goal is to implement a comprehensive bash script that monitors your Linux system's status in real-time, displaying CPU usage, RAM, disk space, top processes, OS information, and system uptime. Perfect for quick system health checks and performance monitoring.

**Project Reference:** [roadmap.sh/projects/server-stats](https://roadmap.sh/projects/server-stats)

## Features

**Core Monitoring:**

- **CPU Usage**: Real-time CPU utilization percentage
- **RAM Monitoring**: Total, used, and free memory (MiB)
- **Disk Usage**: Partition space information for root filesystem
- **Process Insights**: Top 5 processes by CPU and memory usage

**System Information:**

- Operating System version
- Kernel version
- System architecture
- Uptime (duration and start time)
- Load average (1, 5, 15 minutes)
- Currently logged-in users

**User Experience:**

- Color-coded output for better readability
- Well-organized sections with clear labels
- Formatted and easy-to-parse data
- Welcome message with features overview

## Project Structure

```text
linux-system-monitor/
├── server-stats.sh          # Main monitoring script
└── README.md                # Documentation
```

## Requirements

- **OS**: Linux (Ubuntu, Debian, CentOS, Fedora, etc.)
- **Shell**: Bash 4.0+
- **Commands Used**:
  - `top` - CPU and memory info
  - `ps` - Process information
  - `df` - Disk space
  - `hostnamectl` - System information
  - `uptime` - System uptime
  - `who` - Logged-in users
  - `awk`, `grep`, `cut`, `bc` - Text processing

All required commands are typically pre-installed on standard Linux distributions.

## Installation & Usage

### 1. Clone or Download

```bash
git clone https://github.com/JescAude18/linux-system-monitor.git
cd linux-system-monitor
```

### 2. Make Executable

```bash
chmod +x server-stats.sh
```

### 3. Run the Script

```bash
./server-stats.sh
```

**Note**: Some commands may require `sudo` for full system information on certain systems.

## Example Output

```text
═════════════════════════════════════════════════════════════════════════════
=                               SYSTEM INFO                               =
═════════════════════════════════════════════════════════════════════════════

Welcome to this system monitor ! It displays statistics on the CPU, RAM, disk, the
 top five (05) processes by RAM and CPU, the os version, kernel, logged in users,
architecture, uptime and load average. Thanks for trying it ♥️ .

------------------------- CPU USAGE -------------------------

CPU usage : 15.4 %

------------------------- RAM USAGE -------------------------

Total: 15661.6 MiB
Used : 12543.7 MiB
Free : 640.4 MiB

------------------------- DISK USAGE ------------------------

Total: 232G
Used : 120G
Free : 112G

---------------- Top 5 processes by CPU usage ---------------

    PID COMMAND         %CPU
   1234 chrome          12.5
   5678 python3         8.2
   ...
```

## How It Works

### Data Collection

- **CPU**: Extracts idle percentage from `top` and calculates usage using `bc` for decimal arithmetic
- **RAM**: Parses `top` output with `grep`, `cut`, and `awk` to extract memory statistics
- **Disk**: Uses `df -h` with `awk` to filter the root partition (`/`) data
- **Processes**: `ps` command sorted by CPU/memory percentage
- **System Info**: `hostnamectl` provides OS, kernel, and architecture details

### Text Processing Pipeline

The script extensively uses `awk` for:

- Field extraction (columns from command output)
- Formatting and calculations
- Filtering specific data rows
- Building dynamic output strings

### Color Enhancement

ANSI color codes add visual distinction:

- Green: CPU section
- Blue: RAM section
- Yellow: Disk section
- Red: Process tables
- Cyan: Extra info section

## Error Handling

- **Missing Commands**: If `top`, `awk`, or other utilities aren't available, the script will fail. Install missing packages using your package manager (apt, yum, etc.)
- **Permission Issues**: Some systems may require `sudo` for full access to process and system information

## Roadmap

- [ ] Add CPU core breakdown per core usage
- [ ] Add network statistics (bandwidth, connections)
- [ ] Create a daemon mode (continuous monitoring with logging)
- [ ] Export data to JSON format
- [ ] Add alert thresholds for high CPU/memory usage
- [ ] Create a web-based dashboard interface

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Make your changes
4. Commit with clear messages (`git commit -m "Add feature description"`)
5. Push to the branch
6. Open a Pull Request

## Author

**Created by**: Jessica MOUSSOUGAN

**Email**: [jessicamoussougan@gmail.com](mailto:jessicamoussougan@gmail.com)

**GitHub**: [@JescAude18](https://github.com/JescAude18)

## License

No license yet.

This project is currently for personal training and learning.
