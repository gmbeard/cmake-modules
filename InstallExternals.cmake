set(INSTALL_DEPS_TO
    ""
    CACHE
    PATH
    "Install dependencies to the provided path"
)

macro(InstallDependencies)
    message(STATUS "Installing dependencies to '${INSTALL_DEPS_TO}'")
    file(REMOVE_RECURSE ${CMAKE_CURRENT_SOURCE_DIR}/setup/build)
    file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/setup/build)
    execute_process(
        COMMAND ${CMAKE_COMMAND} 
            -DCMAKE_PREFIX_PATH=${INSTALL_DEPS_TO} 
            -DINSTALL_DEPS_TO=${INSTALL_DEPS_TO} 
            ..
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/setup/build
    )
    execute_process(
        COMMAND ${CMAKE_COMMAND} --build .
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/setup/build
    )
endmacro()

if(INSTALL_DEPS_TO)
    InstallDependencies()
    unset(
        INSTALL_DEPS_TO
        CACHE
    )
endif()
