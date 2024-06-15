# skk-jisyo

SKK用の辞書ファイル色々

- [SKK-JISYO.4513echo](./SKK-JISYO.4513echo)

私が変換したい単語を無造作に放り込んでいます。

- [SKK-JISYO.scp](./SKK-JISYO.scp)

[SCP財団][scp_foundation]に関連する単語を収録しています。

- [SKK-JISYO.bluearchive](./SKK-JISYO.bluearchive)

ブルーアーカイブのキャラクター・組織に関連する単語を収録しています。

- [SKK-JISYO.shinobigami](./SKK-JISYO.shinobigami)

[シノビガミ][shinobigami]に関連する単語（流派・特技・忍法など）を収録しています。

## インストール

URLを指定して使う場合は`raw.githubusercontent.com`の短縮版として下のようなURLも使えます。

```
https://skk.4513echo.dev/SKK-JISYO.4513echo
```

リポジトリをcloneして使う場合は`make`コマンドを実行してください。
辞書のインストール先は`SKK_JISYO_DIR`で変更できます。

```sh
make
```

デフォルトの`SKK_JISYO_DIR`は、Linuxでは[XDG Base Directory][xdg]、macOSでは[macSKK][macskk]を前提としています。

また、`make diff`を実行するには[skktools][skktools]と[nkf][nkf]が必要です。

## ライセンス

MIT Licenseで配布しています。

[scp_foundation]: https://scp-jp.wikidot.com
[shinobigami]: https://bouken.jp/pd/sg/
[xdg]: https://wiki.archlinux.jp/index.php/XDG_Base_Directory
[macskk]: https://github.com/mtgto/macSKK
[skktools]: https://github.com/skk-dev/skktools
[nkf]: https://osdn.net/projects/nkf/
