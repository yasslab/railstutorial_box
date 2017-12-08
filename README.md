Rails Tutorialを動かす環境です。
以下のboxの作り方を参考にしています。
https://github.com/rails/rails-dev-box

ライセンスはMITです。

## このパッケージを使う

```rb
Vagrant.configure(2) do |config|
  config.vm.box = "YassLab/railstutorial"
  config.vm.box_version = "0.0.4"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.synced_folder "./data", "/vagrant_data"
  config.ssh.insert_key = false
end
```

## Vagrantのパッケージをつくる

ホストOS

```console
$ vagrant up
```

ゲストOS

```
$ wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -O ~/.ssh/authorized_keys
```

ホストOS

```
$ vagrant package --base 'railstutorial_box' -o railstutorial.box
```

## ライセンス

The MIT License (MIT)

Copyright &copy; 2015 [YassLab](http://yasslab.jp)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
