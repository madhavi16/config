set(BLURON_PACKAGE_VERSION 7.3)
set(BLURON_REPO_URL https://github.com/BlueBrain/Bluron.git)
set(BLURON_REPO_TAG master)
set(BLURON_SOURCE "${CMAKE_SOURCE_DIR}/src/nrn")
set(BLURON_OPTIONAL ON)

if(NOT LINUX_PPC)
  find_package(MPI)
  if(NOT MPI_FOUND)
    return()
  endif()

  # fallback if not set by finder
  if(NOT MPI_C_COMPILER)
    set(MPI_C_COMPILER mpicc)
  endif()
  if(NOT MPI_CXX_COMPILER)
    set(MPI_CXX_COMPILER mpicxx)
  endif()

  set(BLURON_EXTRA
    PATCH_COMMAND cd ${BLURON_SOURCE} && ./build.sh
    CONFIGURE_COMMAND ${BLURON_SOURCE}/configure --with-paranrn --without-iv --without-memacs --disable-shared --enable-static MPICC=${MPI_C_COMPILER} MPICXX=${MPI_CXX_COMPILER} CC=${MPI_C_COMPILER} CXX=${MPI_CXX_COMPILER} "CXXFLAGS=-g -O2" "CFLAGS=-g -O2" "LDFLAGS=-g -O2" with_readline=no java_dlopen=no linux_nrnmech=no "--prefix=${CMAKE_CURRENT_BINARY_DIR}/install"
)
endif()
