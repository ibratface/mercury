sudo apt-get install nginx supervisor mysql-server mysql-client mysql-workbench libmysqlclient-dev python-dev build-essentials python-pip python-virtualenv python-zc.buildout
#easy_install -U distribute setuptools
virtualenv --no-site-packages /web/mercury
cd /web/mercury
source bin/activate
python bootstrap.py -d -v 2.1.1
bin/buildout
sudo cp supervisor.conf /etc/supervisor/conf.d/mercury.conf
sudo supervisorctl update
sudo cp nginx.conf /etc/nginx/sites-available/mercury.conf
ln -s /etc/nginx/sites-available/mercury.conf /etc/nginx/sites-enabled/mercury.conf
sudo service nginx restart
