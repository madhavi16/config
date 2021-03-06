
set(DASH_PACKAGE_VERSION 1.1.0)
set(DASH_DEPENDS bluebrain REQUIRED Lunchbox Boost)
set(DASH_BOOST_COMPONENTS serialization)
set(DASH_DEB_DEPENDS libboost-serialization-dev)
set(DASH_REPO_URL https://github.com/BlueBrain/dash.git)
set(DASH_REPO_TAG master)
set(DASH_SOURCE "${CMAKE_SOURCE_DIR}/src/dash")
set(DASH_FORCE_BUILD ${CI_BUILD})
