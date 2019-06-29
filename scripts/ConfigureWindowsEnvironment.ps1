# Copy git configs

Copy-Item '~\projects\dotfiles\git\.gitconfig.aliases' '~\.gitconfig.aliases'
Copy-Item '~\projects\dotfiles\git\gitconfig.template' '~\.gitconfig.template'

# Copy Powershell profile and modules

Copy-Item '~\projects\dotfiles\WindowsPowerShell\*' '~\Documents\WindowsPowerShell\'