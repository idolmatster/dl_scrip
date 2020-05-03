const lineReader = require('line-reader');

const path = "./linkle";
const baselink = "https://archive.org/download/no-intro-rom-sets/Nintendo - Game Boy Advance (20200325-060356).zip/";
const ext = ".zip"

lineReader.eachLine(path, function(line) {
    const extLink = line.split(ext);
    console.log(baselink + extLink[0] + ext);
});