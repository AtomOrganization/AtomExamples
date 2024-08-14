-- Define the project
set_project("Atom")
set_languages("c++20")
set_version("2.0.0")

-- Define the target
target("sandbox")
    set_kind("binary")
    add_files("sandbox1/*.cpp")
    add_includedirs("../AtomEngine/src/Atom")
    add_linkdirs("../AtomEngine/src/dll")  -- Add the directory containing the library
    add_links("Atom")  -- Add the library name (without the 'lib' prefix and file extension)