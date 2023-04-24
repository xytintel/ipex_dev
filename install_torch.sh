read -p "install (y/n)? " CONT
if [ "$CONT" = "y" ]; then
pip uninstall -y torch

BASE_DIR=$1
git config --global --add safe.directory ${BASE_DIR}
cd ${BASE_DIR}
git checkout origin/pytorch-1.13.1

pip install -r requirements.txt
git submodule update --init --recursive
python setup.py install

fi
