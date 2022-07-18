Cardano Script Address Generator

Generate the script address of the given script

Simply run

```bash
cabal run print-address
```

It will print the script address of the given script located in the plutus directory

The main purpose of this repo is to demonstrate with upgrade of depdencies from the plutus repo of around january tag ed1614303025ee8dcd9586bb9c821500b02fd13e to 1.35.0 tag f680ac6979e069fcc013e4389ee607ff5fa6672f the contract address is changed.

At first checkout tag 
```bash
git checkout old-plutus
```
Then run 
```bash
cabal run print-address
```
Now checkout tag
```bash
git checkout new-plutus
```
Then run
```bash
cabal run print-address
```