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
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential

install Ruby ruby2.0 ruby2.0-dev
update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.1 0 --slave /usr/bin/gem gem /usr/bin/gem1.9.1 >/dev/null 2>&1
update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby2.0   1 --slave /usr/bin/gem gem /usr/bin/gem2.0   >/dev/null 2>&1

echo installing Bundler
gem install bundler -N >/dev/null 2>&1

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

echo cleanup
apt-get -y autoremove
apt-get clean

echo 'all set, rock on!'
