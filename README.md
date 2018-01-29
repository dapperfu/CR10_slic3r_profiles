# slic3r_profiles
Slic3r profiles for my CR10.

## Usage

### Cloning

Tested on Ubuntu 16.04.

    git clone https://github.com/jed-frey/slic3r_profiles.git
    
or
   
    git clone git@github.com:jed-frey/slic3r_profiles.git
    
### Setup
    
    cd slic3r_proffliles
    # Bootstrap apt-get based distros with python & slic3r
    make bootstrap 
    # Create the Python virtual environment.
    make venv
    
### Edit profiles.
 
1. Launch slic3r.
    `slic3r --gui-mode=expert`
2. Load Config Bundle.
    - File > Load Config Bundle.
    - Alt + F - L - L - Enter
3. Modify Print, Filament & Printer Settings.
    Configure the profiles to match your machine.
4. Export Config Bundle.
    - File > Export Config Bundle > Slic3r_config_bundle.ini > Replace
    - Alt +F - E - E - Enter - Enter - Enter
    
#### Advanced Editing
 
 1. Open Slic3r_config_bundle.ini  with a text editor.
 2. Edit.
 3. Save.
 
    
## Unbundle Profiles.

``unbundle.py`` breaks apart  Slic3r_config_bundle.ini  into separate configuration files for each of the different Print, Filament & Printer Settings.

    python unbundle.py  Slic3r_config_bundle.ini
    
``make build`` is a make target that:
1. Deletes existing settings.
1. Unbundles ```Slic3r_config_bundle.ini```
1. Adds settings back to git.
1. Creates a commit based on the date.
1. Pushes to origin.

# Pt 2.

The project can now be used as a submodule in another project to automatically generate g-code.

See also:

1. https://github.com/jed-frey/openscad
2. https://github.com/jed-frey/3D_Prints