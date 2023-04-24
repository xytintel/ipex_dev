read -p "install (y/n)? " CONT
if [ "$CONT" = "y" ]; then

rm -rf frameworks.ai.pytorch.private-gpu

pip uninstall -y torch
git clone https://github.com/intel-innersource/frameworks.ai.pytorch.private-gpu.git
cd frameworks.ai.pytorch.private-gpu

git checkout origin/pytorch-1.13.1

pip install -r requirements.txt
git submodule update --init --recursive
python setup.py install

fi
