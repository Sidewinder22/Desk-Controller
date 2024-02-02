find_package(Qt6 6.5 REQUIRED COMPONENTS Core)

set(LIB backend)

set(HEADERS
    include/Application.hpp
    include/TcpClient.hpp
)

set(SOURCES
    src/Application.cpp
    src/TcpClient.cpp
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
    Qt::Quick
)
