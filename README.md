# IMESwitcher
IMESwitcher is a small utility on macOS that allows users to switch input methods using command-line instructions. It can be used in conjunction with Mac Built-in Automator and Keyboard shortcuts to achieve the functionality of quickly switching to a specified input method using a keyboard shortcut.
> The operating system macOS 10.15.7 has been tested and passed.

# Installation
### Download the source code
```
git clone https://github.com/wox080xow/IMESwitcher.git
```
### Chenge diretory
```
cd IMESWitcher
```
### Compile
```
make
```
# Usage
```
IMESwitcher <InputSource> <KeyboardLayout>
```

## Preparatory Work
### Setup environment variables 

Here is the example through appending `~/.zshrc` and sourcing the file.
```
cat << EOF >> ~/.zshrc
# IMESWitcher
IS_HOME="/path/to/IMESWitcher"
export PATH="\$IS_HOME:\$PATH"
EOF
```
```
source ~/.zshrc
```
## Example
### Switch to Zhuyin IME(注音輸入法)
```
IMESwitcher com.apple.inputmethod.TCIM.Zhuyin com.apple.keylayout.ZhuyinBopomofo
```

### Switch to FHL Taigi-Hakka IME(信望愛台語客語輸入法)
[FHL Taigi-Hakka IME](https://taigi.fhl.net/TaigiIME/)
```
IMESwitcher net.fhl.inputmethod.TaigiHakkaIME com.apple.keylayout.ABC
```

### Switch to ABC
```
IMESwitcher com.apple.keylayout.ABC com.apple.keylayout.ABC
```
# Reference & Acknoledgement
- [InputSourceSelector](https://github.com/minoki/InputSourceSelector)
- Thanks for the help of ChatGPT.