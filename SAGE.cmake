
set(SAGE_PACKAGE_VERSION 3.0)
set(SAGE_REPO_URL https://github.com/BlueBrain/SAGE.git)
set(SAGE_REPO_TAG bbp)
set(SAGE_SOURCE "${CMAKE_SOURCE_DIR}/src/SAGE")
set(SAGE_NOTEST ON)
set(SAGE_OPTIONAL ON)
if(LSB_DISTRIBUTOR_ID MATCHES "RedHatEnterpriseServer")
  set(SAGE_DEPENDS REQUIRED SDL SDL_ttf ImageMagick GLUT jack lo v4l2 yasm)
else()
  set(SAGE_DEPENDS REQUIRED SDL SDL_ttf ImageMagick GLUT vncserver jack lo v4l2
    yasm)
endif()
set(SAGE_IMAGEMAGICK_COMPONENTS "MagickWand MagickCore")

find_package(SDL_ttf)
if(SDLTTF_FOUND)
  set(SDL_TTF_FOUND 1)
endif()

set(SAGE_EXTRA
  CONFIGURE_COMMAND ${CMAKE_COMMAND} -P SAGE_configure_cmd.cmake
  BUILD_COMMAND make -C ${SAGE_SOURCE} -f Makefile
  INSTALL_COMMAND make -C ${SAGE_SOURCE} -f Makefile PREFIX="${CMAKE_CURRENT_BINARY_DIR}/install/sage" install
)
