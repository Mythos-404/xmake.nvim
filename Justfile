set shell := ["bash", "-cu"]

default: format

alias f := format
alias l := lint

@format:
    stylua -f "{{ invocation_directory() }}/stylua.toml" .
    echo Format Done!

@lint:
    selene lua
    echo Lint Done!
