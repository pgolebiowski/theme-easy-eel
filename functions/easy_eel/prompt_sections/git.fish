source (dirname (realpath (status --current-filename)))/../colors.fish
source (dirname (realpath (status --current-filename)))/git-helpers.fish

function _easy_eel_display_prompt_section_git_state
    not _git_is_repo; and return

    echo -n "on "

    set -q EASY_EEL_GIT_BRANCH_COLOR; or set -l EASY_EEL_GIT_BRANCH_COLOR purple
    _easy_eel_colored_print $EASY_EEL_GIT_BRANCH_COLOR (_git_branch_name)
    echo -n ' '

    set -l state (_easy_eel_print_git_state)
    set -q EASY_EEL_GIT_STATE_COLOR; or set -l EASY_EEL_GIT_STATE_COLOR blue
    _easy_eel_colored_print $EASY_EEL_GIT_STATE_COLOR "[$state]"
end

function _easy_eel_print_git_state
    set -q EASY_EEL_GIT_DIRTYSTATE; or set -l EASY_EEL_GIT_DIRTYSTATE '!'
    set -q EASY_EEL_GIT_UNTRACKED; or set -l EASY_EEL_GIT_UNTRACKED '☡'
    set -q EASY_EEL_GIT_STASH; or set -l EASY_EEL_GIT_STASH '↩'
    set -q EASY_EEL_GIT_CLEAN; or set -l EASY_EEL_GIT_CLEAN '✓'

    set -l result

    if _git_is_touched
        set result $EASY_EEL_GIT_DIRTYSTATE
    else
        set result $EASY_EEL_GIT_CLEAN
    end

    if _git_has_untracked
        set result "$result$EASY_EEL_GIT_UNTRACKED"
    end

    if _git_is_stashed
        set result "$result$EASY_EEL_GIT_STASH"
    end

    set -l git_ahead_behind_diverged (_git_ahead_behind)
    set result "$result$git_ahead_behind_diverged"

    echo $result
end
