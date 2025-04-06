find_package(Qt6 6.5 REQUIRED COMPONENTS Core)

set(LIB backend)

set(HEADERS
    include/Backend.hpp
    include/PCMonitor.hpp
    include/RpiMonitor.hpp
    include/TcpServer.hpp
)

set(SOURCES
    src/Backend.cpp
    src/TcpServer.cpp
    src/RpiMonitor.cpp
    src/PCMonitor.cpp
)

qt_add_library(${LIB} SHARED
    ${HEADERS}
    ${SOURCES}
)

target_include_directories(${LIB} PUBLIC
    include
)

target_compile_definitions(${LIB}
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
)

target_link_libraries(${LIB} PRIVATE
    Qt6::Quick
)
