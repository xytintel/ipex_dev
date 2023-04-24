source /home/gta/intel/oneapi/compiler/latest/env/vars.sh
source /home/gta/intel/oneapi/mkl/latest/env/vars.sh

export MKL_DPCPP_ROOT=/home/gta/intel/oneapi/mkl/latest
export LD_LIBRARY_PATH=${MKL_DPCPP_ROOT}/lib:${MKL_DPCPP_ROOT}/lib64:${MKL_DPCPP_ROOT}/lib/intel64:${LD_LIBRARY_PATH}
export LIBRARY_PATH=${MKL_DPCPP_ROOT}/lib:${MKL_DPCPP_ROOT}/lib64:${MKL_DPCPP_ROOT}/lib/intel64:$LIBRARY_PATH

########## Note:!!!!!! ##########
export USE_AOT_DEVLIST='pvc'
#################################

source /home/gta/intel/oneapi/tbb/latest/env/vars.sh

# export IGC_EnableLSCFenceUGMBeforeEOT=0
export USE_CUDA=OFF
export USE_MPI=OFF
