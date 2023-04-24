BASE_DIR=$1

clang-format -i ${BASE_DIR}/csrc/gpu/aten/operators/*.cpp
clang-format -i ${BASE_DIR}/csrc/gpu/aten/operators/*.h

cd ${BASE_DIR}
BUILD_WITH_CPU=OFF python setup.py install
