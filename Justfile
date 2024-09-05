set shell := ["bash", "-cu"]

default: format

alias f := format

@format:
    stylua -f "{{ invocation_directory() }}/stylua.toml" .
    echo Format Done!
