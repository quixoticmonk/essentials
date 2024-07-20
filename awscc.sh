#!/bin/bash

# Check if Homebrew is installed
echo "Checking if Homebrew is installed..."
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install goenv
echo "Installing goenv..."
brew install goenv

# Install Go version 1.22.5
echo "Installing Go version 1.22.5..."
goenv install 1.22.5
goenv global 1.22.5

# Set GOPROXY and GOPATH
echo "Setting GOPROXY and GOPATH..."
go env -w GOPROXY=direct
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Check Go version
go version

# Clone the Terraform AWS Cloud Control Provider repository
echo "Cloning the Terraform AWS Cloud Control Provider repository..."
git clone https://github.com/hashicorp/terraform-provider-awscc.git
cd terraform-provider-awscc

# Build and install tools
echo "Building and installing tools..."
make tools

# Install tfplugindocs
echo "Installing tfplugindocs..."
go install github.com/hashicorp/terraform-plugin-docs/cmd/tfplugindocs@v0.19.4

# Check tfplugindocs installation
which tfplugindocs
