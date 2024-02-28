#!/bin/bash

# Define your modules and environments
modules=("s3")
environments=("prod" "dev")
module_dir="modules"
# Base directory for your live infrastructure configurations
base_dir="./enviromnents"

for module in "${modules[@]}"; do
    # Create the directory for each module in module directory
    dir_path="${module_dir}/${module}"
    mkdir -p "${dir_path}"
done

# Create the project structure
for env in "${environments[@]}"; do
    for module in "${modules[@]}"; do
        # Create the directory for each module in each environment
        dir_path="${base_dir}/${env}/${module}"
        mkdir -p "${dir_path}"

        # Create a basic terragrunt.hcl file in each module directory
        cat <<EOF >"${dir_path}/terragrunt.hcl"
terraform {
  source = "../../modules/${module}"
}

# Include any necessary inputs here
inputs = {
  # Example input
  environment = "${env}"
}
EOF
    done
done

echo "Project structure created."
