const hostname = window.location.hostname;

// Detect localhost or local network
const isLocal =
    hostname === "localhost" ||
    hostname === "127.0.0.1" ||
    hostname.startsWith("192.168.") ||
    hostname.startsWith("10.") ||
    /^172\.(1[6-9]|2\d|3[0-1])\./.test(hostname);

// App configuration
window.APP_CONFIG = {
    BASE_MAP_URL: isLocal
        ? "./resource/base_map.dat"
        : "https://dl.dropboxusercontent.com/scl/fi/cyy474ht8fwaejih07trq/base_map.dat?rlkey=ib7kwtu1r2ghm84iqbh4ku3tu&st=jzjpnzg6&dl=1"
};