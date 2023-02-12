#!/bin/zsh

# kubectl is handled by antigen
# cat <(kubectl completion zsh) > $ZSH/cache/completions/_kubectl # magic
# cat <(docker completion zsh) > $ZSH/cache/completions/_docker # magic

# not handled by antigen
cat <(dapr completion zsh) > $ZSH/cache/completions/_dapr # magic
cat <(helm completion zsh) > $ZSH/cache/completions/_helm # magic
