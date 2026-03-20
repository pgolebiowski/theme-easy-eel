source (dirname (realpath (status --current-filename)))/../colors.fish

function _easy_eel_display_prompt_section_git_state
    not _easy_eel_git_is_repo; and return

    echo -n "on "

    set -q EASY_EEL_COLOR_GIT_BRANCH; or set -l EASY_EEL_COLOR_GIT_BRANCH purple
    _easy_eel_colored_print $EASY_EEL_COLOR_GIT_BRANCH (_easy_eel_git_branch_name)
    echo -n ' '

    set -l state (_easy_eel_print_git_state)
    set -q EASY_EEL_COLOR_GIT_STATE; or set -l EASY_EEL_COLOR_GIT_STATE blue
    _easy_eel_colored_print $EASY_EEL_COLOR_GIT_STATE "[$state]"
end

function _easy_eel_print_git_state
    set -q EASY_EEL_SYMBOL_GIT_DIRTY; or set -l EASY_EEL_SYMBOL_GIT_DIRTY '!'
    set -q EASY_EEL_SYMBOL_GIT_UNTRACKED; or set -l EASY_EEL_SYMBOL_GIT_UNTRACKED '☡'
    set -q EASY_EEL_SYMBOL_GIT_STASH; or set -l EASY_EEL_SYMBOL_GIT_STASH '↩'
    set -q EASY_EEL_SYMBOL_GIT_CLEAN; or set -l EASY_EEL_SYMBOL_GIT_CLEAN '✓'

    set -l result

    if _easy_eel_git_is_touched
        set result $EASY_EEL_SYMBOL_GIT_DIRTY
    else
        set result $EASY_EEL_SYMBOL_GIT_CLEAN
    end

    if _easy_eel_git_has_untracked
        set result "$result$EASY_EEL_SYMBOL_GIT_UNTRACKED"
    end

    if _easy_eel_git_is_stashed
        set result "$result$EASY_EEL_SYMBOL_GIT_STASH"
    end

    set -l git_ahead_behind_diverged (_easy_eel_git_ahead_behind)
    set result "$result$git_ahead_behind_diverged"

    echo $result
end

# Git helpers

function _easy_eel_git_is_repo
    git rev-parse --is-inside-work-tree &>/dev/null
end

function _easy_eel_git_branch_name
    git symbolic-ref --short HEAD 2>/dev/null
    or git rev-parse --short HEAD 2>/dev/null
end

function _easy_eel_git_is_touched
    not git diff --quiet &>/dev/null
    or not git diff --cached --quiet &>/dev/null
end

function _easy_eel_git_has_untracked
    test -n "$(git ls-files --others --exclude-standard 2>/dev/null)"
end

function _easy_eel_git_is_stashed
    git stash list 2>/dev/null | string length -q
end

function _easy_eel_git_ahead_behind
    set -l s (git status -sb 2>/dev/null)
    string match -rq 'ahead (\d+)' $s; and echo -n "↑$match[1]"
    string match -rq 'behind (\d+)' $s; and echo -n "↓$match[1]"
end
