const { spawn } = require("child_process");
const WebSocket = require("ws");

// create websocket server
// open "client.html" in a browser and see how the images flaps between two
const wss = new WebSocket.Server({
    port: 8080
});


// feedback
wss.on("connection", function connection(ws) {
    console.log("Client conneted to websocket");
});


// spawn python child process
const py = spawn("python3", ["image.py"]);

console.log("Python image manipulating process has pid:", py.pid)

// listen for the new image
py.stdout.on("data", (data) => {

    // broadcast the new binary image to all clients
    wss.clients.forEach((client) => {
        if (client.readyState === WebSocket.OPEN) {
            client.send(data);
        }
    });

});


py.stderr.on("data", (data) => {
    console.error(data.toString());
});
