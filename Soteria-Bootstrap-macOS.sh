#!/bin/bash

echo "Removing Soteria data directories..."

rm -rf "$HOME/Library/Application Support/Soteria/blocks"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to remove blocks directory."
    exit 1
fi

rm -rf "$HOME/Library/Application Support/Soteria/chainstate"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to remove chainstate directory."
    exit 1
fi

rm -rf "$HOME/Library/Application Support/Soteria/messages"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to remove messages directory."
    exit 1
fi

rm -rf "$HOME/Library/Application Support/Soteria/assets"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to remove assets directory."
    exit 1
fi

echo "Downloading bootstrap archive..."
curl -LJO https://github.com/Soteria-Network/Soteria-Bootstrap/archive/refs/tags/10-01-2026.zip
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to download bootstrap file."
    exit 1
fi

echo "Extracting bootstrap archive..."
unzip Soteria-Bootstrap-10-01-2026.zip
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to unzip bootstrap archive."
    exit 1
fi

echo "Copying bootstrap files..."
cd "Soteria-Bootstrap-10-01-2026" || {
    echo "ERROR: Failed to enter bootstrap folder."
    exit 1
}

cp bootstrap.* "$HOME/Library/Application Support/Soteria/"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to copy bootstrap files."
    exit 1
fi

cd "$HOME/Library/Application Support/Soteria" || {
    echo "ERROR: Failed to switch to Soteria data directory."
    exit 1
}

echo "Extracting bootstrap.zip..."
unzip -o bootstrap.zip
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to extract bootstrap.zip."
    exit 1
fi

echo "Bootstrapping complete. Start the Soteria QT wallet and wait for it to sync."
