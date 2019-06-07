FIND_PACKAGE(PythonInterp REQUIRED QUIET)

MESSAGE(STATUS "---------------------------")
MESSAGE(STATUS "Packaging Python Wheel ...")
MESSAGE(STATUS "---------------------------")

# Package files
MESSAGE(STATUS "Creating Python wheel: ${BTK_BINARY_DIR}/bin/")
FILE(MAKE_DIRECTORY "${BTK_BINARY_DIR}/btk/bin/")
FILE(COPY "${BTK_BINARY_DIR}/bin/btk.py" DESTINATION "${BTK_BINARY_DIR}/bin/btk")
FILE(RENAME "${BTK_BINARY_DIR}/bin/btk/btk.py" "${BTK_BINARY_DIR}/bin/btk/__init__.py")

EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} setup.py bdist_wheel
                  WORKING_DIRECTORY "${BTK_BINARY_DIR}/bin/")
