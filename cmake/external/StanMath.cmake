set(STAN_STABLE_RELEASE 4b1a10bc877d941bbe0a12c198526807be27167a)

set(STAN_INCLUDE_DIR_STAN_MATH ${CMAKE_BINARY_DIR}/StanMath/src/StanMath)
set(STAN_INCLUDE_DIR_BOOST ${STAN_INCLUDE_DIR_STAN_MATH}/lib/boost_1.64.0)
set(STAN_INCLUDE_DIR_CVODES ${STAN_INCLUDE_DIR_STAN_MATH}/lib/cvodes_2.9.0/include)
set(STAN_INCLUDE_DIR_EIGEN ${STAN_INCLUDE_DIR_STAN_MATH}/lib/eigen_3.3.3)

include(ExternalProject)
ExternalProject_Add(
	StanMath
	PREFIX ${CMAKE_BINARY_DIR}/StanMath
	DOWNLOAD_DIR ${THIRD_PARTY_DIR}/StanMath
	GIT_REPOSITORY https://github.com/stan-dev/math
	GIT_TAG ${STAN_STABLE_RELEASE}
	CONFIGURE_COMMAND ""
	BUILD_COMMAND ""
	INSTALL_COMMAND ${CMAKE_COMMAND} -E copy_directory ${STAN_INCLUDE_DIR_STAN_MATH}/stan ${THIRD_PARTY_INCLUDE_DIR}/stan
		&& ${CMAKE_COMMAND} -E copy_directory ${STAN_INCLUDE_DIR_BOOST} ${THIRD_PARTY_INCLUDE_DIR}/stan_boost
		&& ${CMAKE_COMMAND} -E copy_directory ${STAN_INCLUDE_DIR_CVODES} ${THIRD_PARTY_INCLUDE_DIR}/stan_cvodes
		&& ${CMAKE_COMMAND} -E copy_directory ${STAN_INCLUDE_DIR_EIGEN} ${THIRD_PARTY_INCLUDE_DIR}/eigen
	LOG_DOWNLOAD ON
	)
add_dependencies(libshogun StanMath)