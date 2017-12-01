# rails/rails-dev-boxから持ってきた
# https://github.com/rails/rails-dev-box/
#
# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo updating package information
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential

install Git git
install SQLite sqlite3 libsqlite3-dev

install PostgreSQL postgresql postgresql-contrib libpq-dev
sudo -u postgres createuser --superuser vagrant

install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev
install 'ExecJS runtime' nodejs

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo install heroku toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

echo installing rbenv
cd /home/vagrant
sudo -u vagrant git clone https://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv >/dev/null 2>&1
sudo -u vagrant echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.bash_profile
sudo -u vagrant echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bash_profile

install ruby-build autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
sudo -u vagrant git clone https://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build >/dev/null 2>&1

echo installing ruby 2.4.2
sudo -u vagrant -H -i rbenv install 2.4.2 >/dev/null 2>&1
sudo -u vagrant -H -i rbenv global 2.4.2 >/dev/null 2>&1

echo installing Bundler
sudo -u vagrant -H -i gem install bundler -N >/dev/null 2>&1

echo installing Rails 4.0.5
sudo -u vagrant -H -i gem install rails -N -v '5.1.2' >/dev/null 2>&1

echo cleanup
apt-get -y autoremove
apt-get clean

echo 'all set, rock on!'
