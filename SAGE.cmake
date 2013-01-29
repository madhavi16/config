
set(SAGE_PACKAGE_VERSION 3.0)
set(SAGE_REPO_URL https://github.com/BlueBrain/SAGE.git)
set(SAGE_REPO_TAG bbp)
set(SAGE_SOURCE "${CMAKE_SOURCE_DIR}/src/SAGE")
set(SAGE_NOTEST ON)
set(SAGE_OPTIONAL ON)

if(EXISTS ${SAGE_SOURCE}/configured)
  set(_sage_configure_cmd true)
else()
  set(_sage_configure_cmd cd ${SAGE_SOURCE} && ./configure)
endif()

set(SAGE_EXTRA
  CONFIGURE_COMMAND ${_sage_configure_cmd}
  BUILD_COMMAND cd ${SAGE_SOURCE} && make -f Makefile
  INSTALL_COMMAND cd ${SAGE_SOURCE} && make -f Makefile PREFIX="${CMAKE_CURRENT_BINARY_DIR}/install" install
)
