
set(SAGE_IMAGEMAGICK_COMPONENTS "MagickWand MagickCore")

set(SAGE_PACKAGE_VERSION 3.0)
set(SAGE_REPO_URL https://github.com/BlueBrain/SAGE.git)
set(SAGE_REPO_TAG bbp)
set(SAGE_SOURCE "${CMAKE_SOURCE_DIR}/src/SAGE")
set(SAGE_NOTEST ON)
set(SAGE_OPTIONAL ON)
set(SAGE_DEPENDS REQUIRED SDL SDL_ttf ImageMagick GLUT vncserver jack lo)

find_package(SDL_ttf)
if(SDLTTF_FOUND)
  set(SDL_TTF_FOUND 1)
endif()

set(_sage_configure_cmd ${CMAKE_BINARY_DIR}/SAGE/_sage_configure_cmd.cmake)
file(WRITE ${_sage_configure_cmd}
  "if(NOT EXISTS ${CMAKE_BINARY_DIR}/SAGE/config.status)\n
    execute_process(COMMAND ./configure WORKING_DIRECTORY ${SAGE_SOURCE})\n
    execute_process(COMMAND ${CMAKE_COMMAND} -E touch config.status WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/SAGE)\n
   endif()\n"
)

set(SAGE_EXTRA
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -P ${_sage_configure_cmd}
  BUILD_COMMAND cd ${SAGE_SOURCE} && make -f Makefile
  INSTALL_COMMAND cd ${SAGE_SOURCE} && make -f Makefile PREFIX="${CMAKE_CURRENT_BINARY_DIR}/install/sage" install
)
