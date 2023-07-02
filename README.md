# Compile
Download the source code
```
git clone https://github.com/wox080xow/IMESwitcher.git
```
Chenge diretory
```
cd IMESWitcher
```
Compile
```
make
```
# Usage
```
IMESwitcher <InputSource> <KeyboardLayout>
```

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