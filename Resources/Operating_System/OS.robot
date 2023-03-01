*** Settings ***
Library                             OperatingSystem

*** Variables ***
${output_directory}                 Outputs
${directory_1}                      first directory
${directory_2}                      second directory
${file_1}                           first file.txt
${file_2}                           second file.txt
${file_3}                           third file.txt

*** Keywords ***
Create Base Directory
    create directory                ${output_directory}
    should exist                    ${output_directory}

Create Directory 1
    ${directory_path}               join path           ${output_directory}     ${directory_1}
    create directory                ${directory_path}
    should exist                    ${directory_path}

Create Directory 2
    ${directory_path}               join path           ${output_directory}     ${directory_2}
    create directory                ${directory_path}
    should exist                    ${directory_path}

Create File 1
    ${file_path}                    join path           ${output_directory}     ${directory_1}      ${file_1}
    create file                     ${file_path}        This is some text in the first file
    should exist                    ${file_path}

Create File 2
    ${file_path}                    join path           ${output_directory}     ${directory_2}      ${file_2}
    create file                     ${file_path}        This is some text in the second file
    should exist                    ${file_path}

Create File 3
    ${file_path}                    join path           ${output_directory}     ${directory_2}      ${file_3}
    create file                     ${file_path}        This is some text in the third file
    should exist                    ${file_path}

Move File 3 from Directory 2 to Directory 1
    ${source_path}                  join path           ${output_directory}     ${directory_2}      ${file_3}
    ${target_path}                  join path           ${output_directory}     ${directory_1}      ${file_3}

    move file                       ${source_path}      ${target_path}

    should exist                    ${target_path}
    should not exist                ${source_path}

Copy File 1 from Directory 1 to Directory 2
    ${source_path}                  join path           ${output_directory}     ${directory_1}      ${file_1}
    ${target_path}                  join path           ${output_directory}     ${directory_2}      ${file_1}

    copy file                       ${source_path}      ${target_path}

    should exist                    ${source_path}
    should exist                    ${target_path}