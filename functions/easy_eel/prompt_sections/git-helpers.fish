function _git_is_repo
    git rev-parse --is-inside-work-tree &>/dev/null
end

function _git_branch_name
    git symbolic-ref --short HEAD 2>/dev/null
    or git rev-parse --short HEAD 2>/dev/null
end

function _git_is_touched
    not git diff --quiet &>/dev/null
    or not git diff --cached --quiet &>/dev/null
end

function _git_has_untracked
    test -n "$(git ls-files --others --exclude-standard 2>/dev/null)"
end

function _git_is_stashed
    git stash list 2>/dev/null | string length -q
end

function _git_ahead_behind
    set -l s (git status -sb 2>/dev/null)
    string match -rq 'ahead (\d+)' $s; and echo -n "↑$match[1]"
    string match -rq 'behind (\d+)' $s; and echo -n "↓$match[1]"
end
