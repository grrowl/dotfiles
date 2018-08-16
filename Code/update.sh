grep -v 'oauth' /Users/tom/Library/Application\ Support/Code/User/settings.json > ./User/settings.json
code --list-extensions > ./list-extensions.txt

# install extensions using:
# cat list-extensions.txt | while read line; do code --install-extension "$line"; done
