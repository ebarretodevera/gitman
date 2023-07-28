#!/bin/bash

# Gets the path to the directory where this script is being run
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Colors
BANNER_COLOR="\033[0;35m"  # Dracula purple
CATEGORY_COLOR="\033[0;32m"  # Dracula green
OPTION_COLOR="\033[0;36m"  # Dracula cyan
DEFAULT_COLOR="\033[0m"  # Resets the color to its default value

# Loads the configuration file for messages and categories depending on the system language
if [[ ${LANG:0:2} == "es" ]]; then
    source ${DIR}/i18/lang_es.cfg
    source ${DIR}/i18/categories_es.cfg
else
    source ${DIR}/i18n/lang_en.cfg
    source ${DIR}/i18n/categories_en.cfg
fi

# Defines an associative array for categories and their options
declare -A categorias=(
    ["Features"]="$Features"
    ["Improvements"]="$Improvements"
    ["Security"]="$Security"
    ["Cleanup"]="$Cleanup"
    ["UX/UI"]="$UX_UI"
    ["Error Handling"]="$ErrorHandling"
    ["Testing"]="$Testing"
)

# Function to check if the current directory is a Git repository
check_git_repo() {
    if [ ! -d ".git" ]; then
        echo "$no_git_repo"
        exit 1
    fi
}

# Function to check for uncommitted changes
check_git_changes() {
    if [ -z "$(git status --porcelain)" ]; then
        echo "$no_changes"
        exit 1
    fi
}

# Function to print the commit options
print_commit_options() {
    echo -e "${BANNER_COLOR}"
    cat "${DIR}/src/banner.txt"
    echo -e "${DEFAULT_COLOR}"
    total_opciones=0
    echo "$select_option"
    for categoria in "${!categorias[@]}"; do
        echo -e "${CATEGORY_COLOR}"
        echo -e "---- $categoria ----"
        opciones=${categorias["$categoria"]}
        IFS='|' read -r -a opciones_array <<< "$opciones"
        for i in "${!opciones_array[@]}"; do
            total_opciones=$((total_opciones+1))
            echo -e "${OPTION_COLOR}"
            echo -e "$total_opciones) ${opciones_array[$i]}"
        done
    done
    echo -e "${DEFAULT_COLOR}"
}

# Function to select a commit option
select_commit_option() {
    opcion_valida=false
    while [ "$opcion_valida" = false ]; do
        read -p "$select_option_prompt" opcion
        if [[ "$opcion" =~ ^[0-9]+$ ]] && [ "$opcion" -le "$total_opciones" ] && [ "$opcion" -gt 0 ]; then
            opcion_valida=true
        else
            echo "$invalid_option"
        fi
    done
}

# Function to enter the commit message
enter_commit_message() {
    while [ -z "$mensaje" ]; do
        read -p "$enter_message" mensaje
        if [ -z "$mensaje" ]; then
            echo "$empty_message"
        fi
    done
}

# Function to perform the commit
perform_commit() {
    git add . 
    if [ $? -ne 0 ]; then
        echo "$add_failed"
        exit 1
    fi
    commit_message="$opcion_categoria: $opcion_texto: $mensaje"
    git commit -m "$commit_message"
    if [ $? -ne 0 ]; then
        echo "$commit_failed"
        exit 1
    fi
    echo "$creating_commit $commit_message"
    echo "$commit_success"
}

check_git_repo
check_git_changes
print_commit_options
select_commit_option
enter_commit_message
perform_commit
