const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json({ limit: "50mb" }));
app.use(express.urlencoded({ extended: true }));

app.get("/", (_req, res, next) => {
  res.json({ message: "server is running", time: new Date() });
  next();
});

app.get("/calc", (_req, res, next) => {
  let x = Math.random() * (1000 - 0.001) + 0.001;
  for (let i = 0; i < 1000000; i++) {
    x += Math.sqrt(x);
  }
  console.log("count %d", x);
  res.json({ count: x });
  next();
});

app.listen(8090, () => {
  console.log("server is running on port 8090");
});
