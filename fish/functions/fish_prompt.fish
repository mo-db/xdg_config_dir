function fish_prompt
	# Enable informative git prompt
	set -g __fish_git_prompt_show_informative_status 1
	# Customize git prompt appearance
	set -g __fish_git_prompt_showcolorhints 1
	set -g __fish_git_prompt_showdirtystate 1
	set -g __fish_git_prompt_showstashstate 1
	set -g __fish_git_prompt_shorten_branch_len 8
	set -g __fish_git_prompt_showupstream informativ
	set -g __fish_git_prompt_color_branch yellow
	set -g __fish_git_prompt_color_upstream_ahead green
	set -g __fish_git_prompt_color_upstream_behind red

	printf '%s' (set_color blue) (prompt_pwd) (fish_git_prompt) ' $ '
end
