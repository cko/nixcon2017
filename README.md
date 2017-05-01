<a href="https://travis-ci.org/cko/nixcon2017"><img src="https://travis-ci.org/cko/nixcon2017.svg?branch=master"></a>

# Website for NixCon 2017

## Build
The site is build with [Hakyll](https://jaspervdj.be/hakyll/)

    ghc --make site.hs
    site build
    site server

### Build with nix

    nix-build

## Travis Deployment

Go to GitHub.com -> Settings -> Applications -> Personal Access Tokens — > Create new token, and copy it to your clipboard
` travis encrypt -r cko/nixcon2017 GH_TOKEN=[your token]`
