# Fyodor

Convert your Amazon Kindle highlights, notes and bookmarks into markdown (or any format).

## What is Fyodor

This application parses `My Clippings.txt` from your Kindle and generates a markdown file for each book/document, in the format `#{Author} - #{Title}.md`. This way, your annotations are conveniently stored and easily managed.

[For samples of the output, click here.](docs/output_demo)

To read more about the motivation and what problem it tries to solve, [check this blog post](https://rafaelc.org/posts/export-all-your-kindle-highlights-and-notes/).

## Features

- Supports all the type of entries in your clippings file: highlights, notes, clips and bookmarks.
- Automatic removal of empty or duplicate entries (the clippings file can get a lot of those).
- Orders your entries by location/page on each book (the clippings file is ordered by time).
- Easily configurable for your language, allowing you to get all features and beautiful output.
- This software goes some length to be locale agnostic: basic parsing should work without configuration for any language. It should also work even if your clippings file has multiple locales.
- By default, output in a format that is clean and easy to edit/fiddle around: markdown.
- Bookmarks are placed together and notes are formatted differently, for better visualization.
- Entirely customizable output, in the format you prefer, through templates.

This program is based on the clippings file generated by Kindle 2019, but should work with other models.

## Limitations

We are limited by the data Kindle makes available through `My Clippings.txt`. This means:

- We don't have chapter information.
- We can’t guess all entries that were deleted.

## Installation

Install Ruby and run:

```shell-session
$ gem install fyodor
```

## Updating

Run:

```shell-session
$ gem update fyodor
```

## Configuration

Fyodor reads an optional configuration file at `~/.config/fyodor/fyodor.toml` or `$XDG_CONFIG_HOME/fyodor/fyodor.toml`. This section describes the available parameters (none is required).

To download the [sample configuration](docs/fyodor.toml.sample):

```shell-session
$ curl https://raw.githubusercontent.com/rc2dev/fyodor/master/docs/fyodor.toml.sample --create-dirs -o ~/.config/fyodor/fyodor.toml
```

### Languages

If your Kindle device is not set to English (US), you should tell Fyodor how some things are named on your `My Clippings.txt` (highlights, pages, etc). I went through some length to make Fyodor work regardless of this step. However, if you don't set this correctly, you won't take advantage of many features, resulting in a dirtier output.

Open both `fyodor.toml` and your `My Clippings.txt` in your preferred editor. Change the values in the `[parser]` section to mirror what you get in `My Clippings.txt`.

For example, this is the configuration for Brazilian Portuguese:

```toml
[parser]
highlight = "Seu destaque"
note = "Sua nota"
bookmark = "Seu marcador"
clip = "Recortar este artigo"
loc = "posição"
page = "página"
time = "Adicionado:"
```

### Extension

If you want to change the extension of the output files (typically after changing the template), set `extension` under `[output]`. For example, to change it to HTML:

```toml
[output]
extension = "html"
```

## Templating

You may change the structure of the files output by Fyodor by providing your own template in any format you wish.

To do that, place a ERB template at `~/.config/fyodor/template.erb` or `$XDG_CONFIG_HOME/fyodor/template.erb` and Fyodor will use it automatically.

The default template can be found [here](share/template.erb). You can use any method or attribute available [on this class](lib/fyodor/output_generator.rb).


## Usage

```shell-session
$ fyodor CLIPPINGS_FILE [OUTPUT_DIR]
```

Where:

- `CLIPPINGS_FILE` is the path for `My Clippings.txt`.
- `OUTPUT_DIR` is the directory to write the output files. If none is supplied, this will be `fyodor_output` under the current directory.

## PSA: HTML to markdown

Did you export your annotations to HTML using the Kindle mobile app?

You can convert it to markdown with [a script I wrote specifically for it](https://rafaelc.org/k/kindle2md).

## Buy me a coffee

If you like Fyodor, you can show your support here:

<a href="https://rafaelc.org/coffee" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" width="200" ></a>

## License

Licensed under [GPLv3](LICENSE)

Copyright (C) 2019-2022 [Rafael Cavalcanti](https://rafaelc.org/dev)
