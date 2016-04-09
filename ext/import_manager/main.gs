/**
 * Google Spreadsheet Script
 * @param input
 * @returns {string}
 * @constructor
 */

function GetSHA1(input) {

    var rawHash = Utilities.computeDigest(Utilities.DigestAlgorithm.SHA_1, input);
    var txtHash = '';

    for(j = 0; j < rawHash.length; j++) {

        var hashVal = rawHash[j];

        if(hashVal < 0) hashVal += 256;
        if(hashVal.toString(16).length == 1) txtHash += "0";

        txtHash += hashVal.toString(16);
    }

    return txtHash;
}

/**
 * Google Spreadsheet Script
 * @param input
 * @returns {string}
 * @constructor
 */

function GetUID(input){

    Utilities.sleep(Math.random()*1000);

    bytes = GetSHA1(input + 'TS Public Calendars');

    return [

        bytes.substring(0, 8),
        '-',
        bytes.substring(8, 12),
        '-',
        bytes.substring(12, 16),
        '-',
        bytes.substring(16, 20),
        '-',
        bytes.substring(20, 32)

    ].join('').toUpperCase()
}
