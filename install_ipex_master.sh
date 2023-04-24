read -p "install (y/n)? " CONT
if [ "$CONT" = "y" ]; then
pip uninstall -y torch_ipex
pip uninstall -y ipex
pip uninstall -y intel_extension_for_pytorch

BASE_DIR=$1
cd ${BASE_DIR}
git checkout origin/master

pip install -r requirements.txt
git submodule update --init --recursive

cd third_party/oneDNN
cd ../..

BUILD_WITH_CPU=OFF python setup.py install
du -sh ./build

fi
