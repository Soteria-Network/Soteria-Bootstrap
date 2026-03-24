#!/bin/bash

echo "Removing Soteria data directories..."

rm -rf "$HOME/.soteria/blocks"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to remove blocks directory."
    exit 1
fi

rm -rf "$HOME/.soteria/chainstate"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to remove chainstate directory."
    exit 1
fi

rm -rf "$HOME/.soteria/messages"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to remove messages directory."
    exit 1
fi

rm -rf "$HOME/.soteria/assets"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to remove assets directory."
    exit 1
fi

echo "Downloading bootstrap archive..."
curl -LJO https://github.com/Soteria-Network/Soteria/releases/download/v1.1.0/bootstrap-20260321.zip
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to download bootstrap file."
    exit 1
fi

echo "Extracting bootstrap archive..."
unzip bootstrap-20260321.zip
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to unzip bootstrap archive."
    exit 1
fi

echo "Copying bootstrap files..."
cd bootstrap-20260321 || {
    echo "ERROR: Failed to enter bootstrap folder."
    exit 1
}

cp bootstrap.* "$HOME/.soteria/"
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to copy bootstrap files."
    exit 1
fi

cd "$HOME/.soteria" || {
    echo "ERROR: Failed to switch to Soteria data directory."
    exit 1
}

echo "Extracting bootstrap-20260321.zip..."
unzip -o bootstrap-20260321.zip
if [ $? -ne 0 ]; then
    echo "ERROR: Failed to extract bootstrap-20260321.zip."
    exit 1
fi

echo "Bootstrapping complete. Start the Soteria QT wallet and wait for it to sync."
