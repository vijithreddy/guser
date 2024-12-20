# guser - Git Profile Switcher

A command-line tool for easily managing multiple Git profiles. Switch between different Git configurations (name, email, SSH keys) with a single command.

## Features

- Create and manage multiple Git profiles
- Easy switching between profiles
- Stores SSH key configurations
- Interactive profile creation
- Simple command-line interface

## Prerequisites

- Git
- jq (JSON processor)
- Bash

## Installation

```bash
# Clone the repository
git clone git@github.com:vijithreddy/guser-tool.git
cd guser-tool

# Run the installer
./scripts/install.sh

# Reload your shell
source ~/.zshrc
```

## Usage

### Create a new profile

```bash
guser create personal
```

Follow the interactive prompts to set:

- Git user name
- Git email
- SSH key path

### List all profiles

```bash
guser list
```

### Switch between profiles

```bash
guser personal  # Switch to personal profile
guser work      # Switch to work profile
```

### Check current Git configuration

```bash
guser status
```

## Configuration

Profiles are stored in `~/.guser/config.json` with the following structure:

```json
{
  "profiles": {
    "personal": {
      "name": "Your Name",
      "email": "your.email@example.com",
      "ssh_key": "~/.ssh/your_key"
    }
  }
}
```

## Manual

For detailed information about the command, use:

```bash
man guser
```
