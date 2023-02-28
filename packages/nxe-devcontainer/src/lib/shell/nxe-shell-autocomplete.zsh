#!/bin/zsh

# kubectl is handled by antigen
# cat <(kubectl completion zsh) > $ZSH/cache/completions/_kubectl # magic
# cat <(docker completion zsh) > $ZSH/cache/completions/_docker # magic

# not handled by antigen

# if dapr command exists
if command -v dapr &> /dev/null
then
    cat <(dapr completion zsh) > $ZSH/cache/completions/_dapr # magic
fi
# if helm command exists
if command -v helm &> /dev/null
then
    cat <(helm completion zsh) > $ZSH/cache/completions/_helm # magic
fi
# if caddy command exists
if command -v caddy &> /dev/null
then
    cat <(caddy completion zsh) > $ZSH/cache/completions/_caddy # magic
fi
