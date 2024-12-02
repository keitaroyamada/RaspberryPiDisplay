# RaspberryPiDisplay

Raspberry Piに接続したUSBに保存されたmp4を自動てきにプレイリストに追加し、連続再生を行う。

crontabを利用することで、起動するだけで、接続したUSBメモリを自動読込して、再生できる。


bash
crontab -e


crontabに以下のコマンドを追加
@reboot /home/pi/autoplay.sh

時間指定も可能
分 時 日 月 曜日 コマンド
- 毎日午前2時にスクリプトを実行: 0 2 * * * /path/to/script.sh

- 毎週月曜日の午前8時にスクリプトを実行: 0 8 * * 1 /path/to/script.sh

