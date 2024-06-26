cmake_minimum_required(VERSION 3.15)

project(cimgui)

if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/cimgui/imgui/imgui_tables.cpp)
	set(TABLES_SOURCE "cimgui/imgui/imgui_tables.cpp")
else()
	set(TABLES_SOURCE "")
endif()

if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/cimgui/imgui/backends)
	set(BAKENDS_FOLDER "cimgui/imgui/backends/")
else()
	set(BAKENDS_FOLDER "cimgui/imgui/examples/")
endif()

#general settings
file(GLOB IMGUI_SOURCES
    cimgui/cimgui.cpp
    cimgui/imgui/imgui.cpp
    cimgui/imgui/imgui_draw.cpp
    cimgui/imgui/imgui_demo.cpp
    cimgui/imgui/imgui_widgets.cpp
    ${TABLES_SOURCE}
    #win32 backend
    cimgui/imgui/backends/imgui_impl_win32.cpp
    #dx11 backend
    cimgui/imgui/backends/imgui_impl_dx11.cpp
)

#DX11 backend
list(APPEND IMGUI_SOURCES ${BAKENDS_FOLDER}/imgui_impl_dx11.cpp)

#WIN32 backend
list(APPEND IMGUI_SOURCES ${BAKENDS_FOLDER}/imgui_impl_win32.cpp)

#ImGuizmo
list(APPEND IMGUI_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/cimguizmo/cimguizmo.cpp)
list(APPEND IMGUI_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/cimguizmo/imguizmo/imGuizmo.cpp)

set(IMGUI_STATIC "no" CACHE STRING "Build as a static library")
set(IMGUI_FREETYPE "no" CACHE STRING "Build with freetype library")
set(IMGUI_LIBRARIES )

if(IMGUI_FREETYPE)
	FIND_PACKAGE(freetype REQUIRED PATHS ${FREETYPE_PATH})
	list(APPEND IMGUI_LIBRARIES freetype)
	list(APPEND IMGUI_SOURCES imgui/misc/freetype/imgui_freetype.cpp)
	add_definitions("-DCIMGUI_FREETYPE=1")
endif(IMGUI_FREETYPE)

#add library and link
if (IMGUI_STATIC)
    add_library(cimgui STATIC ${IMGUI_SOURCES})

    set_property(TARGET cimgui PROPERTY
        MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
else (IMGUI_STATIC)
    add_library(cimgui SHARED ${IMGUI_SOURCES})
endif (IMGUI_STATIC)

target_compile_definitions(cimgui PUBLIC IMGUI_DISABLE_OBSOLETE_FUNCTIONS=1)
if (WIN32)
    target_compile_definitions(cimgui PUBLIC IMGUI_IMPL_API=extern\t\"C\"\t__declspec\(dllexport\))
    list(APPEND IMGUI_LIBRARIES imm32)
else (WIN32)
    target_compile_definitions(cimgui PUBLIC IMGUI_IMPL_API=extern\t\"C\"\t)
endif (WIN32)

target_include_directories(cimgui PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/cimgui)
target_include_directories(cimgui PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/cimgui/imgui)
target_include_directories(cimgui PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/cimguizmo/)
target_include_directories(cimgui PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/cimguizmo/imguizmo)
set_target_properties(cimgui PROPERTIES PREFIX "")
target_link_libraries(cimgui ${IMGUI_LIBRARIES})

#install
install(TARGETS cimgui
    RUNTIME DESTINATION  .
    LIBRARY DESTINATION  .
    ARCHIVE DESTINATION  .
)

#test
set(CIMGUI_TEST "no" CACHE STRING "Enable compilation of a test unit based on imgui null")

if (CIMGUI_TEST)
  add_subdirectory(test)
endif ()
