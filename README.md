Rails Tutorialを動かす環境です。
以下のboxの作り方を参考にしています。
https://github.com/rails/rails-dev-box

ライセンスはMITです。

## このパッケージを使う

```rb
Vagrant.configure(2) do |config|
  config.vm.box = "YassLab/railstutorial4.0-32"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.synced_folder "./data", "/vagrant_data"
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
