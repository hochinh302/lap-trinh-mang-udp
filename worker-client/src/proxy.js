const express = require("express");
const dgram = require("dgram");
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require("path");

const app = express();
const udpClient = dgram.createSocket("udp4");

app.use(cors());
app.use(bodyParser.json());

// Serve giao diện
app.use(express.static(path.join(__dirname, "view")));

// Hàm gửi UDP đến Java server
function sendUdpRequest(message) {
  return new Promise((resolve, reject) => {
    const msg = Buffer.from(JSON.stringify(message));
    udpClient.send(msg, 8888, "localhost", (err) => {
      if (err) return reject(err);
    });

    udpClient.once("message", (response) => {
      try {
        resolve(JSON.parse(response.toString()));
      } catch (e) {
        reject(e);
      }
    });
  });
}

// Trang chủ
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "view", "index.html"));
});

// API lấy danh sách quê quán
app.get("/api/hometowns", async (req, res) => {
  try {
    const request = {
      service: "HOMETOWN_SERVICE",
      action: "GET_HOMETOWN",
      data: {},
    };
    const response = await sendUdpRequest(request);
    res.json(response);
  } catch (err) {
    console.error("UDP error:", err);
    res.status(500).json({ status: "99", message: "UDP error" });
  }
});

// API lấy danh sách công nhân
app.get("/api/workers", async (req, res) => {
  try {
    const request = {
      service: "WORKER_SERVICE",
      action: "GET",
      data: {},
    };
    const response = await sendUdpRequest(request);
    res.json(response);
  } catch (err) {
    res.status(500).json({ status: "99", message: "UDP error" });
  }
});

// API thêm công nhân
app.post("/api/workers/create", async (req, res) => {
  try {
    const request = {
      service: "WORKER_SERVICE",
      action: "INSERT",
      data: req.body,
    };
    const response = await sendUdpRequest(request);
    res.json(response);
  } catch (err) {
    res.status(500).json({ status: "99", message: "UDP error" });
  }
});

app.listen(3000, () =>
  console.log("Proxy API running at http://localhost:3000")
);
