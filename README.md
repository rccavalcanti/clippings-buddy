# Fyodor

Convert your Amazon Kindle highlights and notes into markdown files.


## What is it about
This application parses `My Clippings.txt` from your Kindle and generates a markdown file for each book/document. This way, the highlights and notes for the books you read are conveniently stored and easily managed.

Unlike other similar applications, this tries to be locale agnostic, so it should work no matter language you are using.

The parsing is based on the clippings generated by Kindle 2019, but should work with other models.


## Installation

The only dependencies are Ruby and the TOML gem:

```
$ gem install toml
```

Clone the repo:

```
$ git clone https://github.com/rccavalcanti/fyodor.git
```


## Configuration

If your Kindle is not in English, you should change `note_str` and `highlight_str` in the config, to reflect how both are called in your clippings file.

To do so, copy the sample config and then edit it:

```
$ cd fyodor
$ cp config.toml{.sample,}
## or
$ cp config.toml.sample ~/.config/fyodor.toml
## and edit it
```

Another configurable feature is `ignored_books`. You can list some books to not be saved.


## Running

```
$ cd fyodor
$ ./fyodor CLIPPINGS_FILE OUTPUT_DIR
```

Or if you linked it to a directory in your PATH:
```
$ fyodor CLIPPINGS_FILE OUTPUT_DIR
```

Where:
* `CLIPPINGS_FILE` is the path for `My Clippings.txt`
* `OUTPUT_DIR` is the path to the directory for the markdown files to be written


## LICENSE

Released under [GNU GPL v3](LICENSE).

Copyright 2019 Rafael Cavalcanti <hi@rafaelc.org>
