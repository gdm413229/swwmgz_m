# Notes on localizing SWWM GZ

There are two parts to this:

## Basic language files *(base/menu/mission/voice)*

Just make a copy and change the language code at the top *(the string between brackets)* to whatever language you're translating it to *(don't forget to also set it in the file extension too, for the sake of easier organization)*.

In regards to what should and should not be localized, this will be noted in comments in the file itself.

**Note:** For the sake of cleanness, if you've left any language strings untouched, remove them in your file.

## Specialized lore files *(located in lore folder)*

**DO NOT manipulate the generated language file for these directly**, use the individual source files in their subfolders, creating one folder first for the language you'll cover.

Each entry must have only one of each TAG, TAB and REL section, and at least one TXT section. When localizing, DO NOT copy the TAB and REL sections, as these are for internal use and mustn't be translated, instead handle only the TAG and TXT sections.

## Language codes

For a list of these, consult the ZDoom wiki article for [LANGUAGE](https://zdoom.org/wiki/LANGUAGE#Language_codes).