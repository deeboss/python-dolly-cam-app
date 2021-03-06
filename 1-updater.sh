VERSION=$(curl --silent https://api.github.com/repos/deeboss/python-dolly-cam-app/tags \
| grep -m 1 tarball_url \
| cut -d '"' -f 4 \
| awk -F'/' '{print $8}')
TARGET=/home/pi/Downloads
APP_NAME=python-dolly-cam-app

# Ensure we're downloading to the Downloads folder
cd /home/pi/Documents/

wget https://github.com/deeboss/python-dolly-cam-app/archive/${VERSION}.tar.gz

tar -xzf ${VERSION}.tar.gz -C /home/pi/Documents
# Delete the tar zip file to declutter Downloads folder
rm -rf ${VERSION}.tar.gz

# Renames the app, stripping away the version name and overwriting the existing app.
# Thereby ensuring only the most updated app remains in the TARGET folder
rm -rf /home/pi/Downloads/python-dolly-cam-app

mv -u /home/pi/Documents/python-dolly-cam-app-${VERSION} /home/pi/Downloads/python-dolly-cam-app
cd /home/pi/Downloads/python-dolly-cam-app

# Creates and activates virtual environment
python3 -m venv venv
source venv/bin/activate
# Installs necessary packages so the application is good to go
pip3 install -r requirements.txt

deactivate

# Generate / Update shortcuts
. 7-generate_shortcuts.sh

zenity --info --title 'Update complete!' --text "Update complete! Application version: ${VERSION}"  --width=500 --height=200 --timeout=3