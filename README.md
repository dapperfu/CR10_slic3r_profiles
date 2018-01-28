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
    
### Unbundle Settings.

    