set(INSTALL_DEPS_TO
    ""
    CACHE
    PATH
    "Install dependencies to the provided path"
)

if(INSTALL_DEPS_TO)
    message(STATUS "Installing dependencies to '${INSTALL_DEPS_TO}'")
    file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/setup/build)
    execute_process(
        COMMAND ${CMAKE_COMMAND} -DINSTALL_DEPS_TO=${INSTALL_DEPS_TO} ..
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/setup/build
    )
    execute_process(
        COMMAND ${CMAKE_COMMAND} --build .
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/setup/build
    )
    unset(
        INSTALL_DEPS_TO
        CACHE
    )
endif()
