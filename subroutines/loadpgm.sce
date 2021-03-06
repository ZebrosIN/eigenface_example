function[M] = loadpgm(filename)

//       1         2         3         4         5         6         7
//34567890123456789012345678901234567890123456789012345678901234567890
//////////////////////////////////////////////////////////////////////
//
// Function: M = loadpgm(filename)
//
// Load the P5 grayscale PGM image with 92*112 only.
//
//--------------------------------------------------------------------
//       Author: Nik Mohamad Aizuddin bin Nik Azmi
// Date Created: 29-MAR-2015
//--------------------------------------------------------------------
//
//////////////////////////////////////////////////////////////////////

    // Open the image file.
    [fd, err] = mopen(filename, 'rb');
    if err ~= 0
        disp('ERROR: Cant open image file!');
        return(-1);
    end

    // Jump to offset 14, which contains the data pixels.
    mseek(14, fd, 'set');

    // Read the data pixels and saved into matrix M.
    M = mget(92*112, 'uc', fd);

    mclose(fd);

endfunction