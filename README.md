# Rupert's Dot Files

These dotfiles originally came from Ryan Bates. I updated it to suit my preferences and workflow.


## Installation

	git clone git://github.com/rdeguzman/dotfiles ~/.dotfiles
  	cd ~/.dotfiles
  	rake install
  	
If you want to exclude any file or directory during install, please append it in the Rakefile.

	exclude_stuff=%w[Rakefile README.md LICENSE]  
		

## ZSH

See the other aliases in ~/.zsh/aliases

If there are some shell configuration settings which you want secure or 
specific to one system, place it into a ~/.localrc file. This will be 
loaded automatically if it exists.

## GIT

If you're using git, you'll notice the current branch name shows up in
the prompt while in a git repository.

## iTerm2

iTerm2 preferenes saved as plist could be reloaded on a new machine. Ensure to check "Load preferences from a custom folder or URL"

	/Users/rupert/.dotfiles/iTerm2/temp

## RubyMine

Rubymine settings.jar could be imported and exported. 

See https://www.jetbrains.com/ruby/help/exporting-and-importing-settings.html

## Postgres

Postgres startup for OSX which could be copied to /Library/StartupItems/PostgresX



