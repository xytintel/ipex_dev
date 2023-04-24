read -p "install (y/n)? " CONT
if [ "$CONT" = "y" ]; then

########## Note:!!!!!! ##########
BASE_DIR=ipex-master
#################################

rm -rf frameworks.ai.pytorch.ipex-gpu
rm -rf ${BASE_DIR}

pip uninstall -y torch_ipex
pip uninstall -y ipex
pip uninstall -y intel_extension_for_pytorch
git clone https://github.com/intel-innersource/frameworks.ai.pytorch.ipex-gpu.git
mv frameworks.ai.pytorch.ipex-gpu ${BASE_DIR}
cd ${BASE_DIR}

########## Note:!!!!!! ##########
git checkout origin/master
#################################

pip install -r requirements.txt
git submodule update --init --recursive

cd third_party/oneDNN
cd ../..

BUILD_WITH_CPU=OFF python setup.py install
du -sh ./build

fi
