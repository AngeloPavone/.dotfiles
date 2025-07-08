function rm-zone-files
    fd ':Zone.Identifier' . --type f --exec rm -f {} + $argv
end
