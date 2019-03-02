function fish_prompt

  if not set -q -g __fish_robbyrussell_functions_defined
    set -g __fish_robbyrussell_functions_defined
    function _git_branch_name
      echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
    end

    function _is_git_dirty
      git diff-files --no-ext-diff --quiet ^/dev/null >/dev/null; and git diff-index --no-ext-diff --quiet --cached HEAD ^/dev/null >/dev/null
    end
  end

  set -l cyan (set_color -o cyan)
  set -l yellow (set_color -o yellow)
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l normal (set_color normal)

  if [ (whoami) = "root" ]
    set_color --bold red
    echo -n -s "sudo "
  end

  set_color --bold blue
  echo -n -s (prompt_pwd)

  if [ (_git_branch_name) ]
    set_color cyan
    echo -n -s " " (_git_branch_name)
  end

  switch $fish_bind_mode
    case insert
      set_color --bold black
    case default
      set_color --bold red
    case replace-one
      set_color --bold red
    case visual
      set_color --bold red
  end
  echo -n -s " ➜ "

end
