# svg2favicons.sh

> Convert SVG to PNG favicons of various sizes

## Requirements

- ImageMagick (`convert`)

## Installlation

Add [svg2favicons.sh](./svg2favicons.sh) to `$PATH`.

## Usage

```
$ svg2favicons.sh -h
Convert SVG to PNG favicons of various sizes

Usage:
  svg2favicons.sh <svg> [<dir>]
  svg2favicons.sh -h

Arguments:
  <svg>  Input SVG file
  <dir>  Output directory in which favicons are generated [default: $PWD]

Options:
  -h  Show this screen
```

### Favicons to be generated

Currently supports default configuration of [@vue/cli-plugin-pwa](https://github.com/vuejs/vue-cli/tree/dev/packages/%40vue/cli-plugin-pwa):

|    size (px) | filename                       | note             |
| -----------: | ------------------------------ | ---------------- |
| 16x16, 32x32 | favicon.ico                    |                  |
|        16x16 | favicon-16x16.png              |                  |
|        32x32 | favicon-32x32.png              |                  |
|      144x144 | msapplication-icon-144x144.png |                  |
|      152x152 | apple-touch-icon-152x152.png   | white background |
|      192x192 | android-chrome-192x192.png     |                  |
|      512x512 | android-chrome-512x512.png     |                  |

## License

MIT
