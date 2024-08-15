-- Définir les règles de compilation pour les modes debug, release et profile
add_rules("mode.debug", "mode.release")
set_project("GameOfLife")
target("GameOfLife")
    set_kind("binary")
    set_languages("cxx20")

    -- Détection du mode de compilation et téléchargement de la bibliothèque en conséquence
    before_build(function (target)
        if is_mode("debug") then
            -- Téléchargement de la bibliothèque pour le mode debug
            os.exec("curl -L --fail --retry 3 --progress-bar -o atom_engine_macOS_arm64_debug.tar.gz https://github.com/AtomOrganization/AtomEngine/releases/download/0.0.0-nightly/atom_engine_macOS_arm64_debug.tar.gz")
            os.exec("tar -xzf atom_engine_macOS_arm64_debug.tar.gz -C GameOfLife")
        elseif is_mode("release") then
            -- Téléchargement de la bibliothèque pour le mode release
            os.exec("curl -L --fail --retry 3 --progress-bar -o atom_engine_macOS_arm64_release.tar.gz https://github.com/AtomOrganization/AtomEngine/releases/download/0.0.0-nightly/atom_engine_macOS_arm64_release.tar.gz")
            os.exec("tar -xzf atom_engine_macOS_arm64_release.tar.gz -C GameOfLife")
        end
    end)

    -- Inclusion des fichiers sources
    add_files("src/*.cpp")
    
    -- Inclusion des headers de la bibliothèque
    add_includedirs("include")
    
    -- Lien avec la bibliothèque téléchargée
    add_links("AtomEngine")
    add_linkdirs("lib")