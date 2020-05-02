/// @description Checks if it's the first time playing

ftp_file = working_directory + "/config.ini";

if (!file_exists(ftp_file)) {
    ini_open(ftp_file);
    ini_write_real("Game Setup", "first_time", 1);
    ini_close();
    
    // Return true
    return false;
} else {
    // False if not first time
    return false;
}
