#!/bin/sh  
#chmod +x install.sh

# for file in ppa:mystic-mirage/komodo-edit ppa:webupd8team/java ppa:webupd8team/sublime-text-3 ppa:mpstark/elementary-tweaks-daily
# do
#   echo "adding Repo" $file
#   sudo add-apt-repository -y $file
# done
# echo "All Repo Added"

wget -q -O - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo deb https://download.sublimetext.com/ apt/stable/ | sudo tee /etc/apt/sources.list.d/sublime-text.list

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
echo deb http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google.list

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update

for file in apt-transport-https ubuntu-restricted-extras gparted transmission firefox google-chrome-stable vim vlc nautilus nodejs sublime-text libreoffice rar unrar p7zip-rar p7zip sharutils uudeview mpack lha arj cabextract lzip lunzip tlp tlp-rdw libavcodec-extra-53 gimp mongodb git spotify-client
do
  echo "installing" $file
  sudo apt-get install -y $file
done

# for file in midori scratch-text-editor
# do
#   echo "uninstalling" $file
#   sudo apt-get purge -y $file
# done

sudo apt-get -y autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean

echo "All Done"
