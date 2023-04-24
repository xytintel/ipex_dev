clang-format -i ipex-master/csrc/gpu/aten/operators/*.cpp
clang-format -i ipex-master/csrc/gpu/aten/operators/*.h

cd ipex-master
BUILD_WITH_CPU=OFF python setup.py install
