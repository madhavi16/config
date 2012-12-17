
set(DASH_PACKAGE_VERSION 1.1.0)
set(DASH_DEPENDS bluebrain REQUIRED Lunchbox Boost)
set(DASH_BOOST_COMPONENTS serialization)
set(DASH_REPO_URL https://github.com/BlueBrain/dash.git)
set(DASH_REPO_TAG master)
set(DASH_SOURCE "${CMAKE_SOURCE_DIR}/src/dash")
