
set(HDF5_PACKAGE_VERSION 1.8)
set(HDF5_REPO_URL https://github.com/BlueBrain/HDF5.git)
set(HDF5_SOURCE "${CMAKE_SOURCE_DIR}/src/hdf5")
set(HDF5_OPTIONAL ON)

if(CMAKE_VERSION VERSION_GREATER 2.8.5)
  set(HDF5_CMAKE_ARGS -DBUILD_SHARED_LIBS=ON -DHDF5_BUILD_CPP_LIB=ON -DHDF5_BUILD_HL_LIB=ON)
else()
  set(HDF5_EXTRA
    CONFIGURE_COMMAND ${HDF5_SOURCE}/configure --enable-cxx --without-h5dump --disable-h5dump "--prefix=${CMAKE_CURRENT_BINARY_DIR}/install"
  )
endif()
