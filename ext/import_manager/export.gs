/*
 * Google Spreadsheet Script to export data in all sheets in the current spreadsheet as individual csv files
 * files will be named according to the name of the sheet
 */

function onOpen() {

    var ss = SpreadsheetApp.getActiveSpreadsheet();
    var csvMenuEntries = [{name: "export as csv files", functionName: "saveAsCSV"}];
    ss.addMenu("CSV Export", csvMenuEntries);
}

/**
 * Google Spreadsheet Script
 */

function saveAsCSV() {

    var ss = SpreadsheetApp.getActiveSpreadsheet();
    var sheets = ss.getSheets();
    // create a folder from the name of the spreadsheet
    var folder = DriveApp.createFolder(ss.getName().toLowerCase().replace(/ /g,'_') + '_csv_' + new Date().getTime());

    /*
     for (var i = 0 ; i < sheets.length ; i++) {
     var sheet = sheets[i];
     // append ".csv" extension to the sheet name
     fileName = sheet.getName() + ".csv";
     // convert all available sheet data to csv format
     var csvFile = convertRangeToCsvFile(fileName, sheet);
     // create a file in the Docs List with the given name and the csv data
     folder.createFile(fileName, csvFile);
     }
    */

    /*
     var csvFile_slot = convertRangeToCsvFile('', sheets[0]);
     var csvFile_location = convertRangeToCsvFile('', sheets[1]);
     var csvFile_group = convertRangeToCsvFile('', sheets[2]);
    */

    var csvFile_slot = sheets[0].getDataRange().getDisplayValues();
    var csvFile_location = sheets[1].getDataRange().getDisplayValues();
    var csvFile_group = sheets[2].getDataRange().getDisplayValues();
    var csvFile_user = sheets[3].getDataRange().getDisplayValues();
    var jsonFile_slot = [];

    for(var i = 0; i < csvFile_slot.length; i++){

        if(csvFile_slot[i][0] === '') continue;

        var new_slot = {};

        // Slot:
        new_slot[0] = csvFile_slot[i][0];
        new_slot[1] = csvFile_slot[i][1];
        new_slot[2] = csvFile_slot[i][2];
        new_slot[3] = csvFile_slot[i][3];
        new_slot[4] = csvFile_slot[i][4];
        new_slot[5] = csvFile_slot[i][5];
        new_slot[6] = csvFile_slot[i][6];
        new_slot[7] = csvFile_slot[i][7];

        // Location:
        new_slot[8] = csvFile_slot[i][8];
        new_slot[9] = csvFile_slot[i][9];
        new_slot[10] = csvFile_slot[i][10];
        new_slot[11] = csvFile_slot[i][11];
        new_slot[12] = csvFile_slot[i][12];
        new_slot[13] = csvFile_slot[i][13];

        // Location (Associated):
        if(csvFile_slot[i][13]){

            for(var a = 0; a < csvFile_location.length; a++){

                if(csvFile_location[a][0] === '') continue;

                if(csvFile_location[a][1] == csvFile_slot[i][13]){

                    new_slot[8]  = csvFile_location[a][1];
                    new_slot[9]  = csvFile_location[a][2];
                    new_slot[10] = csvFile_location[a][3];
                    new_slot[11] = csvFile_location[a][4];
                    new_slot[12] = csvFile_location[a][5];
                    new_slot[13] = csvFile_location[a][1];

                    break;
                }
            }
        }

        // Group (Associated):
        if(csvFile_slot[i][14]){

            for(var a = 0; a < csvFile_group.length; a++){

                if(csvFile_group[a][0] === '') continue;

                if(csvFile_group[a][2] == csvFile_slot[i][14]){

                    new_slot[14]  = csvFile_group[a][1];
                    new_slot[15]  = csvFile_group[a][2];
                    new_slot[16]  = csvFile_group[a][3];
                    new_slot[17]  = csvFile_group[a][4];

                    // User (Associated):
                    if(csvFile_group[a][4]){

                        for(var b = 0; b < csvFile_user.length; b++){

                            if(csvFile_user[b][0] === '') continue;

                            if(csvFile_user[b][1] == csvFile_group[a][4]){

                                new_slot[18]  = csvFile_user[b][1];
                                new_slot[19]  = csvFile_user[b][2];
                                new_slot[20]  = csvFile_user[b][3];
                                new_slot[21]  = csvFile_user[b][4];

                                break;
                            }
                        }
                    }
                    else{

                        new_slot[18] = '';
                        new_slot[19] = '';
                        new_slot[20] = '';
                        new_slot[21] = '';
                    }

                    break;
                }
            }
        }
        else{

            new_slot[14] = '';
            new_slot[15] = '';
            new_slot[16] = '';
            new_slot[17] = '';
            new_slot[18] = '';
            new_slot[19] = '';
            new_slot[20] = '';
            new_slot[21] = '';
        }

        if(i > 0){

            var tmp = {};

            // Slot:
            tmp[csvFile_slot[0][0]] = new_slot[0];
            tmp[csvFile_slot[0][1]] = new_slot[1];
            tmp[csvFile_slot[0][2]] = new_slot[2];
            tmp[csvFile_slot[0][3]] = new_slot[3];
            tmp[csvFile_slot[0][4]] = new_slot[4];
            tmp[csvFile_slot[0][5]] = new_slot[5];
            tmp[csvFile_slot[0][6]] = new_slot[6];
            tmp[csvFile_slot[0][7]] = new_slot[7];

            tmp['start'] = new_slot[2] + 'T' + new_slot[3]; // Start Date + Start Time
            tmp['end']   = new_slot[4] + 'T' + new_slot[5]; // End Date + End Time

            // Location:
            tmp['location'] = {};
            tmp['location'][csvFile_slot[0][8]] = new_slot[8];
            tmp['location'][csvFile_slot[0][9]] = new_slot[9];
            tmp['location'][csvFile_slot[0][10]] = new_slot[10];
            tmp['location'][csvFile_slot[0][11]] = new_slot[11];
            tmp['location'][csvFile_slot[0][12]] = new_slot[12];
            tmp['location'][csvFile_slot[0][13]] = new_slot[13];

            // Group:
            tmp['group'] = {};
            tmp['group'][csvFile_slot[0][14]] = new_slot[14];
            tmp['group'][csvFile_slot[0][15]] = new_slot[15];
            tmp['group'][csvFile_slot[0][16]] = new_slot[16];
            tmp['group'][csvFile_slot[0][17]] = new_slot[17];

            // User:
            tmp['user'] = {};
            tmp['user'][csvFile_slot[0][18]] = new_slot[18];
            tmp['user'][csvFile_slot[0][19]] = new_slot[19];
            tmp['user'][csvFile_slot[0][20]] = new_slot[20];
            tmp['user'][csvFile_slot[0][21]] = new_slot[21];

            jsonFile_slot.push(tmp);
        }
        else{

            csvFile_slot[0][8]  = csvFile_location[0][1];
            csvFile_slot[0][9]  = csvFile_location[0][2];
            csvFile_slot[0][10] = csvFile_location[0][3];
            csvFile_slot[0][11] = csvFile_location[0][4];
            csvFile_slot[0][12] = csvFile_location[0][5];
            csvFile_slot[0][13] = csvFile_location[0][1];

            csvFile_slot[0][14]  = csvFile_group[0][1];
            csvFile_slot[0][15]  = csvFile_group[0][2];
            csvFile_slot[0][16]  = csvFile_group[0][3];
            csvFile_slot[0][17]  = csvFile_group[0][4];

            csvFile_slot[0][18]  = csvFile_user[0][1];
            csvFile_slot[0][19]  = csvFile_user[0][2];
            csvFile_slot[0][20]  = csvFile_user[0][3];
            csvFile_slot[0][21]  = csvFile_user[0][4];
        }
    }

    folder.createFile("Timeslot-Export.json", JSON.stringify(jsonFile_slot));
    //folder.createFile("Timeslot-Export.csv", csvFile_slot);

    Browser.msgBox('Files are waiting in a folder named ' + folder.getName());
}

/**
 * Google Spreadsheet Script
 * @param csvFileName
 * @param sheet
 * @returns {undefined}
 * @private
 */

function convertRangeToCsvFile(csvFileName, sheet) {

    // get available data range in the spreadsheet
    var activeRange = sheet.getDataRange();

    try {

        var data = activeRange.getValues();
        var csvFile = undefined;

        // loop through the data in the range and build a string with the csv data
        if (data.length > 1) {

            var csv = "";

            for (var row = 0; row < data.length; row++) {

                for (var col = 0; col < data[row].length; col++) {

                    if (data[row][col].toString().indexOf(",") != -1) {

                        data[row][col] = "\"" + data[row][col] + "\"";
                    }
                }

                // join each row's columns
                // add a carriage return to end of each row, except for the last one
                if (row < data.length-1) {

                    csv += data[row].join(",") + "\r\n";
                }
                else {

                    csv += data[row];
                }
            }

            csvFile = csv;
        }

        return csvFile;
    }
    catch(err) {

        Logger.log(err);
        Browser.msgBox(err);
    }
}
