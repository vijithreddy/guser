#!/bin/bash

INSTALL_DIR="$HOME/bin"
CONFIG_DIR="$HOME/.guser"
MAN_DIR="$HOME/man/man1"

echo "Installing guser..."

# Create necessary directories
mkdir -p "$INSTALL_DIR"
mkdir -p "$CONFIG_DIR"
mkdir -p "$MAN_DIR"

# Check for jq
if ! command -v jq &> /dev/null; then
    echo "Error: jq is required. Please install it first:"
    echo "For Mac: brew install jq"
    echo "For Ubuntu/Debian: sudo apt-get install jq"
    echo "For RHEL/CentOS: sudo yum install jq"
    exit 1
fi

# Copy the script and man page
cp bin/guser "$INSTALL_DIR/guser"
cp man/man1/guser.1 "$MAN_DIR/guser.1"
chmod +x "$INSTALL_DIR/guser"

# Initialize config if needed
if [ ! -f "$CONFIG_DIR/config.json" ]; then
    echo '{"profiles":{}}' > "$CONFIG_DIR/config.json"
fi

# Add to PATH if needed
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.zshrc"
    echo "Added $HOME/bin to PATH"
fi

# Add MANPATH if needed
if [[ ":$MANPATH:" != *":$HOME/man:"* ]]; then
    echo 'export MANPATH="$HOME/man:$MANPATH"' >> "$HOME/.zshrc"
    echo "Added $HOME/man to MANPATH"
fi

echo "✓ Installation complete!"
echo "You may need to restart your terminal or run: source ~/.zshrc"