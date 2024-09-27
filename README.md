# DeClutter

DeClutter is a ruby script that organizes the files in your folder. It is meant to organize a large group of files like for example your Download Folder.

## How to use?

Requires ruby to installed and present

```sh
git clone git@github.com:coderhs/de_clutter.git
cd de_clutter
bundle install
ruby de_clutter organize_folder ~/Downloads
```

You can get more information about the options available by running:

```sh
ruby de_clutter organize_folder --help
```

# How it works

It work using an internal db (2 JSON files) mapping each mime type to a category. If a mimetype is not available it uses
a second file to categorize based on extension.

# Future Improvement ideas - PR(s) Appreciated!

1. Load the categorization data from an external API or library to be automatically updated.
2. A preview before moving / Interface to show the different classification(s), and allow the user to modify it. Web UI/GUI app.

## Author

Harisankar P S

## License

MIT License

